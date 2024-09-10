import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:farm_infinity/screens/aadhaar_kyc_back_upload_activity_page.dart';
import 'package:farm_infinity/screens/aadhaar_kyc_upload_activity_intermediate_page.dart';
import 'package:farm_infinity/screens/farmer_dashboard_page.dart';
import 'package:farm_infinity/screens/loading_page.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:farm_infinity/widgets/avatar_container.dart';
import 'package:farm_infinity/widgets/custom_rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/farmer/kyc/aadhaar_front/aadhaar_kyc_upload_activity_bloc.dart';
import '../blocs/farmer/kyc/aadhaar_front/extract_verify_save_aadhaar_front_cubit.dart';
import '../enums/modes.dart';
import '../models/AadhaarId.dart';

class AadhaarKycFrontUploadActivityPage extends StatefulWidget {
  static const routeName = '/docUploadContainer';
  final String userId;

  const AadhaarKycFrontUploadActivityPage({super.key, required this.userId});

  @override
  State<AadhaarKycFrontUploadActivityPage> createState() =>
      _AadhaarKycFrontUploadActivityPageState();
}

class _AadhaarKycFrontUploadActivityPageState
    extends State<AadhaarKycFrontUploadActivityPage> {
  // Using graphQL
  Future<bool> fetchAadhaarVerificationStatus(String userId) async {
    try {
      final request = ModelQueries.list(
        AadhaarId.classType,
        where: AadhaarId.USERID.eq(userId),
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.data!.items.isEmpty) {
        safePrint('Aadhaar ids not found: ${response.errors}');
        return false;
      }
      final aadhaarId = response.data?.items.first;
      final bool isVerified = aadhaarId!.verified ?? false;
      safePrint('Verification Status for Aadhaar $userId: $isVerified');
      return isVerified;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return false;
    }
  }
  // Using Datastore api(not in use) not giving current state sometimes
  /*Future<bool> fetchAadhaarVerificationStatus(String userId) async {
    try {
      // Replace 'AadhaarId' with the actual name of your DataStore model
      final List<AadhaarId> aadhaarIds = await Amplify.DataStore.query(
        AadhaarId.classType,
        where: AadhaarId.USERID.eq(userId),
      );

      if (aadhaarIds.isNotEmpty) {
        final AadhaarId aadhaarId = aadhaarIds.first;
        final bool isVerified = aadhaarId.verified ?? false;

        safePrint('Verification Status for aadhaar $userId: $isVerified');
        return isVerified;
      } else {
        safePrint('AadhaarId not found for User $userId');
      }
    } catch (e) {
      safePrint('Error fetching AadhaarId: $e');
    }
    return false;
  }*/

  Future<bool> initializeAadhaarCheck() async {
    return await fetchAadhaarVerificationStatus(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    /*final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;*/
    return FutureBuilder<bool>(
      future: initializeAadhaarCheck(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator if the data is still being fetched
          return const LoadingPage();
        } else if (snapshot.hasError) {
          // Handle the error state
          safePrint('Error while fetching aadhaar status');
        } else if (snapshot.hasData) {
          // Check the verification status and navigate accordingly
          if (snapshot.data == true) {
            return FarmerDashboardPage(
              userId: widget.userId,
            );
          } else {
            return Scaffold(
              body: Center(
                child: Stack(
                  children: [
                    Container(
                      color: AppColor.primaryColor,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: AvatarContainer(
                          avatarSourcePath: 'assets/icons/icon_avatar.svg',
                          userId: widget.userId),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 160.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: AppColor.whiteColor,
                          // Container fields
                          // This goes in bloc
                          child: FieldsContainer(userId: widget.userId),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        // Show error page
        return Container();
      },
    );
  }
}

class FieldsContainer extends StatelessWidget {
  final String userId;

  const FieldsContainer({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AadhaarKycUploadActivityBloc(),
      child: _FieldState(
        userId: userId,
      ),
    );
  }
}

class _FieldState extends StatelessWidget {
  final String userId;

  const _FieldState({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AadhaarKycUploadActivityBloc,
        AadhaarKycUploadActivityState>(
      builder: (context, state) {
        switch (state.mode) {
          case Mode.select:
            return _buildCaseSelectWidget(context, state);
          case Mode.edit:
            return _buildCaseEditWidget(context, state);
          case Mode.upload:
            return _buildCaseUploadWidget(context, state);
          default:
            return _buildCaseSelectWidget(context, state);
        }
      },
    );
  }

  Widget _buildCaseSelectWidget(
      BuildContext context, AadhaarKycUploadActivityState state) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Upload your Aadhaar',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        // Choose container starts here
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          color: AppColor.dashedBorder,
          dashPattern: const [
            12,
            10,
          ],
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              width: 320,
              height: 410,
              color: AppColor.lightBlueColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    child: Container(
                      width: 70,
                      height: 70,
                      color: AppColor.whiteColor,
                      child: Material(
                        type: MaterialType.transparency,
                        //elevation: 6.0,
                        color: Colors.transparent,
                        //shadowColor: Colors.grey[50],
                        child: InkWell(
                          splashColor: Colors.white30,
                          onTap: () async {
                            context
                                .read<AadhaarKycUploadActivityBloc>()
                                .add(FilePickerTapped());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/icon_upload_file.svg',
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Upload from gallery',
                    style:
                        TextStyle(fontSize: 16, color: AppColor.primaryColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    child: Container(
                      width: 70,
                      height: 70,
                      color: AppColor.whiteColor,
                      child: Material(
                        type: MaterialType.transparency,
                        //elevation: 6.0,
                        color: Colors.transparent,
                        //shadowColor: Colors.grey[50],
                        child: InkWell(
                          splashColor: Colors.white30,
                          onTap: () {
                            /*Open camera*/
                            context
                                .read<AadhaarKycUploadActivityBloc>()
                                .add(CameraTapped(context));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/icon_camera.svg',
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Click from camera',
                    style:
                        TextStyle(fontSize: 16, color: AppColor.primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        CustomRoundedElevatedButton(
            text: 'Next',
            onPressed: () {},
            backgroundColor: AppColor.disabledColor,
            textColor: AppColor.whiteColor,
            fontSize: 22,
            width: 160,
            height: 44),
        // ends here
      ],
    );
  }

  Widget _buildCaseEditWidget(
      BuildContext context, AadhaarKycUploadActivityState state) {
    ImageProvider defaultNoImage =
        const AssetImage('assets/images/no-pictures.png');
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Upload your Aadhaar',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        // Choose container starts here
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          color: AppColor.mediumBlueColor,
          dashPattern: const [
            12,
            0,
          ],
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              width: 320,
              height: 410,
              color: AppColor.whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 250,
                    child: Image(
                      fit: BoxFit.cover,
                      image: state.file != null
                          ? FileImage(File(state.file!.path))
                          : defaultNoImage,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 40,
                    color: AppColor.lightGreyColor,
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Stack(
                          children: [
                            Material(
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<AadhaarKycUploadActivityBloc>()
                                      .add(EditTapped());
                                },
                                child: const Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        CustomRoundedElevatedButton(
            text: 'Next',
            onPressed: () {
              context.read<AadhaarKycUploadActivityBloc>().add(UploadTapped());
              /*setState(() {
                widget.switchValue = 'upload';
              });*/
            },
            backgroundColor: AppColor.accentColor,
            textColor: AppColor.whiteColor,
            fontSize: 22,
            width: 160,
            height: 44),
        // ends here
      ],
    );
  }

  Widget _buildCaseUploadWidget(
      BuildContext context, AadhaarKycUploadActivityState state) {
    return BlocProvider(
      create: (context) => ExtractVerifySaveAadhaarFrontCubit(),
      child: BlocBuilder<ExtractVerifySaveAadhaarFrontCubit,
          ExtractVerifySaveAadhaarFrontState>(
        builder: (context, documentState) {
          switch (documentState.runtimeType) {
            case const (ExtractVerifySaveAadhaarFrontInitial):
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  context
                      .read<ExtractVerifySaveAadhaarFrontCubit>()
                      .saveKycDocument(state.file!.path);
                },
              );
              break;
            case const (Extracting):
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Upload your Aadhaar',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Choose container starts here
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    color: AppColor.lightBlueColor,
                    dashPattern: const [
                      12,
                      0,
                    ],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        width: 320,
                        height: 410,
                        color: AppColor.primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              height: 320,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        value: null,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColor.whiteColor),
                                        semanticsLabel: 'Uploading',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Extracting',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: SvgPicture.asset(
                                'assets/images/graphics_crop_1.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomRoundedElevatedButton(
                      text: 'Next',
                      onPressed: () {},
                      backgroundColor: AppColor.disabledColor,
                      textColor: AppColor.whiteColor,
                      fontSize: 22,
                      width: 160,
                      height: 44),
                  // ends here
                ],
              );
            case const (Extracted):
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Upload your Aadhaar',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Choose container starts here
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    color: AppColor.lightBlueColor,
                    dashPattern: const [
                      12,
                      0,
                    ],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        width: 320,
                        height: 410,
                        color: AppColor.primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              height: 320,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Extracted',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: SvgPicture.asset(
                                'assets/images/graphics_crop_1.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomRoundedElevatedButton(
                      text: 'Next',
                      onPressed: () {},
                      backgroundColor: AppColor.disabledColor,
                      textColor: AppColor.whiteColor,
                      fontSize: 22,
                      width: 160,
                      height: 44),
                  // ends here
                ],
              );
            case const (Verifying):
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Upload your Aadhaar',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Choose container starts here
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    color: AppColor.lightBlueColor,
                    dashPattern: const [
                      12,
                      0,
                    ],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        width: 320,
                        height: 410,
                        color: AppColor.primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              height: 320,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        value: null,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColor.whiteColor),
                                        semanticsLabel: 'Uploading',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Verifying',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: SvgPicture.asset(
                                'assets/images/graphics_crop_1.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomRoundedElevatedButton(
                      text: 'Next',
                      onPressed: () {},
                      backgroundColor: AppColor.disabledColor,
                      textColor: AppColor.whiteColor,
                      fontSize: 22,
                      width: 160,
                      height: 44),
                  // ends here
                ],
              );
            case const (Verified):
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Upload your Aadhaar',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Choose container starts here
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    color: AppColor.lightBlueColor,
                    dashPattern: const [
                      12,
                      0,
                    ],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        width: 320,
                        height: 410,
                        color: AppColor.primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              height: 320,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Verified',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: SvgPicture.asset(
                                'assets/images/graphics_crop_1.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomRoundedElevatedButton(
                      text: 'Next',
                      onPressed: () {},
                      backgroundColor: AppColor.disabledColor,
                      textColor: AppColor.whiteColor,
                      fontSize: 22,
                      width: 160,
                      height: 44),
                  // ends here
                ],
              );
            case const (Saving):
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Upload your Aadhaar',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Choose container starts here
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    color: AppColor.lightBlueColor,
                    dashPattern: const [
                      12,
                      0,
                    ],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        width: 320,
                        height: 410,
                        color: AppColor.primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              height: 320,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        value: null,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                AppColor.whiteColor),
                                        semanticsLabel: 'Uploading',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Saving',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: SvgPicture.asset(
                                'assets/images/graphics_crop_1.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomRoundedElevatedButton(
                      text: 'Next',
                      onPressed: () {},
                      backgroundColor: AppColor.disabledColor,
                      textColor: AppColor.whiteColor,
                      fontSize: 22,
                      width: 160,
                      height: 44),
                  // ends here
                ],
              );
            case const (Saved):
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Upload your Aadhaar',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Choose container starts here
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    color: AppColor.lightBlueColor,
                    dashPattern: const [
                      12,
                      0,
                    ],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        width: 320,
                        height: 410,
                        color: AppColor.primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              height: 320,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Saved',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: SvgPicture.asset(
                                'assets/images/graphics_crop_1.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomRoundedElevatedButton(
                      text: 'Next',
                      onPressed: () {
                        if (documentState is Saved) {
                          // safePrint(documentState.aadhaarDatabaseRefId);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AadhaarKycUploadActivityIntermediatePage(
                                aadhaarRefId:
                                    documentState.aadhaarDatabaseRefId,
                                userId: userId,
                              ),
                            ),
                          );
                        }
                      },
                      backgroundColor: AppColor.accentColor,
                      textColor: AppColor.whiteColor,
                      fontSize: 22,
                      width: 160,
                      height: 44),
                  // ends here
                ],
              );
            case const (Error):
              if (documentState is Error) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Upload your Aadhaar',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Choose container starts here
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      color: AppColor.lightBlueColor,
                      dashPattern: const [
                        12,
                        0,
                      ],
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Container(
                          width: 320,
                          height: 410,
                          color: AppColor.primaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 320,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        documentState.error,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: AppColor.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: SvgPicture.asset(
                                  'assets/images/graphics_crop_1.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomRoundedElevatedButton(
                        text: 'Retry',
                        onPressed: () {
                          context
                              .read<AadhaarKycUploadActivityBloc>()
                              .add(ProcessingError());
                        },
                        backgroundColor: AppColor.accentColor,
                        textColor: AppColor.whiteColor,
                        fontSize: 22,
                        width: 160,
                        height: 44),
                    // ends here
                  ],
                );
              }
              break;
            /*if (documentState is Error) {
                Fluttertoast.showToast(
                    msg: documentState.error,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }*/
          }
          // Add a default return statement
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
