import 'dart:async';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/InsuranceCustomerInfo.dart';
import 'package:farm_infinity/repositories/insurance/insurance_customer_info_repo.dart';
import 'package:farm_infinity/screens/officer_add_customer_livestock_policy_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;

import '../helper/constants.dart';
import '../helper/custom_dropdown_options.dart';
import '../styles/colors.dart';
import '../widgets/custom_rounded_elevated_button.dart';
import '../widgets/my_mask_cam_widget.dart';

class OfficerAddInsuranceCustomerPage extends StatefulWidget {
  const OfficerAddInsuranceCustomerPage({super.key});

  @override
  State<OfficerAddInsuranceCustomerPage> createState() =>
      _OfficerAddInsuranceCustomerPageState();
}

class _OfficerAddInsuranceCustomerPageState
    extends State<OfficerAddInsuranceCustomerPage> {
  late StreamSubscription<List<InsuranceCustomerInfo>> _subscription;

  String cloudPathKycPhoto =
      'https://s3-${Constants.region}.amazonaws.com/${dotenv.env['BUCKET_NAME']}/public/';

  final TextEditingController _searchController = TextEditingController();
  List<InsuranceCustomerInfo> _customers = [];
  List<InsuranceCustomerInfo> _filteredCustomers = [];

  late CustomDropdownItem selectedPoi;
  List<CustomDropdownItem> poiType = <CustomDropdownItem>[
    CustomDropdownItem(label: 'Select', value: 0),
    CustomDropdownItem(label: 'Pan', value: 1),
    CustomDropdownItem(label: 'Aadhaar', value: 2),
    CustomDropdownItem(label: 'Voter Card', value: 3)
  ];

  late CustomDropdownItem selectedPoa;
  List<CustomDropdownItem> poaType = <CustomDropdownItem>[
    CustomDropdownItem(label: 'Select', value: 0),
    CustomDropdownItem(label: 'Aadhaar', value: 1),
    CustomDropdownItem(label: 'Voter Card', value: 2)
  ];

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController poiNoController = TextEditingController();
  final TextEditingController poaNoController = TextEditingController();

  bool _isExecuting = false;

  @override
  void initState() {
    super.initState();
    _fetchCustomers();
    _searchController.addListener(_filterCustomers);
    _startSubscription(); // Start subscription
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCustomers);
    _searchController.dispose();
    _subscription.cancel(); // Cancel subscription
    super.dispose();
  }

  Future<void> _fetchCustomers() async {
    if (!mounted) return; // Ensure still mounted before calling setState
    setState(() {
      _isExecuting = true;
    });
    try {
      List<InsuranceCustomerInfo> customers =
          await Amplify.DataStore.query(InsuranceCustomerInfo.classType);
      if (!mounted) return;
      setState(() {
        _customers = customers;
        _filteredCustomers = customers;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isExecuting = false;
      }); // Ensure still mounted before calling setState
      _showSnackBar('Error fetching customers: $e');
      safePrint('Error fetching customers: $e');
    } finally {
      setState(() {
        _isExecuting = false;
      });
    }
  }

  void _startSubscription() {
    _subscription =
        Amplify.DataStore.observeQuery(InsuranceCustomerInfo.classType)
            .map((event) =>
                event.items.toList()) // Transform QuerySnapshot to List<T>
            .listen((List<InsuranceCustomerInfo> event) {
      setState(() {
        _customers = event;
        _filteredCustomers = event.where((customer) {
          String query = _searchController.text.toLowerCase();
          return customer.name!.toLowerCase().contains(query);
        }).toList();
      });
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: message.contains('fetching')
            ? const Duration(minutes: 5)
            : const Duration(
                seconds: 3), // Longer duration for fetching message
      ),
    );
  }

  void _filterCustomers() {
    if (!mounted) return; // Ensure still mounted before calling setState
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCustomers = _customers
          .where((customer) => customer.name!.toLowerCase().contains(query))
          .toList();
    });
  }

  void _showAddNewModalSheet(BuildContext context) {
    nameController.text = '';
    phoneNoController.text = '';
    villageController.text = '';
    selectedPoi = poiType[0];
    poiNoController.text = '';
    selectedPoa = poaType[0];
    poaNoController.text = '';

    _showModalSheet(context);
  }

  void _showEditModalSheet(
      BuildContext context, InsuranceCustomerInfo customer) {
    nameController.text = customer.name ?? '';
    phoneNoController.text = customer.phoneNo ?? '';
    villageController.text = customer.village ?? '';
    poiNoController.text = customer.poiNumber ?? '';
    poaNoController.text = customer.poaNumber ?? '';

    // Get the initial poi value from the farming object
    int fetchedPoiTypeId =
        customer.poiTypeId ?? 0; // replace 0 with a default value if necessary
    CustomDropdownItem fetchedPoiType = poiType.firstWhere(
        (type) => type.value == fetchedPoiTypeId,
        orElse: () =>
            poiType[0]); // replace units[0] with a default item if not found

    // Get the initial poi value from the farming object
    int fetchedPoaTypeId =
        customer.poaTypeId ?? 0; // replace 0 with a default value if necessary
    CustomDropdownItem fetchedPoaType = poaType.firstWhere(
        (type) => type.value == fetchedPoaTypeId,
        orElse: () =>
            poaType[0]); // replace units[0] with a default item if not found

    selectedPoi = fetchedPoiType;
    selectedPoa = fetchedPoaType;

    _showModalSheet(context, customer: customer);
  }

  // Function to download a file from a URL and save it to a temporary location
  Future<File?> downloadFileFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/${url.split('/').last}';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return file;
      } else {
        safePrint('Failed to download file: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      safePrint('Error downloading file: $e');
      return null;
    }
  }

  void _showModalSheet(BuildContext context,
      {InsuranceCustomerInfo? customer}) {
    File? capturedPoiFrontImageFile; // File to store captured image
    File? capturedPoiBackImageFile; // File to store captured image
    File? capturedPoaFrontImageFile; // File to store captured image
    File? capturedPoaBackImageFile; // File to store captured image

    // To update the image when the uploaded image is changed
    bool isPoiFrontImageChanged = false;
    bool isPoiBackImageChanged = false;
    bool isPoaFrontImageChanged = false;
    bool isPoaBackImageChanged = false;
    // To prevent downloading again and again
    bool isPoiFrontImageDownloaded = false;
    bool isPoiBackImageDownloaded = false;
    bool isPoaFrontImageDownloaded = false;
    bool isPoaBackImageDownloaded = false;

    bool isBottomModalSheetOpen = true;

    // Function to download the image asynchronously
    Future<void> downloadImage(String url, Function(File?) setImageFile,
        StateSetter setModalState) async {
      if (!isBottomModalSheetOpen) return;
      try {
        // Download the file using your download function
        //_showSnackBar('Downloading image please wait..');// throws error
        final file = await downloadFileFromUrl(url);
        if (isBottomModalSheetOpen) {
          setImageFile(
              file); // Set the downloaded file to the appropriate variable
        } // Set the downloaded file to the appropriate variable
      } catch (e) {
        // Handle errors
        //_showSnackBar('Error occurred while downloading image');// throws error
        safePrint('Error downloading image: $e');
      }
    }

    String capitalizeEachWord(String text) {
      if (text.isEmpty) return text;
      return text
          .split(' ')
          .map((word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : word)
          .join(' ');
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            // Start downloading the images if customer has URLs
            if (customer != null) {
              if (customer.poiImageFrontUrl != null &&
                  isBottomModalSheetOpen &&
                  !isPoiFrontImageDownloaded) {
                final s3PoiFrontUrl =
                    cloudPathKycPhoto + customer.poiImageFrontUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(
                            () => capturedPoiFrontImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isPoiFrontImageDownloaded = true;
                });
              }

              if (customer.poiImageBackUrl != null &&
                  isBottomModalSheetOpen &&
                  !isPoiBackImageDownloaded) {
                final s3PoiBackUrl =
                    cloudPathKycPhoto + customer.poiImageBackUrl!;
                downloadImage(
                        s3PoiBackUrl,
                        (file) => setModalState(
                            () => capturedPoiBackImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isPoiBackImageDownloaded = true;
                });
              }

              if (customer.poaImageFrontUrl != null &&
                  isBottomModalSheetOpen &&
                  !isPoaFrontImageDownloaded) {
                final s3PoaFrontUrl =
                    cloudPathKycPhoto + customer.poaImageFrontUrl!;
                downloadImage(
                        s3PoaFrontUrl,
                        (file) => setModalState(
                            () => capturedPoaFrontImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isPoaFrontImageDownloaded = true;
                });
              }

              if (customer.poaImageBackUrl != null &&
                  isBottomModalSheetOpen &&
                  !isPoaBackImageDownloaded) {
                final s3PoaBackUrl =
                    cloudPathKycPhoto + customer.poaImageBackUrl!;
                downloadImage(
                        s3PoaBackUrl,
                        (file) => setModalState(
                            () => capturedPoaBackImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isPoaBackImageDownloaded = true;
                });
              }
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.6,
                minChildSize: 0.2,
                maxChildSize: .9,
                snap: true,
                snapSizes: const [.5, .6],
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Stack(
                      children: [
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                TextFormField(
                                  controller: nameController,
                                  onChanged: (text) {
                                    String capitalized =
                                        capitalizeEachWord(text);
                                    nameController.value =
                                        nameController.value.copyWith(
                                      text: capitalized,
                                      selection: TextSelection(
                                          baseOffset: capitalized.length,
                                          extentOffset: capitalized.length),
                                      composing: TextRange
                                          .empty, // Resetting the composing range
                                    );
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a name';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 16.0,
                                    ),
                                    filled: true,
                                    fillColor: AppColor.mediumBlueColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle: TextStyle(
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                const Text(
                                  'Phone No.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                TextFormField(
                                  controller: phoneNoController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid phone number';
                                    } else if (value.length != 10) {
                                      return 'Phone number must be 10 digits';
                                    } else if (!RegExp(r'^[0-9]+$')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid phone number';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 16.0,
                                    ),
                                    filled: true,
                                    fillColor: AppColor.mediumBlueColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle: TextStyle(
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Village',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                TextFormField(
                                  controller: villageController,
                                  onChanged: (text) {
                                    String capitalized =
                                        capitalizeEachWord(text);
                                    villageController.value =
                                        villageController.value.copyWith(
                                      text: capitalized,
                                      selection: TextSelection(
                                          baseOffset: capitalized.length,
                                          extentOffset: capitalized.length),
                                      composing: TextRange
                                          .empty, // Resetting the composing range
                                    );
                                  },
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter a valid phone number';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 16.0,
                                    ),
                                    filled: true,
                                    fillColor: AppColor.mediumBlueColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle: TextStyle(
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                const Text(
                                  'Proof of identity document type',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  height: 45.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColor.mediumBlueColor,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<CustomDropdownItem>(
                                      value: selectedPoi,
                                      onChanged:
                                          (CustomDropdownItem? newItem) async {
                                        setModalState(() {
                                          selectedPoi = newItem!;
                                        });
                                      },
                                      items: poiType.map<
                                          DropdownMenuItem<CustomDropdownItem>>(
                                        (CustomDropdownItem item) {
                                          return DropdownMenuItem<
                                              CustomDropdownItem>(
                                            value: item,
                                            child: Text(item.label),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Proof of identity document No.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: poiNoController,
                                  onChanged: (text) {
                                    final cursorPosition =
                                        poiNoController.selection;
                                    poiNoController.value =
                                        poiNoController.value.copyWith(
                                      text: text.toUpperCase(),
                                      selection: cursorPosition,
                                    );
                                  },
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter a valid document number';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 16.0),
                                    filled: true,
                                    fillColor: AppColor.mediumBlueColor,
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle: TextStyle(
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                // Proof of identity starts here
                                const Text(
                                  'Proof of identity document image front',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Upload button starts here
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // Define a callback function to handle the captured image
                                          Future<void> onImageCaptured(
                                              File? imgFile) async {
                                            if (imgFile != null) {
                                              Navigator.pop(context);
                                              // Compress the image
                                              final compressedBytes =
                                                  await FlutterImageCompress
                                                      .compressWithFile(
                                                imgFile.absolute.path,
                                                quality:
                                                    50, // adjust the quality as needed
                                              );
                                              if (compressedBytes != null) {
                                                // Get the temporary directory
                                                final tempDir =
                                                    await getTemporaryDirectory();
                                                // Create a new file for the compressed image
                                                final compressedImageFile = File(
                                                    '${tempDir.path}/compressed_${imgFile.path.split('/').last}');
                                                // Write the compressed bytes to the new file
                                                await compressedImageFile
                                                    .writeAsBytes(
                                                        compressedBytes);
                                                // setState(() {
                                                //   //capturedPoiFrontImageFile =
                                                //   //    compressedImageFile;
                                                //   isPoiFrontImageChanged = true;
                                                // });
                                                setModalState(() {
                                                  capturedPoiFrontImageFile =
                                                      compressedImageFile;
                                                  isPoiFrontImageChanged = true;
                                                  // safePrint('photo changed 2');
                                                });
                                              }
                                            }
                                          }

                                          // Opening the camera and passing the above callback function
                                          Future<void> openCamera() async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MyMaskCamera(
                                                  onImageCaptured:
                                                      onImageCaptured,
                                                ),
                                              ),
                                            );
                                          }

                                          // Function to open the file picker
                                          Future<void> openFilePicker() async {
                                            // Implement your file picker logic here
                                            // For example, using file_picker package
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            if (result != null) {
                                              File file = File(
                                                  result.files.single.path!);
                                              CroppedFile? croppedFile =
                                                  await ImageCropper.platform
                                                      .cropImage(
                                                          sourcePath:
                                                              file.path);
                                              // Convert CroppedFile to File and call onImageCaptured
                                              if (croppedFile != null) {
                                                try {
                                                  File croppedImageFile =
                                                      File(croppedFile.path);
                                                  onImageCaptured(
                                                      croppedImageFile);
                                                } catch (e) {
                                                  safePrint(
                                                      'Error in converting cropped file: $e');
                                                }
                                              }
                                              //onImageCaptured(croppedFile as File?);
                                            }
                                          }

                                          // Show a dialog to choose between Camera and File Picker
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Choose an option'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.camera_alt),
                                                      title:
                                                          const Text('Camera'),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        openCamera();
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.file_upload),
                                                      title: const Text(
                                                          'File Picker'),
                                                      onTap: () {
                                                        //Navigator.pop(context);
                                                        openFilePicker();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                          backgroundColor:
                                              capturedPoiFrontImageFile != null
                                                  ? AppColor.mediumDeepBlueColor
                                                  : AppColor.mediumBlueColor,
                                          foregroundColor: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fixedSize:
                                              const Size(double.maxFinite, 44),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.upload_file),
                                            SizedBox(width: 8.0),
                                            Text('Upload'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Ends here
                                    const SizedBox(width: 10.0),
                                    // Image viewer button starts here
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Logic to show the image popup
                                          if (capturedPoiFrontImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedPoiFrontImageFile!),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            safePrint('No image to view');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                          backgroundColor:
                                              capturedPoiFrontImageFile != null
                                                  ? AppColor.mediumDeepBlueColor
                                                  : AppColor.mediumBlueColor,
                                          foregroundColor: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fixedSize:
                                              const Size(double.maxFinite, 44),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image),
                                            SizedBox(width: 8.0),
                                            Text('View Image'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Ends here
                                  ],
                                ),
                                // Ends here
                                const SizedBox(
                                  height: 10.0,
                                ),
                                // Proof of identity back starts here
                                const Text(
                                  'Proof of identity document image back',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // Define a callback function to handle the captured image
                                          Future<void> onImageCaptured(
                                              File? imgFile) async {
                                            if (imgFile != null) {
                                              Navigator.pop(context);
                                              // Compress the image
                                              final compressedBytes =
                                                  await FlutterImageCompress
                                                      .compressWithFile(
                                                          imgFile.absolute.path,
                                                          quality: 50);
                                              if (compressedBytes != null) {
                                                // Get the temporary directory
                                                final tempDir =
                                                    await getTemporaryDirectory();
                                                // Write the compressed image in a file
                                                final compressedFile = File(
                                                    '${tempDir.path}/compressed_${imgFile.path.split('/').last}');
                                                await compressedFile
                                                    .writeAsBytes(
                                                        compressedBytes);
                                                setModalState(() {
                                                  capturedPoiBackImageFile =
                                                      imgFile;
                                                  isPoiBackImageChanged = true;
                                                });
                                              }
                                            }
                                          }

                                          // Opening the camera and passing the above callback function
                                          Future<void> openCamera() async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MyMaskCamera(
                                                  onImageCaptured:
                                                      onImageCaptured,
                                                ),
                                              ),
                                            );
                                          }

                                          // Function to open the file picker
                                          Future<void> openFilePicker() async {
                                            // Implement your file picker logic here
                                            // For example, using file_picker package
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            if (result != null) {
                                              File file = File(
                                                  result.files.single.path!);
                                              CroppedFile? croppedFile =
                                                  await ImageCropper.platform
                                                      .cropImage(
                                                          sourcePath:
                                                              file.path);
                                              // Convert CroppedFile to File and call onImageCaptured
                                              if (croppedFile != null) {
                                                try {
                                                  File croppedImageFile =
                                                      File(croppedFile.path);
                                                  onImageCaptured(
                                                      croppedImageFile);
                                                } catch (e) {
                                                  safePrint(
                                                      'Error in converting cropped file: $e');
                                                }
                                              }
                                              //onImageCaptured(croppedFile as File?);
                                            }
                                          }

                                          // Show a dialog to choose between Camera and File Picker
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Choose an option'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.camera_alt),
                                                      title:
                                                          const Text('Camera'),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        openCamera();
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.file_upload),
                                                      title: const Text(
                                                          'File Picker'),
                                                      onTap: () {
                                                        //Navigator.pop(context);
                                                        openFilePicker();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                          backgroundColor:
                                              capturedPoiBackImageFile != null
                                                  ? AppColor.mediumDeepBlueColor
                                                  : AppColor.mediumBlueColor,
                                          foregroundColor: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fixedSize:
                                              const Size(double.maxFinite, 44),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.upload_file),
                                            SizedBox(width: 8.0),
                                            Text('Upload'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    // Image viewer button
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Logic to show the image popup
                                          if (capturedPoiBackImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedPoiBackImageFile!),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            safePrint('No image to view');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                          backgroundColor:
                                              capturedPoiBackImageFile != null
                                                  ? AppColor.mediumDeepBlueColor
                                                  : AppColor.mediumBlueColor,
                                          foregroundColor: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fixedSize:
                                              const Size(double.maxFinite, 44),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image),
                                            SizedBox(width: 8.0),
                                            Text('View Image'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Ends here
                                const SizedBox(
                                  height: 10.0,
                                ),

                                const Text(
                                  'Proof of address document type',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  height: 45.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColor.mediumBlueColor,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<CustomDropdownItem>(
                                      value: selectedPoa,
                                      onChanged:
                                          (CustomDropdownItem? newItem) async {
                                        setModalState(() {
                                          selectedPoa = newItem!;
                                        });
                                      },
                                      items: poaType.map<
                                          DropdownMenuItem<CustomDropdownItem>>(
                                        (CustomDropdownItem item) {
                                          return DropdownMenuItem<
                                              CustomDropdownItem>(
                                            value: item,
                                            child: Text(item.label),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Proof of address document No.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                TextFormField(
                                  controller: poaNoController,
                                  onChanged: (text) {
                                    final cursorPosition =
                                        poaNoController.selection;
                                    poaNoController.value =
                                        poaNoController.value.copyWith(
                                      text: text.toUpperCase(),
                                      selection: cursorPosition,
                                    );
                                  },
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter a valid document number';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 16.0),
                                    filled: true,
                                    fillColor: AppColor.mediumBlueColor,
                                    border: OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintStyle: TextStyle(
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                // Proof of address front starts here
                                const Text(
                                  'Proof of address document image front',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // Define a callback function to handle the captured image
                                          Future<void> onImageCaptured(
                                              File? imgFile) async {
                                            if (imgFile != null) {
                                              Navigator.pop(context);
                                              // Compress the image
                                              final compressedBytes =
                                                  await FlutterImageCompress
                                                      .compressWithFile(
                                                imgFile.absolute.path,
                                                quality:
                                                    50, // adjust the quality as needed
                                              );
                                              if (compressedBytes != null) {
                                                // Get the temporary directory
                                                final tempDir =
                                                    await getTemporaryDirectory();
                                                // Create a new file for the compressed image
                                                final compressedImageFile = File(
                                                    '${tempDir.path}/compressed_${imgFile.path.split('/').last}');
                                                // Write the compressed bytes to the new file
                                                await compressedImageFile
                                                    .writeAsBytes(
                                                        compressedBytes);
                                                setModalState(() {
                                                  capturedPoaFrontImageFile =
                                                      imgFile;
                                                  isPoaFrontImageChanged = true;
                                                });
                                              }
                                            }
                                          }

                                          // Opening the camera and passing the above callback function
                                          Future<void> openCamera() async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MyMaskCamera(
                                                  onImageCaptured:
                                                      onImageCaptured,
                                                ),
                                              ),
                                            );
                                          }

                                          // Function to open the file picker
                                          Future<void> openFilePicker() async {
                                            // Implement your file picker logic here
                                            // For example, using file_picker package
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            if (result != null) {
                                              File file = File(
                                                  result.files.single.path!);
                                              CroppedFile? croppedFile =
                                                  await ImageCropper.platform
                                                      .cropImage(
                                                          sourcePath:
                                                              file.path);
                                              // Convert CroppedFile to File and call onImageCaptured
                                              if (croppedFile != null) {
                                                try {
                                                  File croppedImageFile =
                                                      File(croppedFile.path);
                                                  onImageCaptured(
                                                      croppedImageFile);
                                                } catch (e) {
                                                  safePrint(
                                                      'Error in converting cropped file: $e');
                                                }
                                              }
                                            }
                                          }

                                          // Show a dialog to choose between Camera and File Picker
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Choose an option'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.camera_alt),
                                                      title:
                                                          const Text('Camera'),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        openCamera();
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.file_upload),
                                                      title: const Text(
                                                          'File Picker'),
                                                      onTap: () {
                                                        //Navigator.pop(context);
                                                        openFilePicker();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                          backgroundColor:
                                              capturedPoaFrontImageFile != null
                                                  ? AppColor.mediumDeepBlueColor
                                                  : AppColor.mediumBlueColor,
                                          foregroundColor: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fixedSize:
                                              const Size(double.maxFinite, 44),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.upload_file),
                                            SizedBox(width: 8.0),
                                            Text('Upload'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    // Image viewer button
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Logic to show the image popup
                                          if (capturedPoaFrontImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedPoaFrontImageFile!),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            safePrint('No image to view');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                          backgroundColor:
                                              capturedPoaFrontImageFile != null
                                                  ? AppColor.mediumDeepBlueColor
                                                  : AppColor.mediumBlueColor,
                                          foregroundColor: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fixedSize:
                                              const Size(double.maxFinite, 44),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image),
                                            SizedBox(width: 8.0),
                                            Text('View Image'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Ends here
                                const SizedBox(
                                  height: 10.0,
                                ),
                                // Proof of address back starts here
                                const Text(
                                  'Proof of address document image back',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.primaryColor),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // Define a callback function to handle the captured image
                                          Future<void> onImageCaptured(
                                              File? imgFile) async {
                                            if (imgFile != null) {
                                              Navigator.pop(context);
                                              // Compress the image
                                              final compressedBytes =
                                                  await FlutterImageCompress
                                                      .compressWithFile(
                                                imgFile.absolute.path,
                                                quality:
                                                    50, // adjust the quality as needed
                                              );
                                              if (compressedBytes != null) {
                                                // Get the temporary directory
                                                final tempDir =
                                                    await getTemporaryDirectory();
                                                // Create a new file for the compressed image
                                                final compressedImageFile = File(
                                                    '${tempDir.path}/compressed_${imgFile.path.split('/').last}');
                                                // Write the compressed bytes to the new file
                                                await compressedImageFile
                                                    .writeAsBytes(
                                                        compressedBytes);
                                                setModalState(() {
                                                  capturedPoaBackImageFile =
                                                      imgFile;
                                                  isPoaBackImageChanged = true;
                                                });
                                              }
                                            }
                                          }

                                          // Opening the camera and passing the above callback function
                                          Future<void> openCamera() async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MyMaskCamera(
                                                  onImageCaptured:
                                                      onImageCaptured,
                                                ),
                                              ),
                                            );
                                          }

                                          // Function to open the file picker
                                          Future<void> openFilePicker() async {
                                            // Implement your file picker logic here
                                            // For example, using file_picker package
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            if (result != null) {
                                              File file = File(
                                                  result.files.single.path!);
                                              CroppedFile? croppedFile =
                                                  await ImageCropper.platform
                                                      .cropImage(
                                                          sourcePath:
                                                              file.path);
                                              // Convert CroppedFile to File and call onImageCaptured
                                              if (croppedFile != null) {
                                                try {
                                                  File croppedImageFile =
                                                      File(croppedFile.path);
                                                  onImageCaptured(
                                                      croppedImageFile);
                                                } catch (e) {
                                                  safePrint(
                                                      'Error in converting cropped file: $e');
                                                }
                                              }
                                              //onImageCaptured(croppedFile as File?);
                                            }
                                          }

                                          // Show a dialog to choose between Camera and File Picker
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Choose an option'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.camera_alt),
                                                      title:
                                                          const Text('Camera'),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        openCamera();
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.file_upload),
                                                      title: const Text(
                                                          'File Picker'),
                                                      onTap: () {
                                                        //Navigator.pop(context);
                                                        openFilePicker();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                          backgroundColor:
                                              capturedPoaBackImageFile != null
                                                  ? AppColor.mediumDeepBlueColor
                                                  : AppColor.mediumBlueColor,
                                          foregroundColor: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fixedSize:
                                              const Size(double.maxFinite, 44),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.upload_file),
                                            SizedBox(width: 8.0),
                                            Text('Upload'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    // Image viewer button
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Logic to show the image popup
                                          if (capturedPoaBackImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedPoaBackImageFile!),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            safePrint('No image to view');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 18),
                                          backgroundColor:
                                              capturedPoaBackImageFile != null
                                                  ? AppColor.mediumDeepBlueColor
                                                  : AppColor.mediumBlueColor,
                                          foregroundColor: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fixedSize:
                                              const Size(double.maxFinite, 44),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image),
                                            SizedBox(width: 8.0),
                                            Text('View Image'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Ends here
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const SizedBox(height: 20.0),
                                // Save button starts here
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomRoundedElevatedButton(
                                    text: customer == null ? 'Save' : 'Update',
                                    onPressed: _isExecuting
                                        ? () {}
                                        : () async {
                                            setModalState(() {
                                              _isExecuting = true;
                                            });
                                            if (_formKey.currentState!
                                                .validate()) {
                                              String? poiFrontImageKey;
                                              String? poiBackImageKey;
                                              String? poaFrontImageKey;
                                              String? poaBackImageKey;

                                              // Function to upload an image and return the key
                                              Future<String?> uploadImage(
                                                  File imageFile) async {
                                                try {
                                                  //_showSnackBar('Uploading..');
                                                  final result = await Amplify
                                                      .Storage.uploadFile(
                                                    localFile: AWSFile.fromPath(
                                                        imageFile.path),
                                                    key:
                                                        'insurance-kyc-photos/${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}',
                                                  ).result;
                                                  safePrint(
                                                      'Image uploaded successfully: ${result.uploadedItem.key}');
                                                  return result
                                                      .uploadedItem.key;
                                                } catch (e) {
                                                  safePrint(
                                                      'Image upload failed: $e');
                                                  return null;
                                                }
                                              }

                                              /*if (capturedPoiFrontImageFile != null) {
                                      // Upload image to S3
                                      try {
                                        final result =
                                            await Amplify.Storage.uploadFile(
                                          localFile: AWSFile.fromPath(
                                              capturedPoiFrontImageFile!.path),
                                          key:
                                              'insuranceKycPhoto/${DateTime.now().millisecondsSinceEpoch}_${capturedPoiFrontImageFile!.path.split('/').last}',
                                        ).result;
                                        poiFrontImageKey =
                                            result.uploadedItem.key;
                                        safePrint(
                                            'Image uploaded successfully: $poiFrontImageKey');
                                      } catch (e) {
                                        safePrint('Image upload failed: $e');
                                      }
                                    }*/

                                              // Upload images and get their keys if they have been captured or changed
                                              if (isPoiFrontImageChanged &&
                                                  capturedPoiFrontImageFile !=
                                                      null) {
                                                poiFrontImageKey =
                                                    await uploadImage(
                                                        capturedPoiFrontImageFile!);
                                              } else if (customer != null) {
                                                poiFrontImageKey = customer
                                                    .poiImageFrontUrl; // Use existing URL if image hasn't changed
                                              }

                                              if (isPoiBackImageChanged &&
                                                  capturedPoiBackImageFile !=
                                                      null) {
                                                poiBackImageKey =
                                                    await uploadImage(
                                                        capturedPoiBackImageFile!);
                                              } else if (customer != null) {
                                                poiBackImageKey = customer
                                                    .poiImageBackUrl; // Use existing URL if image hasn't changed
                                              }

                                              if (isPoaFrontImageChanged &&
                                                  capturedPoaFrontImageFile !=
                                                      null) {
                                                poaFrontImageKey =
                                                    await uploadImage(
                                                        capturedPoaFrontImageFile!);
                                              } else if (customer != null) {
                                                poaFrontImageKey = customer
                                                    .poaImageFrontUrl; // Use existing URL if image hasn't changed
                                              }

                                              if (isPoaBackImageChanged &&
                                                  capturedPoaBackImageFile !=
                                                      null) {
                                                poaBackImageKey =
                                                    await uploadImage(
                                                        capturedPoaBackImageFile!);
                                              } else if (customer != null) {
                                                poaBackImageKey = customer
                                                    .poaImageBackUrl; // Use existing URL if image hasn't changed
                                              }

                                              // Create or update customer
                                              InsuranceCustomerInfo customerInfo =
                                                  InsuranceCustomerInfo(
                                                      id: customer?.id,
                                                      name: nameController.text
                                                          .trim(),
                                                      phoneNo: phoneNoController
                                                          .text
                                                          .trim(),
                                                      village: villageController
                                                          .text
                                                          .trim(),
                                                      poiType:
                                                          selectedPoi.label,
                                                      poiTypeId:
                                                          selectedPoi.value,
                                                      poiNumber: poiNoController
                                                          .text
                                                          .trim(),
                                                      poaType:
                                                          selectedPoa.label,
                                                      poaTypeId:
                                                          selectedPoa.value,
                                                      poaNumber: poaNoController
                                                          .text
                                                          .trim(),
                                                      poiImageFrontUrl:
                                                          poiFrontImageKey,
                                                      poiImageBackUrl:
                                                          poiBackImageKey,
                                                      poaImageFrontUrl:
                                                          poaFrontImageKey,
                                                      poaImageBackUrl:
                                                          poaBackImageKey);

                                              InsuranceCustomerInfoRepo
                                                  customerRepo =
                                                  InsuranceCustomerInfoRepo();
                                              if (customer == null) {
                                                try {
                                                  await customerRepo
                                                      .create(customerInfo)
                                                      .then(
                                                        (value) =>
                                                            Navigator.pop(
                                                                context),
                                                      );
                                                } catch (e) {
                                                  Navigator.of(context).pop();
                                                  // Show a SnackBar with the error message
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content:
                                                          Text(e.toString()),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                try {
                                                  await customerRepo
                                                      .update(customerInfo)
                                                      .then(
                                                        (value) =>
                                                            Navigator.pop(
                                                                context),
                                                      );
                                                } catch (e) {
                                                  // Show a SnackBar with the error message
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content:
                                                          Text(e.toString()),
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                  );
                                                }
                                              }
                                              _fetchCustomers();
                                            } else {
                                              setModalState(() {
                                                _isExecuting = false;
                                              });
                                            }
                                          },
                                    backgroundColor: _isExecuting
                                        ? AppColor.disabledColor
                                        : AppColor.accentColor,
                                    textColor: AppColor.whiteColor,
                                    fontSize: 22,
                                    width: 160,
                                    height: 44,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_isExecuting)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black45,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    ).whenComplete(
      () {
        _isExecuting = false;
        isBottomModalSheetOpen = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // prevent onscreen keyboard over modal sheet
        appBar: AppBar(
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search customer',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 8.0),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showAddNewModalSheet(context),
            ),
          ],
        ),
        body: _isExecuting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _filteredCustomers.isEmpty
                ? const Center(
                    child: Text('No customers found.'),
                  )
                : ListView.builder(
                    itemCount: _filteredCustomers.length,
                    itemBuilder: (context, index) {
                      InsuranceCustomerInfo customer =
                          _filteredCustomers[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    customer.name ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    customer.phoneNo ?? '',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    customer.village ?? '',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _showEditModalSheet(context, customer);
                              },
                            ),
                            const SizedBox(width: 8.0),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  size: 16.0, color: Colors.grey),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OfficerAddCustomerLivestockPolicyPage(
                                      customerId: customer.id,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
