import 'package:farm_infinity/models/AadhaarKycOcrDataFront.dart';
import 'package:farm_infinity/screens/landing_page.dart';
import 'package:farm_infinity/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../helper/MySingleton.dart';
import 'aadhaar_kyc_front_upload_activity_page.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  // Retrieving the session ID
  Future<String> getSessionId() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'sessionId') ??
        ''; // Default value if not found
  }

// Retrieving the user ID
  Future<String> getUserId() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'userId') ??
        ''; // Default value if not found
  }

  Future<void> _initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    final mySingleton = MySingleton();
    await mySingleton.configureAmplify();

    final String sessionId = await getSessionId();

    final String userId = await getUserId();

    final Map<String, dynamic> currentSession = sessionId.isNotEmpty
        ? await mySingleton.fetchCurrentSession(sessionId)
        : {};
    final bool signedIn = currentSession.isNotEmpty;

    signedIn ? _navigateToKycScreen(userId) : _navigateToLoginScreen();
  }

  _navigateToLoginScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInPage()));
  }

  _navigateToKycScreen(String userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AadhaarKycFrontUploadActivityPage(
          userId: userId,
        ),
      ),
    );
  }
}
