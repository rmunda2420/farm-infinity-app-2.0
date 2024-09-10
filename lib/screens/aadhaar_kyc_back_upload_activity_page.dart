import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:farm_infinity/screens/farmer_dashboard_page.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:farm_infinity/widgets/avatar_container.dart';
import 'package:farm_infinity/widgets/custom_rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/farmer/kyc/aadhaar_back/aadhaar_kyc_upload_activity_bloc.dart';
import '../blocs/farmer/kyc/aadhaar_back/extract_verify_save_aadhaar_back_cubit.dart';
import '../enums/modes.dart';

class AadhaarKycBackUploadActivityPage extends StatelessWidget {
  static const routeName = '/docUploadContainer';
  final String aadhaarRefId;
  final String userId;

  const AadhaarKycBackUploadActivityPage(
      {super.key, required this.aadhaarRefId, required this.userId});

  @override
  Widget build(BuildContext context) {
    /*final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;*/

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
                  userId: userId),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(top:160.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColor.whiteColor,
                  // Container fields
                  // This goes in bloc
                  child: FieldsContainer(
                    userId: userId,
                    aadhaarRefId: aadhaarRefId,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FieldsContainer extends StatelessWidget {
  final String userId;
  final String aadhaarRefId;

  const FieldsContainer(
      {super.key, required this.userId, required this.aadhaarRefId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AadhaarKycUploadActivityBloc(),
      child: _FieldState(userId: userId, aadhaarRefId: aadhaarRefId),
    );
  }
}

class _FieldState extends StatelessWidget {
  final String userId;
  final String aadhaarRefId;

  const _FieldState(
      {super.key, required this.userId, required this.aadhaarRefId});

  void _navigateToNextScreen(BuildContext context, userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FarmerDashboardPage(userId: userId),
      ),
    );
  }

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
                      width: 60,
                      height: 60,
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
      create: (context) => ExtractVerifySaveAadhaarBackCubit(),
      child: BlocBuilder<ExtractVerifySaveAadhaarBackCubit,
          ExtractVerifySaveAadhaarBackState>(
        builder: (context, documentState) {
          switch (documentState.runtimeType) {
            case ExtractVerifySaveAadhaarBackInitial:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context
                    .read<ExtractVerifySaveAadhaarBackCubit>()
                    .saveKycDocument(state.file!.path, aadhaarRefId);
              });
              break;
            case Extracting:
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
                            SizedBox(
                              width: double.infinity,
                              height: 320,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
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
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    if (documentState is Extracting)
                                      const Text(
                                        'Extracting',
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
            case Extracted:
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
                                    if (documentState is Extracting)
                                      const Text(
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
            case Saving:
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
            case Saved:
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
                        _navigateToNextScreen(context, userId);
                      },
                      backgroundColor: AppColor.accentColor,
                      textColor: AppColor.whiteColor,
                      fontSize: 22,
                      width: 160,
                      height: 44),
                  // ends here
                ],
              );
            case Error:
              if (documentState is Error) {
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
                    backgroundColor: Colors.red,
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
