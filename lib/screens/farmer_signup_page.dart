import 'dart:convert';
import 'package:farm_infinity/screens/aadhaar_kyc_front_upload_activity_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/screens/farmer_dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../styles/colors.dart';
import '../widgets/custom_rounded_elevated_button.dart';

class FarmerSignupPage extends StatefulWidget {
  const FarmerSignupPage({super.key});

  @override
  State<FarmerSignupPage> createState() => _FarmerSignupPageState();
}

class _FarmerSignupPageState extends State<FarmerSignupPage> {
  bool _otpContainer = false;
  late String _name;
  late String _phoneNumber;

  // final String randomPassword = 'Asr!23##';

  // callback function
  void toggleContainer(name, phoneNumber) {
    setState(() {
      _otpContainer = !_otpContainer;
      _name = name;
      _phoneNumber = phoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Top container
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                children: [
                  Container(
                    color: AppColor.lightBlueColor,
                    width: double.infinity,
                  ),
                  _otpContainer
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 80),
                            padding: const EdgeInsets.only(left: 20),
                            child: const Center(
                              child: Text(
                                'We have sent you a verification code',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 80),
                            child: const Text(
                              'Sign me up!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                  // Agent button
                  /*Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                  ),
                ),*/
                ],
              ),
            ),
            // Bottom container
            _otpContainer
                ? OtpContainer(
                    name: _name,
                    phoneNumber: _phoneNumber,
                    callbackFunction: toggleContainer,
                  )
                : MobileNoContainer(
                    //password: randomPassword,
                    callbackFunction: toggleContainer,
                  )
          ],
        ),
      ),
    );
  }
}

// Mobile number container
class MobileNoContainer extends StatefulWidget {
  //final String password;
  final Function callbackFunction;

  const MobileNoContainer({super.key, required this.callbackFunction});

  @override
  State<MobileNoContainer> createState() => _MobileNoContainerState();
}

class _MobileNoContainerState extends State<MobileNoContainer> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController phoneNumberFieldController =
      TextEditingController();

  bool isSignupButtonEnabled = false;

  // Function for registering user in aws cognito
  /*Future<void> signUpWithPhoneNumber(BuildContext context) async {
    String phoneNumber = '+91${phoneNumberFieldController.text.trim()}';
    const SnackBar snackBar = SnackBar(
      content: Text('Please wait..'),
    );
    final c = ScaffoldMessenger.of(context);
    try {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      final result = await Amplify.Auth.signUp(
        username: phoneNumber,
        password: widget.password, // Password is not used for phone sign-up
        options: SignUpOptions(userAttributes: {
          AuthUserAttributeKey.name: nameFieldController.text.trim()
        }),
      );
      safePrint('result: $result');
      c.hideCurrentSnackBar();
      // Toggle to otp container
      widget.callbackFunction(phoneNumber);
    } on AuthException catch (e) {
      safePrint('Error signing up: $e');
      c.hideCurrentSnackBar();
      // widget.callbackFunction(phoneNumber);
    }
    // widget.callbackFunction(phoneNumber);
  }*/

  // Send otp

  Future<void> _sendOtp(BuildContext context) async {
    String name = nameFieldController.text.trim();
    String phoneNumber = phoneNumberFieldController.text.trim();

    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";
      const String path =
          "/test/auth/farmer/sign-up"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> queryParameters = {
        'phoneNumber': phoneNumberFieldController.text.trim()
      };
      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, path, queryParameters);

      final response = await http.get(uri);
      final data = json.decode(response.body);
      safePrint('Response: $data');

      if (response.statusCode == 200) {
        // Move to otp page
        widget.callbackFunction(name, phoneNumber);
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        throw Exception('Failed to load data');
      }
    } catch (error) {
      safePrint('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
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
                        'Name',
                        style: TextStyle(
                            fontSize: 16, color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Name input box
                  TextFormField(
                    controller: nameFieldController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
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
                      // Add errorBorder to show a red border when there is an error
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Mobile Number',
                        style: TextStyle(
                            fontSize: 16, color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Mobile number input box
                  TextField(
                    controller: phoneNumberFieldController,
                    onChanged: (value) {
                      if (value.trim().length == 10) {
                        setState(() {
                          isSignupButtonEnabled = true;
                        });
                      } else {
                        setState(() {
                          isSignupButtonEnabled = false;
                        });
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('+91'),
                      ),
                      prefixIconConstraints:
                          BoxConstraints(minWidth: 10, minHeight: 10),
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
                    text: 'Sign-up',
                    onPressed: () {
                      if (isSignupButtonEnabled) {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          _sendOtp(context);
                        }
                      }
                    },
                    backgroundColor: isSignupButtonEnabled
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
                            'Verification code will be send to above mobile number',
                            style: TextStyle(
                                fontSize: 16,
                                height: 1.6,
                                color: AppColor.disabledColor),
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}

// Otp container
class OtpContainer extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final Function callbackFunction;

  const OtpContainer(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.callbackFunction});

  @override
  State<OtpContainer> createState() => _OtpContainerState();
}

class _OtpContainerState extends State<OtpContainer>
    with SingleTickerProviderStateMixin {
  final TextEditingController confirmationCodeController =
      TextEditingController();
  String code = "";
  bool isConfirmButtonEnabled = false;
  AnimationController? _animationController;
  int levelClock = 2 * 60;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));

    _animationController!.forward();
    _listenSmsCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  // Function for resending conformation code
  /*Future<void> resendConfirmationCode() async {
    try {
      final result = await Amplify.Auth.resendSignUpCode(
        username: widget.phoneNumber,
      );
    } on AuthException catch (e) {
      safePrint('Error resending code: ${e.message}');
    }
  }*/

  /*Future<void> confirmSignUpWithCode() async {
    try {
      await Amplify.Auth.confirmSignUp(
        username: widget.phoneNumber,
        confirmationCode: confirmationCodeController.text.trim(),
      );
      // User has been confirmed.
      // Implement the logic to navigate to the next screen.
      signIn();
    } catch (e) {
      print('Error confirming sign-up: $e');
    }
  }*/

  /*Future<void> signIn() async {
    try {
      await Amplify.Auth.signIn(
        username: widget.phoneNumber,
        password: widget.password,
      );
      // User has been confirmed.
      // Implement the logic to navigate to the next screen.
      _navigateToDashboard();
    } catch (e) {
      print('Error signing in: $e');
    }
  }*/

  Future<void> _verifyOtp(BuildContext context) async {
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";
      const String path =
          "/test/auth/farmer/sign-up"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> queryParameters = {
        'phoneNumber': widget.phoneNumber,
        'otp': confirmationCodeController.text.trim()
      };
      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, path, queryParameters);

      final response = await http.get(uri);
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

        // Move to OTP page or perform other actions
        _navigateToNextScreen(userId);
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        throw Exception('Failed to create session data');
      }
    } catch (error) {
      safePrint('Error: $error');
    }
  }

  Future<void> _resendOtp(BuildContext context) async {
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";
      const String path =
          "/test/auth/farmer/sign-up"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> queryParameters = {'phoneNumber': widget.phoneNumber};
      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, path, queryParameters);

      final response = await http.get(uri);
      final data = json.decode(response.body);
      safePrint('Response: $data');

      /*if (response.statusCode == 200) {
        // Move to otp page
        widget.callbackFunction(name, phoneNumber);
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        // Process error code by showing message
        throw Exception('Failed to load data');
      }*/
    } catch (error) {
      safePrint('Error: $error');
    }
  }

  void _navigateToNextScreen(userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AadhaarKycFrontUploadActivityPage(
          userId: userId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Container(
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
                Row(
                  children: [
                    Text(
                      'On number: ${widget.phoneNumber}',
                      style: const TextStyle(
                          fontSize: 16, color: AppColor.primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                PinFieldAutoFill(
                  controller: confirmationCodeController,
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
                    //print('Your current code is ${currentCode}');
                    code = currentCode ?? "";
                    //print(code);
                    if (currentCode!.length == 6) {
                      setState(() {
                        isConfirmButtonEnabled = true;
                      });
                      // Verify otp an sign-in
                      //confirmSignUpWithCode();
                      _verifyOtp(context);
                    }
                  },
                ),
                /*TextField(
              controller: confirmationCodeController,
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
            ),*/
                const SizedBox(
                  height: 60,
                ),
                CustomRoundedElevatedButton(
                  text: 'Confirm',
                  onPressed: () async {
                    isConfirmButtonEnabled ? _verifyOtp(context) : null;
                  },
                  backgroundColor: isConfirmButtonEnabled
                      ? AppColor.accentColor
                      : AppColor.disabledColor,
                  textColor: AppColor.whiteColor,
                  fontSize: 22,
                  width: 160,
                  height: 54,
                ),
                const SizedBox(height: 20),
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
                          onTap: () async {
                            if (_animationController!.isCompleted) {
                              await _resendOtp(context);
                              _animationController!.reset();
                              _animationController!.forward();
                            } else {
                              safePrint('Cannot send sms now please wait');
                            }
                          },
                          child: const Text(
                            'Resend',
                            style: TextStyle(
                                fontSize: 20, color: AppColor.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        )
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
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  const Countdown({super.key, required this.animation})
      : super(listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Text(
      timerText,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
