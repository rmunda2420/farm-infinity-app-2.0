import 'dart:io';

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_for_camera_view/helpers/mask_for_camera_view_border_type.dart';
import 'package:mask_for_camera_view/inside_line/mask_for_camera_view_inside_line.dart';
import 'package:mask_for_camera_view/mask_for_camera_view.dart';
import 'package:mask_for_camera_view/mask_for_camera_view_result.dart';
import 'package:path_provider/path_provider.dart';

class MyMaskCamera extends StatefulWidget {
  final Function(File?) onImageCaptured;

  const MyMaskCamera({super.key, required this.onImageCaptured});

  @override
  State<MyMaskCamera> createState() => _MyMaskCameraState();
}

class _MyMaskCameraState extends State<MyMaskCamera> {
  late List<CameraDescription> cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCameraApp();
  }

  Future<void> _initializeCameraApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await MaskForCameraView.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<File> _convertToFile(Uint8List? croppedImage) async {
    final DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMdd_HHmmss').format(now);
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image_$formattedDate.jpg').create();
    file.writeAsBytesSync(croppedImage!);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return const Scaffold(
        body: Center(
          child: Text('Loading camera preview..'),
        ),
      );
    }
    return MaskForCameraView(
      title: "Place your card inside the rectangle",
      visiblePopButton: false,
      /*insideLine: MaskForCameraViewInsideLine(
        position: MaskForCameraViewInsideLinePosition.partOne,
        direction: MaskForCameraViewInsideLineDirection.horizontal,
      ),*/
      boxWidth: 600.0,
      boxHeight: 400.0,
      /*insideLine: MaskForCameraViewInsideLine(
        position: MaskForCameraViewInsideLinePosition.endPartOne,
        direction: MaskForCameraViewInsideLineDirection.horizontal,
      ),*/
      boxBorderWidth: 2,
      borderType: MaskForCameraViewBorderType.solid,
      cameraDescription: cameras.first,
      onTake: (MaskForCameraViewResult? res) => res != null
          ? showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 14.0),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26.0),
                    topRight: Radius.circular(26.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Cropped Image",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    res.croppedImage != null
                        ? MyImageView(imageBytes: res.croppedImage!)
                        : Container(),
                    const SizedBox(height: 8.0),
                    /*Row(
                children: [
                  res.firstPartImage != null
                      ? Expanded(
                          child: MyImageView(imageBytes: res.firstPartImage!))
                      : Container(),
                  res.firstPartImage != null && res.secondPartImage != null
                      ? const SizedBox(width: 8.0)
                      : Container(),
                  res.secondPartImage != null
                      ? Expanded(
                          child: MyImageView(imageBytes: res.secondPartImage!))
                      : Container(),
                ],
              ),*/
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.close),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            print('Tapped Okay');
                            Navigator.pop(context);
                            File? imageFile =
                                await _convertToFile(res.croppedImage);
                            widget.onImageCaptured(imageFile);
                          },
                          child: const Icon(Icons.check),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : {},
    );
  }
}

class MyImageView extends StatelessWidget {
  const MyImageView({super.key, required this.imageBytes});

  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: SizedBox(
        width: double.infinity,
        child: Image.memory(imageBytes),
      ),
    );
  }
}
