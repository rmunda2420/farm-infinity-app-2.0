import 'dart:async';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/FarmerApplication.dart';
import 'package:farm_infinity/repositories/farmer/bio_repo.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:farm_infinity/widgets/auto_save_text_form_field.dart';
import 'package:farm_infinity/widgets/my_mask_cam_two_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/constants.dart';
import '../models/AadhaarId.dart';
import '../models/AadhaarKycOcrDataBack.dart';
import '../models/AadhaarKycOcrDataFront.dart';
import '../models/Bio.dart';
import '../widgets/auto_save_multiline_text_form_field.dart';
import '../widgets/custom_rounded_elevated_button.dart';
import 'farmer_activity_page.dart';
import 'loading_page.dart';

class FarmerBioPage extends StatefulWidget {
  final String userId;
  final String applicationId;
  final bool isNewForm;

  const FarmerBioPage(
      {super.key,
      required this.userId,
      required this.applicationId,
      required this.isNewForm});

  @override
  State<FarmerBioPage> createState() => _FarmerBioPageState();
}

class _FarmerBioPageState extends State<FarmerBioPage> {
  String cloudPathProfilePhoto =
      'https://s3-${Constants.region}.amazonaws.com/${dotenv.env['BUCKET_NAME']}/';

  String? profilePhotoUrl = '';

  //bool isPhotoAttached = false;
  final _formKey = GlobalKey<FormState>();

  late String _bioRefId;

  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController dobFieldController = TextEditingController();
  final TextEditingController addressFieldController = TextEditingController();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController altPhoneFieldController = TextEditingController();
  final TextEditingController cityFieldController = TextEditingController();
  final TextEditingController districtFieldController = TextEditingController();
  final TextEditingController pinFieldController = TextEditingController();
  final TextEditingController stateFieldController = TextEditingController();

  Future<void> _prePopulateAndSaveData() async {
    Completer<void> completer = Completer<void>();

    try {
      // Fill the ocr data for Aadhaar
      final List<AadhaarId> aadhaarIds = await Amplify.DataStore.query(
        AadhaarId.classType,
        where: AadhaarId.USERID.eq(widget.userId),
      );

      // Assuming the first item in the list is the desired data
      final AadhaarId aadhaarId = aadhaarIds.first;

      // Query related objects
      final List<AadhaarKycOcrDataFront> frontDataList =
          await Amplify.DataStore.query(
        AadhaarKycOcrDataFront.classType,
        where: AadhaarKycOcrDataFront.ID
            .eq(aadhaarId.aadhaarIdAadhaarToAadhaarKycOcrFrontId),
      );

      final List<AadhaarKycOcrDataBack> backDataList =
          await Amplify.DataStore.query(
        AadhaarKycOcrDataBack.classType,
        where: AadhaarKycOcrDataBack.ID
            .eq(aadhaarId.aadhaarIdAadhaarToAadhaarKycOcrBackId),
      );

      // Assuming there's only one related item, you can use firstOrNull
      final AadhaarKycOcrDataFront? frontData = frontDataList.firstOrNull;
      final AadhaarKycOcrDataBack? backData = backDataList.firstOrNull;

      // Set text field values using controllers
      nameFieldController.text = frontData?.name ?? '';
      dobFieldController.text = frontData?.dob ?? '';
      addressFieldController.text = backData?.addressFull ?? '';
      cityFieldController.text = backData?.city ?? '';
      stateFieldController.text = backData?.state ?? '';
      pinFieldController.text = backData?.pin ?? '';

      // Create bio
      final bio = Bio(
          name: nameFieldController.text.trim(),
          dob: dobFieldController.text.trim(),
          fullAddress: addressFieldController.text.trim(),
          city: cityFieldController.text.trim(),
          state: stateFieldController.text.trim(),
          pin: pinFieldController.text.trim(),
          isComplete: false);

      BioRepo bioRepo = BioRepo();
      await bioRepo.create(bio);

      // Add reference of bio in FarmerApplication model

      // Get the application
      final List<FarmerApplication> oldApplications =
          await Amplify.DataStore.query(FarmerApplication.classType,
              where: FarmerApplication.APPLICATIONID.eq(widget.applicationId));

      final FarmerApplication newApplication =
          oldApplications.first.copyWith(farmerApplicationFarmerApplicationToBioId: bio.id);
      // Update the application
      await Amplify.DataStore.save(newApplication);
      safePrint('bio reference id is: ${bio.id}');
      // Important
      _bioRefId = bio.id;

      completer.complete();
    } catch (e) {
      safePrint('Error in populating pre-data: $e');
      completer.completeError(e);
    }
    return completer.future;
  }

  Future<void> _populateData() async {
    Completer<void> completer = Completer<void>();
    try {
      // Get the application
      final List<FarmerApplication> applications =
          await Amplify.DataStore.query(FarmerApplication.classType,
              where: FarmerApplication.APPLICATIONID.eq(widget.applicationId));
      FarmerApplication application = applications.first;
      // Important
      _bioRefId = application.farmerApplicationFarmerApplicationToBioId!;
      // Get the bio of the application
      final List<Bio> bios = await Amplify.DataStore.query(
        Bio.classType,
        where: Bio.ID.eq(application.farmerApplicationFarmerApplicationToBioId),
      );
      if (bios.isNotEmpty) {
        final Bio bio = bios.first;
        // Set text field values using controllers
        nameFieldController.text = bio.name?.toString() ?? '';
        dobFieldController.text = bio.dob?.toString() ?? '';
        emailFieldController.text = bio.email?.toString() ?? '';
        altPhoneFieldController.text = bio.altPhone?.toString() ?? '';
        addressFieldController.text = bio.fullAddress?.toString() ?? '';
        districtFieldController.text = bio.district?.toString() ?? '';
        cityFieldController.text = bio.city?.toString() ?? '';
        stateFieldController.text = bio.state?.toString() ?? '';
        pinFieldController.text = bio.pin?.toString() ?? '';
        // bind photo
        profilePhotoUrl = (bio.profilePicUrl?.toString() ?? '') != ''
            ? '${cloudPathProfilePhoto}public/${bio.profilePicUrl}'
            : '';
        safePrint('Populate successful');
        // Complete the future successfully
        completer.complete();
      } else {
        // Handle case where no applications are found for the specified userId
        safePrint('No bio found for applicationId: $widget.applicationId');
        completer.completeError('No bio found');
      }
    } catch (e) {
      safePrint('Error in fetching bio: $e');
      completer.completeError('Error in fetching bio');
    }
    return completer.future;
  }

  // Keep code not in use
  /*Future<void> _populateData() async {
    Completer<void> completer = Completer<void>();
    try {
      // Get all the applications of current user
      // Method A(More direct)
      final List<FarmerApplication> applications =
      await Amplify.DataStore.query(
        FarmerApplication.classType,
        where: FarmerApplication.APPLICATIONID.eq(widget.applicationId),
      );

      // Method B(not in use but keep for knowledge)
      /* final List<FarmerApplication> applications =
          await Amplify.DataStore.query(
        FarmerApplication.classType,
        where: FarmerApplication.USERID.eq(widget.userId),
      );*/

      if (applications.isNotEmpty) {
        // For method A(directly fetching the application and it is returned as a list)
        final FarmerApplication application = applications.first;
        //Method B
        /*final FarmerApplication application = applications.firstWhere(
          (app) => app.activityId.toString() == widget.applicationId,
        );*/

        // Get the bio of the application
        final List<Bio> bios = await Amplify.DataStore.query(
          Bio.classType,
          where: Bio.ID.eq(application.farmerApplicationBioRefId),
        );
        if (bios.isNotEmpty) {
          final Bio bio = bios.first;
          // Set text field values using controllers
          nameFieldController.text = bio.name?.toString() ?? '';
          dobFieldController.text = bio.dob?.toString() ?? '';
          emailFieldController.text = bio.email?.toString() ?? '';
          altPhoneFieldController.text = bio.altPhone?.toString() ?? '';
          addressFieldController.text = bio.fullAddress?.toString() ?? '';
          districtFieldController.text = bio.district?.toString() ?? '';
          cityFieldController.text = bio.city?.toString() ?? '';
          stateFieldController.text = bio.state?.toString() ?? '';
          pinFieldController.text = bio.pin?.toString() ?? '';
          safePrint('Populate successful');
          // Complete the future successfully
          completer.complete();
        } else {
          // Handle case where no applications are found for the specified userId
          safePrint('No bio found for applicationId: $widget.applicationId');
          completer.completeError('No bio found');
        }
      }
    } catch (e) {
      safePrint('Error fetching data: $e');
      completer.completeError(e);
    }
    return completer.future;
  }*/

  // Navigate to farmer activity page
  void _navigateToNextScreen(BuildContext context, applicationId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FarmerActivityPage(
          applicationId: applicationId,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.isNewForm ? _prePopulateAndSaveData() : _populateData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else if (snapshot.hasError) {
          // Show error page
          safePrint('Error: ${snapshot.error}');
          // You might want to return an error widget or handle the error here
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: AppColor.primaryColor,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  //color: AppColor.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          // Picture box starts here
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 111,
                              height: 111,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor
                                    .whiteColor, // Change the color as needed
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    child: Container(
                                      width: 110.0,
                                      height: 110.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: ClipOval(
                                        child: profilePhotoUrl != ''
                                            ? Image.network(
                                                profilePhotoUrl!,
                                                fit: BoxFit.cover,
                                              )
                                            : SvgPicture.asset(
                                                'assets/icons/icon_avatar.svg',
                                                // Set the height of the image
                                                fit: BoxFit
                                                    .cover, // Adjust the BoxFit as needed
                                              ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 10,
                                    child: Container(
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.white30,
                                        onTap: () async {
                                          // Define a callback function to handle the captured image
                                          void onImageCaptured(File? imgFile) {
                                            if (imgFile != null) {
                                              Navigator.pop(context);
                                              // Upload to S3
                                              uploadPic(imgFile.path);
                                            }
                                          }

                                          // Opening the camera and passing the above callback function
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyMaskProfilePhotoCamera(
                                                onImageCaptured:
                                                    onImageCaptured,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/icon_camera.svg',
                                            // Replace with your image asset path
                                            fit: BoxFit
                                                .cover, // Adjust the BoxFit as needed
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Ends here
                          // Name starts here
                          AutoSaveTextFormField<BioRepo>(
                            id: _bioRefId,
                            keyToUpdate: 'name',
                            label: 'Name',
                            labelColor: AppColor.whiteColor,
                            textFieldBackgroundColor: AppColor.whiteColor,
                            controller: nameFieldController,
                            dataRepository: BioRepo(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Date of birth starts here
                          AutoSaveTextFormField<BioRepo>(
                            id: _bioRefId,
                            keyToUpdate: 'dob',
                            label: 'Date Of Birth',
                            labelColor: AppColor.whiteColor,
                            textFieldBackgroundColor: AppColor.whiteColor,
                            controller: dobFieldController,
                            dataRepository: BioRepo(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter date of birth';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Address starts here
                          AutoSaveMultilineTextFormField(
                            id: _bioRefId,
                            keyToUpdate: 'fullAddress',
                            label: 'Address',
                            controller: addressFieldController,
                            dataRepository: BioRepo(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Email starts here
                          AutoSaveTextFormField(
                            id: _bioRefId,
                            keyToUpdate: 'email',
                            label: 'Email',
                            labelColor: AppColor.whiteColor,
                            textFieldBackgroundColor: AppColor.whiteColor,
                            controller: emailFieldController,
                            dataRepository: BioRepo(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Alt phone starts here
                          AutoSaveTextFormField(
                            id: _bioRefId,
                            keyToUpdate: 'altPhone',
                            label: 'Alt. Phone',
                            labelColor: AppColor.whiteColor,
                            textFieldBackgroundColor: AppColor.whiteColor,
                            controller: altPhoneFieldController,
                            dataRepository: BioRepo(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // City starts here
                          AutoSaveTextFormField(
                            id: _bioRefId,
                            keyToUpdate: 'city',
                            label: 'City',
                            labelColor: AppColor.whiteColor,
                            textFieldBackgroundColor: AppColor.whiteColor,
                            controller: cityFieldController,
                            dataRepository: BioRepo(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter city';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AutoSaveTextFormField(
                            id: _bioRefId,
                            keyToUpdate: 'state',
                            label: 'State',
                            labelColor: AppColor.whiteColor,
                            textFieldBackgroundColor: AppColor.whiteColor,
                            controller: stateFieldController,
                            dataRepository: BioRepo(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter state';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AutoSaveTextFormField(
                            id: _bioRefId,
                            keyToUpdate: 'pin',
                            label: 'PIN',
                            labelColor: AppColor.whiteColor,
                            textFieldBackgroundColor: AppColor.whiteColor,
                            controller: pinFieldController,
                            dataRepository: BioRepo(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter pin code';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          CustomRoundedElevatedButton(
                            text: 'Next',
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                BioRepo bioRepo = BioRepo();
                                bioRepo.completeLevel(widget.applicationId);

                                _navigateToNextScreen(
                                    context, widget.applicationId);
                              }
                            },
                            backgroundColor: AppColor.accentColor,
                            textColor: AppColor.whiteColor,
                            fontSize: 22,
                            width: 160,
                            height: 44,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            // Add this line for debugging
            // This is the part that was missing
            return const SizedBox
                .shrink(); // You can return an empty container or a loading indicator here
          }
        }
        return const SizedBox.shrink();
      },
    );
  }

  Future<void> uploadPic(String filePath) async {
    // Generate a timestamp
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    // Extract filename without extension
    final fileName = filePath.split('/').last.split('.').first;
    // Specify the folder path in S3
    const folderPath = 'ProfilePhoto';
    try {
      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromPath(filePath),
        key: '$folderPath/$fileName-$timestamp.${filePath.split('.').last}',
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.fractionCompleted}');
        },
      ).result;
      safePrint('Successfully uploaded file: ${result.uploadedItem.key}');
      // Save in database
      BioRepo bioRepo = BioRepo();
      bioRepo.uploadedProfilePhotoPath(
          widget.applicationId, result.uploadedItem.key);
      setState(() {
        profilePhotoUrl =
            '$cloudPathProfilePhoto.public/.${result.uploadedItem.key}';
      });
    } on StorageException catch (e) {
      safePrint('Error uploading file: $e');
      rethrow;
    } catch (e) {
      safePrint('Error saving file path: $e');
      rethrow;
    }
  }
}
