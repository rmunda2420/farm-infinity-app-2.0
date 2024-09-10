import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:farm_infinity/screens/aadhaar_kyc_back_upload_activity_page.dart';
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

class AadhaarKycUploadActivityIntermediatePage extends StatelessWidget {
  static const routeName = '/docUploadContainer';
  final String aadhaarRefId;
  final String userId;

  const AadhaarKycUploadActivityIntermediatePage(
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
                padding: const EdgeInsets.only(top: 160.0),
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
    return _FieldState(userId: userId, aadhaarRefId: aadhaarRefId);
  }
}

class _FieldState extends StatelessWidget {
  final String userId;
  final String aadhaarRefId;

  const _FieldState(
      {super.key, required this.userId, required this.aadhaarRefId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Upload your Aadhaar',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
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
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0), // Half of the width/height
                      color: AppColor.completedFormStatusIconBackgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/icon_tic.svg',
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 200,
                    child: Text(
                      'Successfully uploaded front page',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Upload back page',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AadhaarKycBackUploadActivityPage(
                        aadhaarRefId:aadhaarRefId,
                        userId: userId,
                      ),
                ),
              );
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
}
