import 'dart:async';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/LivestockPolicyInfo.dart';
import 'package:farm_infinity/repositories/insurance/customer_livestock_policy_info_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../helper/constants.dart';
import '../styles/colors.dart';
import '../widgets/custom_rounded_elevated_button.dart';
import '../widgets/my_mask_cam_widget.dart';

class OfficerAddCustomerLivestockPolicyPage extends StatefulWidget {
  final String customerId;

  const OfficerAddCustomerLivestockPolicyPage(
      {super.key, required this.customerId});

  @override
  State<OfficerAddCustomerLivestockPolicyPage> createState() =>
      _OfficerAddCustomerLivestockPolicyPageState();
}

class _OfficerAddCustomerLivestockPolicyPageState
    extends State<OfficerAddCustomerLivestockPolicyPage> {
  late StreamSubscription<List<LivestockPolicyInfo>> _subscription;

  String cloudPathLivestockPhoto =
      'https://s3-${Constants.region}.amazonaws.com/${dotenv.env['BUCKET_NAME']}/public/';

  final TextEditingController _searchController = TextEditingController();
  List<LivestockPolicyInfo> _policies = [];
  List<LivestockPolicyInfo> _filteredPolicies = [];

  final _formKey = GlobalKey<FormState>();

  final TextEditingController tagNoController = TextEditingController();

  bool _isExecuting = false;

  @override
  void initState() {
    super.initState();
    _fetchCustomerLivestockPolicies();
    _searchController.addListener(_filterCustomerLivestockPolicies);
    //_startSubscription();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCustomerLivestockPolicies);
    _searchController.dispose();
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _fetchCustomerLivestockPolicies() async {
    if (!mounted) return;
    setState(() {
      _isExecuting = true;
    });
    try {
      // Fetch only the policies related to this specific customer
      List<LivestockPolicyInfo> policies = await Amplify.DataStore.query(
        LivestockPolicyInfo.classType,
        where:
            LivestockPolicyInfo.INSURANCECUSTOMERINFOID.eq(widget.customerId),
      );
      if (!mounted) return; // Check if still mounted before calling setState
      setState(() {
        _policies = policies;
        _filteredPolicies = policies;
      });
    } catch (e) {
      if (!mounted) return; // Check if still mounted before calling setState
      setState(() {
        _isExecuting = false;
      });
      _showSnackBar('Error fetching policies: $e');
      safePrint('Error fetching customer livestock policies: $e');
    } finally {
      setState(() {
        _isExecuting = false;
      });
    }
  }

  void _startSubscription() {
    _subscription =
        Amplify.DataStore.observeQuery(LivestockPolicyInfo.classType)
            .map((event) =>
                event.items.toList()) // Transform QuerySnapshot to List<T>
            .listen((List<LivestockPolicyInfo> event) {
      setState(() {
        _policies = event;
        _filteredPolicies = event.where((policy) {
          String query = _searchController.text.toLowerCase();
          return policy.tagNo!.toLowerCase().contains(query);
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

  void _filterCustomerLivestockPolicies() {
    if (!mounted) return; // Ensure still mounted before calling setState
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPolicies = _policies
          .where(
              (policy) => policy.tagNo?.toLowerCase().contains(query) ?? false)
          .toList();
    });
  }

  void _showAddNewModalSheet(BuildContext context) {
    _showModalSheet(context);
  }

  void _showEditModalSheet(BuildContext context, LivestockPolicyInfo policy) {
    tagNoController.text = policy.tagNo ?? '';
    _showModalSheet(context, policy: policy);
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

  void _showModalSheet(BuildContext context, {LivestockPolicyInfo? policy}) {
    File? capturedLivestockLeftImageFile;
    File? capturedLivestockRightImageFile;
    File? capturedLivestockFrontImageFile;
    File? capturedLivestockBackImageFile;
    File? capturedLivestockWithTagImageFile;
    File? capturedApplicationPageOneImageFile;
    File? capturedApplicationPageTwoImageFile;
    File? capturedHealthCertificatePageOneImageFile;
    File? capturedHealthCertificatePageTwoImageFile;

    bool isLivestockLeftImageChanged = false;
    bool isLivestockRightImageChanged = false;
    bool isLivestockFrontImageChanged = false;
    bool isLivestockBackImageChanged = false;
    bool isLivestockWithTagImageChanged = false;
    bool isApplicationPageOneImageChanged = false;
    bool isApplicationPageTwoImageChanged = false;
    bool isHealthCertificatePageOneImageChanged = false;
    bool isHealthCertificatePageTwoImageChanged = false;

    bool isLivestockLeftImageDownloaded = false;
    bool isLivestockRightImageDownloaded = false;
    bool isLivestockFrontImageDownloaded = false;
    bool isLivestockBackImageDownloaded = false;
    bool isLivestockWithTagImageDownloaded = false;
    bool isApplicationPageOneImageDownloaded = false;
    bool isApplicationPageTwoImageDownloaded = false;
    bool isHealthCertificatePageOneImageDownloaded = false;
    bool isHealthCertificatePageTwoImageDownloaded = false;

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
          setImageFile(file);
        } // Set the downloaded file to the appropriate variable
      } catch (e) {
        // Handle errors
        //_showSnackBar('Error occurred while downloading image');// throws error
        safePrint('Error downloading image: $e');
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            if (policy != null) {
              // Left
              if (policy.livestockLeftImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isLivestockLeftImageDownloaded) {
                final s3PoiFrontUrl =
                    cloudPathLivestockPhoto + policy.livestockLeftImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(
                            () => capturedLivestockLeftImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isLivestockLeftImageDownloaded = true;
                });
              }
              // Right
              if (policy.livestockRightImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isLivestockRightImageDownloaded) {
                final s3PoiFrontUrl =
                    cloudPathLivestockPhoto + policy.livestockRightImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(
                            () => capturedLivestockRightImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isLivestockRightImageDownloaded = true;
                });
              }
              // Front
              if (policy.livestockFrontImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isLivestockFrontImageDownloaded) {
                final s3PoiFrontUrl =
                    cloudPathLivestockPhoto + policy.livestockFrontImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(
                            () => capturedLivestockFrontImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isLivestockFrontImageDownloaded = true;
                });
              }
              // Back
              if (policy.livestockBackImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isLivestockBackImageDownloaded) {
                final s3PoiFrontUrl =
                    cloudPathLivestockPhoto + policy.livestockBackImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(
                            () => capturedLivestockBackImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isLivestockBackImageDownloaded = true;
                });
              }
              // With tag
              if (policy.livestockWithTagImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isLivestockWithTagImageDownloaded) {
                final s3PoiFrontUrl =
                    cloudPathLivestockPhoto + policy.livestockWithTagImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(
                            () => capturedLivestockWithTagImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isLivestockWithTagImageDownloaded = true;
                });
              }
              // Application page 1
              if (policy.applicationFormPageOneImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isApplicationPageOneImageDownloaded) {
                final s3PoiFrontUrl = cloudPathLivestockPhoto +
                    policy.applicationFormPageOneImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(
                            () => capturedApplicationPageOneImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isApplicationPageOneImageDownloaded = true;
                });
              }
              // Application page 2
              if (policy.applicationFormPageTwoImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isApplicationPageTwoImageDownloaded) {
                final s3PoiFrontUrl = cloudPathLivestockPhoto +
                    policy.applicationFormPageTwoImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(
                            () => capturedApplicationPageTwoImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isApplicationPageTwoImageDownloaded = true;
                });
              }
              // Health certificate Page 1
              if (policy.healthCertificatePageOneImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isHealthCertificatePageOneImageDownloaded) {
                final s3PoiFrontUrl = cloudPathLivestockPhoto +
                    policy.healthCertificatePageOneImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(() =>
                            capturedHealthCertificatePageOneImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isHealthCertificatePageOneImageDownloaded = true;
                });
              }
              // Health certificate Page 2
              if (policy.healthCertificatePageTwoImageUrl != null &&
                  isBottomModalSheetOpen &&
                  !isHealthCertificatePageTwoImageDownloaded) {
                final s3PoiFrontUrl = cloudPathLivestockPhoto +
                    policy.healthCertificatePageTwoImageUrl!;
                downloadImage(
                        s3PoiFrontUrl,
                        (file) => setModalState(() =>
                            capturedHealthCertificatePageTwoImageFile = file),
                        setModalState)
                    .whenComplete(() {
                  isHealthCertificatePageTwoImageDownloaded = true;
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
                                // Livestock left image starts here
                                const Text(
                                  'Photo of livestock [Left-Hand] side',
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
                                                setModalState(
                                                  () {
                                                    capturedLivestockLeftImageFile =
                                                        imgFile;
                                                    isLivestockLeftImageChanged =
                                                        true;
                                                  },
                                                );
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
                                              capturedLivestockLeftImageFile !=
                                                      null
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
                                          if (capturedLivestockLeftImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedLivestockLeftImageFile!),
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
                                              capturedLivestockLeftImageFile !=
                                                      null
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
                                // Livestock right image starts here
                                const Text(
                                  'Photo of livestock [Right-Hand] side',
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
                                                  capturedLivestockRightImageFile =
                                                      imgFile;
                                                  isLivestockRightImageChanged =
                                                      true;
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
                                              capturedLivestockRightImageFile !=
                                                      null
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
                                          if (capturedLivestockRightImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedLivestockRightImageFile!),
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
                                              capturedLivestockRightImageFile !=
                                                      null
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
                                // Livestock Front image starts here
                                const Text(
                                  'Image of livestock [Front] side',
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
                                                  capturedLivestockFrontImageFile =
                                                      imgFile;
                                                  isLivestockFrontImageChanged =
                                                      true;
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
                                              capturedLivestockFrontImageFile !=
                                                      null
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
                                          if (capturedLivestockFrontImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedLivestockFrontImageFile!),
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
                                              capturedLivestockFrontImageFile !=
                                                      null
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
                                // Livestock back image starts here
                                const Text(
                                  'Photo of livestock [Back] side',
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
                                                  capturedLivestockBackImageFile =
                                                      imgFile;
                                                  isLivestockBackImageChanged =
                                                      true;
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
                                              capturedLivestockBackImageFile !=
                                                      null
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
                                          if (capturedLivestockBackImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedLivestockBackImageFile!),
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
                                              capturedLivestockBackImageFile !=
                                                      null
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
                                // Livestock with tag image starts here
                                const Text(
                                  'Photo of livestock [With-Tag]',
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
                                                  capturedLivestockWithTagImageFile =
                                                      imgFile;
                                                  isLivestockWithTagImageChanged =
                                                      true;
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
                                              capturedLivestockWithTagImageFile !=
                                                      null
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
                                          if (capturedLivestockWithTagImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedLivestockWithTagImageFile!),
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
                                              capturedLivestockWithTagImageFile !=
                                                      null
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
                                // application page 1 image starts here
                                const Text(
                                  'Photo of the insurance application[Page-1]',
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
                                                  capturedApplicationPageOneImageFile =
                                                      imgFile;
                                                  isApplicationPageOneImageChanged =
                                                      true;
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
                                              capturedApplicationPageOneImageFile !=
                                                      null
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
                                          if (capturedApplicationPageOneImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedApplicationPageOneImageFile!),
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
                                              capturedApplicationPageOneImageFile !=
                                                      null
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
                                // Application page 2 image starts here
                                const Text(
                                  'Photo of the insurance application[Page-2]',
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
                                                  capturedApplicationPageTwoImageFile =
                                                      imgFile;
                                                  isApplicationPageTwoImageChanged =
                                                      true;
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
                                              capturedApplicationPageTwoImageFile !=
                                                      null
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
                                          if (capturedApplicationPageTwoImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedApplicationPageTwoImageFile!),
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
                                              capturedApplicationPageTwoImageFile !=
                                                      null
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
                                // Health certificate page 1 image starts here
                                const Text(
                                  'Photo of the livestock health certificate[page-1]',
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
                                                  capturedHealthCertificatePageOneImageFile =
                                                      imgFile;
                                                  isHealthCertificatePageOneImageChanged =
                                                      true;
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
                                              capturedHealthCertificatePageOneImageFile !=
                                                      null
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
                                          if (capturedHealthCertificatePageOneImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedHealthCertificatePageOneImageFile!),
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
                                              capturedHealthCertificatePageOneImageFile !=
                                                      null
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
                                // Health certificate page 2 image starts here
                                const Text(
                                  'Photo of the livestock health certificate[page-2]',
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
                                                  capturedHealthCertificatePageTwoImageFile =
                                                      imgFile;
                                                  isHealthCertificatePageTwoImageChanged =
                                                      true;
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
                                              capturedHealthCertificatePageTwoImageFile !=
                                                      null
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
                                          if (capturedHealthCertificatePageTwoImageFile !=
                                              null) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Image.file(
                                                      capturedHealthCertificatePageTwoImageFile!),
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
                                              capturedHealthCertificatePageTwoImageFile !=
                                                      null
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
                                  'Tag No',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                TextFormField(
                                  controller: tagNoController,
                                  onChanged: (text) {
                                    final cursorPosition =
                                        tagNoController.selection;
                                    tagNoController.value =
                                        tagNoController.value.copyWith(
                                      text: text.toUpperCase(),
                                      selection: cursorPosition,
                                    );
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a tag';
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
                                const SizedBox(height: 20.0),
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomRoundedElevatedButton(
                                    text: policy == null ? 'Save' : 'Update',
                                    onPressed: _isExecuting
                                        ? () {}
                                        : () async {
                                            setModalState(() {
                                              _isExecuting = true;
                                            });
                                            if (_formKey.currentState!
                                                .validate()) {
                                              String? livestockLeftImageKey;
                                              String? livestockRightImageKey;
                                              String? livestockFrontImageKey;
                                              String? livestockBackImageKey;
                                              String? livestockWithTagImageKey;
                                              String?
                                                  applicationPageOneImageKey;
                                              String?
                                                  applicationPageTwoImageKey;
                                              String?
                                                  healthCertificatePageOneImageKey;
                                              String?
                                                  healthCertificatePageTwoImageKey;

                                              // Function to upload an image and return the key
                                              Future<String?> uploadImage(
                                                  File imageFile) async {
                                                try {
                                                  final result = await Amplify
                                                      .Storage.uploadFile(
                                                    localFile: AWSFile.fromPath(
                                                        imageFile.path),
                                                    key:
                                                        'insurance-livestock-photos/${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}',
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

                                              // Upload images and get their keys if they have been captured or changed
                                              // Left
                                              if (isLivestockLeftImageChanged &&
                                                  capturedLivestockLeftImageFile !=
                                                      null) {
                                                livestockLeftImageKey =
                                                    await uploadImage(
                                                        capturedLivestockLeftImageFile!);
                                              } else if (policy != null) {
                                                livestockLeftImageKey = policy
                                                    .livestockLeftImageUrl; // Use existing URL if image hasn't changed
                                              }
                                              // Right
                                              if (isLivestockRightImageChanged &&
                                                  capturedLivestockRightImageFile !=
                                                      null) {
                                                livestockRightImageKey =
                                                    await uploadImage(
                                                        capturedLivestockRightImageFile!);
                                              } else if (policy != null) {
                                                livestockRightImageKey = policy
                                                    .livestockRightImageUrl; // Use existing URL if image hasn't changed
                                              }
                                              // Front
                                              if (isLivestockFrontImageChanged &&
                                                  capturedLivestockFrontImageFile !=
                                                      null) {
                                                livestockFrontImageKey =
                                                    await uploadImage(
                                                        capturedLivestockFrontImageFile!);
                                              } else if (policy != null) {
                                                livestockFrontImageKey = policy
                                                    .livestockFrontImageUrl; // Use existing URL if image hasn't changed
                                              }
                                              // Back
                                              if (isLivestockBackImageChanged &&
                                                  capturedLivestockBackImageFile !=
                                                      null) {
                                                livestockBackImageKey =
                                                    await uploadImage(
                                                        capturedLivestockBackImageFile!);
                                              } else if (policy != null) {
                                                livestockBackImageKey = policy
                                                    .livestockBackImageUrl; // Use existing URL if image hasn't changed
                                              }
                                              // With tag
                                              if (isLivestockWithTagImageChanged &&
                                                  capturedLivestockWithTagImageFile !=
                                                      null) {
                                                livestockWithTagImageKey =
                                                    await uploadImage(
                                                        capturedLivestockWithTagImageFile!);
                                              } else if (policy != null) {
                                                livestockWithTagImageKey = policy
                                                    .livestockWithTagImageUrl; // Use existing URL if image hasn't changed
                                              }
                                              // Application page 1
                                              if (isApplicationPageOneImageChanged &&
                                                  capturedApplicationPageOneImageFile !=
                                                      null) {
                                                applicationPageOneImageKey =
                                                    await uploadImage(
                                                        capturedApplicationPageOneImageFile!);
                                              } else if (policy != null) {
                                                applicationPageOneImageKey = policy
                                                    .applicationFormPageOneImageUrl; // Use existing URL if image hasn't changed
                                              }
                                              // Application page 2
                                              if (isApplicationPageTwoImageChanged &&
                                                  capturedApplicationPageTwoImageFile !=
                                                      null) {
                                                applicationPageTwoImageKey =
                                                    await uploadImage(
                                                        capturedApplicationPageTwoImageFile!);
                                              } else if (policy != null) {
                                                applicationPageTwoImageKey = policy
                                                    .applicationFormPageTwoImageUrl; // Use existing URL if image hasn't changed
                                              }
                                              // Health Certificate page 1
                                              if (isHealthCertificatePageOneImageChanged &&
                                                  capturedHealthCertificatePageOneImageFile !=
                                                      null) {
                                                healthCertificatePageOneImageKey =
                                                    await uploadImage(
                                                        capturedHealthCertificatePageOneImageFile!);
                                              } else if (policy != null) {
                                                healthCertificatePageOneImageKey =
                                                    policy
                                                        .healthCertificatePageOneImageUrl; // Use existing URL if image hasn't changed
                                              }
                                              // Health Certificate page 2
                                              if (isHealthCertificatePageTwoImageChanged &&
                                                  capturedHealthCertificatePageTwoImageFile !=
                                                      null) {
                                                healthCertificatePageTwoImageKey =
                                                    await uploadImage(
                                                        capturedHealthCertificatePageTwoImageFile!);
                                              } else if (policy != null) {
                                                healthCertificatePageTwoImageKey =
                                                    policy
                                                        .healthCertificatePageTwoImageUrl; // Use existing URL if image hasn't changed
                                              }

                                              // Create or update livestock policy info
                                              LivestockPolicyInfo
                                                  livestockPolicyInfo =
                                                  LivestockPolicyInfo(
                                                id: policy?.id,
                                                livestockLeftImageUrl:
                                                    livestockLeftImageKey,
                                                livestockRightImageUrl:
                                                    livestockRightImageKey,
                                                livestockFrontImageUrl:
                                                    livestockFrontImageKey,
                                                livestockBackImageUrl:
                                                    livestockBackImageKey,
                                                livestockWithTagImageUrl:
                                                    livestockWithTagImageKey,
                                                applicationFormPageOneImageUrl:
                                                    applicationPageOneImageKey,
                                                applicationFormPageTwoImageUrl:
                                                    applicationPageTwoImageKey,
                                                healthCertificatePageOneImageUrl:
                                                    healthCertificatePageOneImageKey,
                                                healthCertificatePageTwoImageUrl:
                                                    healthCertificatePageTwoImageKey,
                                                tagNo:
                                                    tagNoController.text.trim(),
                                                status: 1,
                                                insurancecustomerinfoID:
                                                    widget.customerId,
                                                // Add other fields here
                                              );
                                              CustomerLivestockInfoRepo
                                                  livestockPolicyRepo =
                                                  CustomerLivestockInfoRepo();
                                              if (policy == null) {
                                                try {
                                                  await livestockPolicyRepo
                                                      .create(
                                                          livestockPolicyInfo)
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
                                                  await livestockPolicyRepo
                                                      .update(
                                                          livestockPolicyInfo)
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
                                              }
                                              _fetchCustomerLivestockPolicies();
                                            } else {
                                              setModalState(() {
                                                _isExecuting = false;
                                              });
                                            }
                                          },
                                    backgroundColor: AppColor.accentColor,
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
    ).whenComplete(() {
      _isExecuting = false;
      isBottomModalSheetOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                hintText: 'Search policies',
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
            : _filteredPolicies.isEmpty
                ? const Center(
                    child: Text('No policies found.'),
                  )
                : ListView.builder(
                    itemCount: _filteredPolicies.length,
                    itemBuilder: (context, index) {
                      LivestockPolicyInfo policy = _filteredPolicies[index];
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
                              child: Icon(Icons.policy, color: Colors.white),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    policy.tagNo ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _showEditModalSheet(context, policy);
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
