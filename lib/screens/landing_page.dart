import 'package:farm_infinity/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:farm_infinity/styles/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_rounded_elevated_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/graphics_home.svg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: AppColor.captionColor,
                    height: 1.5,
                  ),
                  //apply style to all
                  children: [
                    TextSpan(
                      text: 'Get your scorecard and apply\nfor loan in ',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const TextSpan(
                      text: '3 easy steps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 230.0,
            left: 37.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: 190.0,
                height: 74.0,
                child: Image.asset('assets/images/farminfinity_logo.png'),
              ),
            ),
          ),
          /*Container(
            margin: const EdgeInsets.fromLTRB(100, 0, 30, 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CustomRoundedElevatedButton(
                text: 'Start',
                onPressed: () {
                  // Navigate to the new screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
                backgroundColor: AppColor.primaryColor,
                textColor: AppColor.whiteColor,
                fontSize: 16,
                width: 100,
                height: 45,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
