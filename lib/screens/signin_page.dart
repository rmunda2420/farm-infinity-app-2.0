import 'dart:convert';
import 'package:farm_infinity/screens/farmer_dashboard_page.dart';
import 'package:farm_infinity/screens/officer_dashboard_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:http/http.dart' as http;

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/screens/farmer_signup_page.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:farm_infinity/widgets/custom_rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _showOtpContainer = false;
  bool _isAgent = false;
  bool _isStaff = false;
  late String _phoneNumber;

  final TextEditingController userIdTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  // callback function
  void toggleFields(phoneNumber) {
    setState(() {
      _showOtpContainer = !_showOtpContainer;
      _phoneNumber = phoneNumber;
    });
  }

  // callback function
  void toggleUser() {
    setState(() {
      _isAgent = !_isAgent;
      _showOtpContainer = false;
    });
  }

  Future<void> authenticateStaff() async {
    String userId = userIdTextEditingController.text.trim();
    String password = passwordTextEditingController.text.trim();
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";

      String endPoint =
          "/${dotenv.env['AMPLIFY_ENV']}/auth/login"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> params = {
        'userId': userId,
        'password': password,
        'staff': _isStaff ? 'true' : 'false'
      };

      // Encode the query parameters.
      String queryString = Uri(queryParameters: params).query;

      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, endPoint);

      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: queryString);
      final data = json.decode(response.body);
      safePrint('Response: $data');

      if (response.statusCode == 200) {
        final sessionId = data["sessionId"];
        final userId = data['userData'][0]['user_id']['S'];
        // Saving the session info locally
        const storage = FlutterSecureStorage();
        // Save session id
        await storage.write(key: 'sessionId', value: sessionId);
        // Save user id
        await storage.write(key: 'userId', value: userId);
        await storage.write(key: 'isInternalUser', value: 'true');
        await storage.write(key: 'isStaff', value: 'true');
        // Navigate to next page
        navigateToDashboard();
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        throw Exception('Some error occurred');
      }
    } catch (error) {
      safePrint('Error: $error');
    }
  }

  void navigateToDashboard() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OfficerDashboardPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: _isAgent
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Top button container starts here
                  Container(
                    width: double.infinity,
                    color: AppColor.lightBlueColor,
                    height: 300,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 80),
                            child: const Text(
                              'You Are?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    toggleUser();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      color: AppColor.whiteColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipOval(
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                color: AppColor.disabledColor),
                                          ),
                                          const SizedBox(
                                            width: 90,
                                            child: Center(
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    'Farmer',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor
                                                            .disabledColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _isAgent ? null : toggleUser();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      color: AppColor.primaryColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipOval(
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                color: AppColor.whiteColor),
                                          ),
                                          const SizedBox(
                                            width: 90,
                                            child: Center(
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    'Field Agent',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: AppColor
                                                            .whiteColor),
                                                  ),
                                                ],
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
                      ],
                    ),
                  ),
                  // Bottom container
                  if (_isStaff)
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Container(
                            width: double.infinity,
                            color: AppColor.whiteColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlutterSwitch(
                                        activeColor: AppColor.primaryColor,
                                        inactiveColor: AppColor.mediumBlueColor,
                                        width: 100.0,
                                        height: 30.0,
                                        valueFontSize: 12.0,
                                        toggleSize: 30.0,
                                        value: _isStaff,
                                        borderRadius: 30.0,
                                        padding: 6.0,
                                        showOnOff: true,
                                        inactiveText: 'Staff Off',
                                        activeText: 'Staff On',
                                        inactiveTextFontWeight:
                                            FontWeight.normal,
                                        activeTextFontWeight: FontWeight.normal,
                                        onToggle: (val) async {
                                          setState(() {
                                            _isStaff = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.primaryColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: userIdTextEditingController,
                                    onChanged: (text) {
                                      final cursorPosition =
                                          userIdTextEditingController.selection;
                                      userIdTextEditingController.value =
                                          userIdTextEditingController.value
                                              .copyWith(
                                        text: text.toUpperCase(),
                                        selection: cursorPosition,
                                      );
                                    },
                                    style: const TextStyle(
                                      decoration: TextDecoration
                                          .none, // Removes underline from the text
                                    ),
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: AppColor.lightBlueColor,
                                      border: OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      counterStyle: TextStyle(
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.primaryColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: passwordTextEditingController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: AppColor.lightBlueColor,
                                      border: OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  CustomRoundedElevatedButton(
                                    text: 'Sign In',
                                    onPressed: () {
                                      authenticateStaff();
                                    },
                                    backgroundColor: AppColor.accentColor,
                                    textColor: AppColor.whiteColor,
                                    fontSize: 22,
                                    width: 160,
                                    height: 54,
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: 300,
                                    child: Center(
                                      child: Wrap(
                                        children: [
                                          RichText(
                                            text: const TextSpan(children: [
                                              TextSpan(
                                                text:
                                                    'By signing In you accept our ',
                                                style: TextStyle(
                                                    color:
                                                        AppColor.disabledColor,
                                                    fontSize: 16),
                                              ),
                                              TextSpan(
                                                text: 'Tnc',
                                                style: TextStyle(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColor.primaryColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterSwitch(
                                      activeColor: AppColor.primaryColor,
                                      inactiveColor: AppColor.mediumBlueColor,
                                      width: 100.0,
                                      height: 30.0,
                                      valueFontSize: 12.0,
                                      toggleSize: 30.0,
                                      value: _isStaff,
                                      borderRadius: 30.0,
                                      padding: 6.0,
                                      showOnOff: true,
                                      inactiveText: 'Staff Off',
                                      activeText: 'Staff On',
                                      inactiveTextFontWeight: FontWeight.normal,
                                      activeTextFontWeight: FontWeight.normal,
                                      onToggle: (val) async {
                                        setState(() {
                                          _isStaff = val;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              if (_showOtpContainer)
                                OtpContainerInternalUser(
                                  phoneNumber: _phoneNumber,
                                  callbackFunction: toggleFields,
                                  isStaff: _isStaff,
                                )
                              else
                                MobileNoContainerInternalUser(
                                  callbackFunction: toggleFields,
                                  isStaff: _isStaff,
                                )
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ) // Agent ends here
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Top container
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Stack(
                      children: [
                        Container(
                          color: AppColor.lightBlueColor,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 80),
                            child: const Text(
                              'You Are?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        // Agent button
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Container button farmer starts here
                                InkWell(
                                  onTap: () {
                                    _isAgent ? toggleUser() : null;
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      color: AppColor.primaryColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipOval(
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                color: AppColor.whiteColor),
                                          ),
                                          const SizedBox(
                                            width: 90,
                                            child: Center(
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    'Farmer',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor
                                                            .whiteColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Container button agent starts here
                                InkWell(
                                  onTap: () {
                                    toggleUser();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      color: AppColor.whiteColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipOval(
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                color: AppColor.disabledColor),
                                          ),
                                          const SizedBox(
                                            width: 90,
                                            child: Center(
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    'Field Agent',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: AppColor
                                                            .disabledColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Bottom container
                  if (_showOtpContainer)
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: OtpContainer(
                          phoneNumber: _phoneNumber,
                          callbackFunction: toggleFields,
                        ),
                      ),
                    )
                  else
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: MobileNoContainer(
                          callbackFunction: toggleFields,
                        ),
                      ),
                    )
                ],
              ),
            ),
    );
  }
}

// Mobile number container
class MobileNoContainer extends StatefulWidget {
  final Function callbackFunction;

  const MobileNoContainer({super.key, required this.callbackFunction});

  @override
  State<MobileNoContainer> createState() => _MobileNoContainerState();
}

class _MobileNoContainerState extends State<MobileNoContainer> {
  final TextEditingController phoneNumberFieldController =
      TextEditingController();
  bool isSendOtpButtonEnabled = false;

  /*Future<void> _sendOTPCode() async {
    String phoneNumber = '+91${phoneNumberFieldController.text.trim()}';
    try {
      final result = await Amplify.Auth.signIn(
        username: phoneNumber,
        //password: 'Asr!23###'
      );
      safePrint('Sign in result: $result');
      widget.callbackFunction(phoneNumber);
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }*/

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Future<void> _sendOtp(BuildContext context) async {
    String phoneNumber = phoneNumberFieldController.text.trim();
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";

      String endPoint =
          "/${dotenv.env['AMPLIFY_ENV']}/auth/farmer/login"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> queryParameters = {'phoneNumber': phoneNumber};

      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, endPoint, queryParameters);

      _showSnackBar('Please wait');

      final response = await http.get(uri);
      final data = json.decode(response.body);
      safePrint('Response: $data');

      if (response.statusCode == 200) {
        // Move to otp page
        widget.callbackFunction(phoneNumber);
      } else if (response.statusCode == 500) {
        _showSnackBar('Failed to send otp');
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        _showSnackBar('Failed to send otp');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      _showSnackBar('Failed to send otp');
      safePrint('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Row(
              children: [
                Text(
                  'Mobile Number',
                  style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: phoneNumberFieldController,
              onChanged: (value) {
                if (value.trim().length == 10) {
                  setState(() {
                    isSendOtpButtonEnabled = true;
                  });
                } else {
                  setState(() {
                    isSendOtpButtonEnabled = false;
                  });
                }
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                filled: true,
                fillColor: AppColor.lightBlueColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('+91'),
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 10, minHeight: 10),
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomRoundedElevatedButton(
              text: 'Get Otp',
              onPressed: () {
                isSendOtpButtonEnabled ? _sendOtp(context) : null;
              },
              backgroundColor: isSendOtpButtonEnabled
                  ? AppColor.accentColor
                  : AppColor.disabledColor,
              textColor: AppColor.whiteColor,
              fontSize: 22,
              width: 160,
              height: 54,
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 300,
              child: Center(
                child: Wrap(
                  children: [
                    Text(
                      'OTP will be send to your registered mobile number',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: AppColor.disabledColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            /*SizedBox(
              width: 300,
              child: Center(
                child: Wrap(
                  children: [
                    InkWell(
                      splashColor: Colors.white30,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FarmerSignupPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign-Up',
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.6,
                            color: AppColor.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

// Otp container
class OtpContainer extends StatefulWidget {
  final String phoneNumber;
  final Function callbackFunction;

  const OtpContainer(
      {super.key, required this.callbackFunction, required this.phoneNumber});

  @override
  State<OtpContainer> createState() => _OtpContainerState();
}

class _OtpContainerState extends State<OtpContainer>
    with SingleTickerProviderStateMixin {
  final TextEditingController otpFieldController = TextEditingController();
  String code = "";
  bool isSignInButtonEnabled = false;
  bool isResendOtpButtonDisabled = true;
  AnimationController? _animationController;
  int levelClock = 2 * 60;

  /*Future<void> _confirmOTPCode() async {
    try {
      final result = await Amplify.Auth.confirmSignIn(
        confirmationValue: otpController.text.trim(),
      );
      // Go to next screen
      safePrint('Sign in result: $result');
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }*/

  /*Future<void> _resendOtp() async {

    try {
      final result = await Amplify.Auth.signIn(
        username: widget.phoneNumber,
      );
    } on AuthException catch (e) {
      safePrint('Error resending otp: ${e.message}');
    }

  }*/

  Future<void> _verifyOtp(BuildContext context) async {
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";
      String path =
          "/${dotenv.env['AMPLIFY_ENV']}/auth/farmer/login"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> queryParameters = {
        'phoneNumber': widget.phoneNumber,
        'otp': otpFieldController.text.trim()
      };
      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, path, queryParameters);

      final response = await http.get(uri);
      final data = json.decode(response.body);
      safePrint('Response: $data');
      _showSnackBar('Please wait..');
      if (response.statusCode == 200) {
        final sessionId = data["sessionId"];
        final userId = data['userData']['user_id']['S'];
        // Saving the session info locally
        const storage = FlutterSecureStorage();
        // Save session id
        await storage.write(key: 'sessionId', value: sessionId);
        // Save user id
        await storage.write(key: 'userId', value: userId);

        // Move to kyc upload page or perform other actions
        navigateToNextScreen(userId);
      } else if (response.statusCode == 400) {
        safePrint('Otp verification failed');
        _showSnackBar('Otp did not match');
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        _showSnackBar('Some error occurred');
        throw Exception('Failed to create session data');
      }
    } catch (error) {
      _showSnackBar('Some error occurred');
      safePrint('Error: $error');
    }
  }

  Future<void> _resendOtp(BuildContext context) async {
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";
      String path =
          "/${dotenv.env['AMPLIFY_ENV']}/auth/farmer/login"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> queryParameters = {'phoneNumber': widget.phoneNumber};
      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, path, queryParameters);
      _showSnackBar('Please wait');
      final response = await http.get(uri);
      final data = json.decode(response.body);
      safePrint('Response: $data');

      if (response.statusCode == 500) {
        // Move to otp page
        _showSnackBar('Failed to send otp');
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        _showSnackBar('Failed to send otp');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      safePrint('Error: $error');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void navigateToNextScreen(String userId) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        //builder: (context) => AadhaarKycFrontUploadActivityPage(userId: userId),
        //Temporary
        builder: (context) => FarmerDashboardPage(userId: userId),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));

    _animationController!.addListener(() {
      if (_animationController!.isCompleted) {
        setState(() {
          isResendOtpButtonDisabled = false;
        });
      }
    });

    _animationController!.forward();
    _listenSmsCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    _animationController!.dispose();
    super.dispose();
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Row(
              children: [
                Text(
                  'OTP',
                  style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PinFieldAutoFill(
              controller: otpFieldController,
              codeLength: 6,
              autoFocus: true,
              decoration: UnderlineDecoration(
                lineHeight: 2,
                lineStrokeCap: StrokeCap.square,
                bgColorBuilder: PinListenColorBuilder(
                    AppColor.lightBlueColor, Colors.grey.shade200),
                colorBuilder: const FixedColorBuilder(Colors.transparent),
              ),
              currentCode: code,
              onCodeChanged: (currentCode) {
                //print('Your current code is $currentCode');
                code = currentCode ?? "";
                //print(code);
                if (currentCode!.length == 6) {
                  setState(() {
                    isSignInButtonEnabled = true;
                  });
                }
              },
            ),
            /*const TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.lightBlueColor,
            border: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),*/
            const SizedBox(
              height: 60,
            ),
            CustomRoundedElevatedButton(
              text: 'Sign In',
              onPressed: () async {
                isSignInButtonEnabled ? await _verifyOtp(context) : null;
              },
              backgroundColor: isSignInButtonEnabled
                  ? AppColor.accentColor
                  : AppColor.disabledColor,
              textColor: AppColor.whiteColor,
              fontSize: 22,
              width: 160,
              height: 54,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Resend code after: "),
                Countdown(
                  animation: StepTween(
                    begin: levelClock, // THIS IS A USER ENTERED NUMBER
                    end: 0,
                  ).animate(_animationController!),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Center(
                child: Wrap(
                  children: [
                    InkWell(
                      onTap: isResendOtpButtonDisabled
                          ? null
                          : () {
                              _resendOtp(context);
                              setState(() {
                                _animationController!.reset();
                                _animationController!.forward();
                                isResendOtpButtonDisabled = true;
                              });
                            },
                      child: Text(
                        'Resend Otp',
                        style: TextStyle(
                            fontSize: 20,
                            color: isResendOtpButtonDisabled
                                ? AppColor.disabledColor
                                : AppColor.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 300,
              child: Center(
                child: Wrap(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.callbackFunction();
                      },
                      child: const Text(
                        '<<Back',
                        style: TextStyle(
                            fontSize: 18, color: AppColor.disabledColor),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PHONE NO CONTAINER FOR INTERNAL USER
class MobileNoContainerInternalUser extends StatefulWidget {
  final Function callbackFunction;
  final bool isStaff;

  const MobileNoContainerInternalUser(
      {super.key, required this.callbackFunction, required this.isStaff});

  @override
  State<MobileNoContainerInternalUser> createState() =>
      _MobileNoContainerInternalUserState();
}

class _MobileNoContainerInternalUserState
    extends State<MobileNoContainerInternalUser> {
  final TextEditingController phoneNumberFieldController =
      TextEditingController();
  bool isSendOtpButtonEnabled = false;

  /*Future<void> _sendOTPCode() async {
    String phoneNumber = '+91${phoneNumberFieldController.text.trim()}';
    try {
      final result = await Amplify.Auth.signIn(
        username: phoneNumber,
        //password: 'Asr!23###'
      );
      safePrint('Sign in result: $result');
      widget.callbackFunction(phoneNumber);
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }*/

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Future<void> _sendOtp(BuildContext context) async {
    String phoneNumber = phoneNumberFieldController.text.trim();
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";

      String endPoint =
          "/${dotenv.env['AMPLIFY_ENV']}/auth/login"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> params = {
        'userId': phoneNumber,
        'staff': widget.isStaff ? 'true' : 'false'
      };

      // Encode the query parameters.
      String queryString = Uri(queryParameters: params).query;

      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, endPoint);

      _showSnackBar('Please wait');

      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: queryString);
      final data = json.decode(response.body);
      safePrint('Response: $data');

      if (response.statusCode == 200) {
        // Move to otp page
        widget.callbackFunction(phoneNumber);
      } else if (response.statusCode == 500) {
        _showSnackBar('Failed to send otp');
      } else if (response.statusCode == 400) {
        _showSnackBar('Phone number not found');
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        _showSnackBar('Some error occurred');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      _showSnackBar('Some error occurred');
      safePrint('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  'Mobile Number',
                  style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: phoneNumberFieldController,
              onChanged: (value) {
                if (value.trim().length == 10) {
                  setState(() {
                    isSendOtpButtonEnabled = true;
                  });
                } else {
                  setState(() {
                    isSendOtpButtonEnabled = false;
                  });
                }
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                filled: true,
                fillColor: AppColor.lightBlueColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('+91'),
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 10, minHeight: 10),
                border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomRoundedElevatedButton(
              text: 'Get Otp',
              onPressed: () {
                isSendOtpButtonEnabled ? _sendOtp(context) : null;
              },
              backgroundColor: isSendOtpButtonEnabled
                  ? AppColor.accentColor
                  : AppColor.disabledColor,
              textColor: AppColor.whiteColor,
              fontSize: 22,
              width: 160,
              height: 54,
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 300,
              child: Center(
                child: Wrap(
                  children: [
                    Text(
                      'OTP will be send to your registered mobile number',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: AppColor.disabledColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            /*SizedBox(
              width: 300,
              child: Center(
                child: Wrap(
                  children: [
                    InkWell(
                      splashColor: Colors.white30,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FarmerSignupPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign-Up',
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.6,
                            color: AppColor.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

// OTP CONTAINER INTERNAL USER
class OtpContainerInternalUser extends StatefulWidget {
  final String phoneNumber;
  final Function callbackFunction;
  final bool isStaff;

  const OtpContainerInternalUser(
      {super.key,
      required this.callbackFunction,
      required this.phoneNumber,
      required this.isStaff});

  @override
  State<OtpContainerInternalUser> createState() =>
      _OtpContainerInternalUserState();
}

class _OtpContainerInternalUserState extends State<OtpContainerInternalUser>
    with SingleTickerProviderStateMixin {
  final TextEditingController otpFieldController = TextEditingController();
  String code = "";
  bool isSignInButtonEnabled = false;
  bool isResendOtpButtonDisabled = true;
  AnimationController? _animationController;
  int levelClock = 2 * 60;

  /*Future<void> _confirmOTPCode() async {
    try {
      final result = await Amplify.Auth.confirmSignIn(
        confirmationValue: otpController.text.trim(),
      );
      // Go to next screen
      safePrint('Sign in result: $result');
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }*/

  /*Future<void> _resendOtp() async {

    try {
      final result = await Amplify.Auth.signIn(
        username: widget.phoneNumber,
      );
    } on AuthException catch (e) {
      safePrint('Error resending otp: ${e.message}');
    }

  }*/

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Future<void> _verifyOtp(BuildContext context) async {
    String otp = otpFieldController.text.trim();
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";

      String endPoint =
          "/${dotenv.env['AMPLIFY_ENV']}/auth/login"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> params = {
        'userId': widget.phoneNumber,
        'password': otp,
        'staff': widget.isStaff ? 'true' : 'false'
      };

      // Encode the query parameters.
      String queryString = Uri(queryParameters: params).query;

      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, endPoint);
      _showSnackBar('Please wait');
      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: queryString);
      final data = json.decode(response.body);
      safePrint('Response: $data');

      if (response.statusCode == 200) {
        final sessionId = data["sessionId"];
        final userId = data['userData']['user_id']['S'];
        // Saving the session info locally
        const storage = FlutterSecureStorage();
        // Save session id
        await storage.write(key: 'sessionId', value: sessionId);
        // Save user id
        await storage.write(key: 'userId', value: userId);
        await storage.write(key: 'isInternalUser', value: 'true');
        await storage.write(key: 'isStaff', value: 'false');
        // Navigate to next page
        navigateToDashboard();
      } else if (response.statusCode == 400) {
        _showSnackBar('Otp did not match');
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        _showSnackBar('Some error occurred');
        throw Exception('Failed to create session data');
      }
    } catch (error) {
      _showSnackBar('Some error occurred');
      safePrint('Error: $error');
    }
  }

  Future<void> _resendOtp(BuildContext context) async {
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";

      String endPoint =
          "/${dotenv.env['AMPLIFY_ENV']}/auth/login"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> params = {
        'userId': widget.phoneNumber,
        'staff': widget.isStaff ? 'true' : 'false'
      };

      // Encode the query parameters.
      String queryString = Uri(queryParameters: params).query;

      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, endPoint);

      _showSnackBar('Please wait');

      final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: queryString);
      final data = json.decode(response.body);
      safePrint('Response: $data');
      if (response.statusCode == 200) {
        safePrint('Otp sent');
      } else if (response.statusCode == 500) {
        _showSnackBar('Failed to send otp');
      } else if (response.statusCode == 400) {
        _showSnackBar('Phone number not found');
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        _showSnackBar('Some error occurred');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      _showSnackBar('Some error occurred');
      safePrint('Error: $error');
    }
  }

  void navigateToDashboard() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OfficerDashboardPage()));
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));

    _animationController!.addListener(() {
      if (_animationController!.isCompleted) {
        setState(() {
          isResendOtpButtonDisabled = false;
        });
      }
    });

    _animationController!.forward();
    _listenSmsCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
    _animationController!.dispose();
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Text(
                  'OTP',
                  style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PinFieldAutoFill(
              controller: otpFieldController,
              codeLength: 6,
              autoFocus: true,
              decoration: UnderlineDecoration(
                lineHeight: 2,
                lineStrokeCap: StrokeCap.square,
                bgColorBuilder: PinListenColorBuilder(
                    AppColor.lightBlueColor, Colors.grey.shade200),
                colorBuilder: const FixedColorBuilder(Colors.transparent),
              ),
              currentCode: code,
              onCodeChanged: (currentCode) {
                //print('Your current code is $currentCode');
                code = currentCode ?? "";
                //print(code);
                if (currentCode!.length == 6) {
                  setState(() {
                    isSignInButtonEnabled = true;
                  });
                }
              },
            ),
            /*const TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.lightBlueColor,
            border: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),*/
            const SizedBox(
              height: 60,
            ),
            CustomRoundedElevatedButton(
              text: 'Sign In',
              onPressed: () async {
                isSignInButtonEnabled ? await _verifyOtp(context) : null;
              },
              backgroundColor: isSignInButtonEnabled
                  ? AppColor.accentColor
                  : AppColor.disabledColor,
              textColor: AppColor.whiteColor,
              fontSize: 22,
              width: 160,
              height: 54,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Resend code after: "),
                Countdown(
                  animation: StepTween(
                    begin: levelClock, // THIS IS A USER ENTERED NUMBER
                    end: 0,
                  ).animate(_animationController!),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Center(
                child: Wrap(
                  children: [
                    InkWell(
                      onTap: isResendOtpButtonDisabled
                          ? null
                          : () {
                              _resendOtp(context);
                              setState(() {
                                isResendOtpButtonDisabled = true;
                                _animationController!.reset();
                                _animationController!.forward();
                              });
                            },
                      child: Text(
                        'Resend Otp',
                        style: TextStyle(
                            fontSize: 20,
                            color: isResendOtpButtonDisabled
                                ? AppColor.disabledColor
                                : AppColor.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 300,
              child: Center(
                child: Wrap(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.callbackFunction();
                      },
                      child: const Text(
                        '<<Back',
                        style: TextStyle(
                            fontSize: 18, color: AppColor.disabledColor),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
