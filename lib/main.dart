import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/helper/MySingleton.dart';
import 'package:farm_infinity/screens/farmer_dashboard_page.dart';
import 'package:farm_infinity/screens/officer_dashboard_page.dart';
import 'package:farm_infinity/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:farm_infinity/styles/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Load the appropriate .env file based on the build mode
  // You can use --dart-define to pass environment-specific flags when building your app.
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  safePrint('.env.$env');
  await dotenv.load(fileName: 'assets/environments/.env.$env');

  final mySingleton = MySingleton();
  await mySingleton.configureAmplify();
  // final bool signedIn = await mySingleton.isUserSignedIn();

  final String sessionId = await getSessionId();
  safePrint('session id is $sessionId');

  final String userId = await getUserId();

  final String userType = await getUserType();

  final bool isInternalUserType =
      userType.toLowerCase() == 'true' ? true : false;
  safePrint('internal user: $isInternalUserType');

  final Map<String, dynamic> currentSession = sessionId.isNotEmpty
      ? await mySingleton.fetchCurrentSession(sessionId)
      : {};
  final bool signedIn = currentSession.isNotEmpty;
  safePrint('signed in: $signedIn');
  // if session is empty del user session info from device
  if(!signedIn){
    delUserSessionInfo();
  }
  FlutterNativeSplash.remove();
  runApp(
    MyApp(
      isSignedIn: signedIn,
      userId: userId,
      isInternalUser: isInternalUserType,
    ),
  );
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
  return await storage.read(key: 'userId') ?? ''; // Default value if not found
}

// Retrieving the user type
Future<String> getUserType() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'isInternalUser') ??
      'false'; // Default value if not found
}

Future<void>delUserSessionInfo() async {
  const storage = FlutterSecureStorage();
  await storage.deleteAll();
}

class MyApp extends StatelessWidget {
  final bool isSignedIn;
  final String userId;
  final bool isInternalUser;

  const MyApp(
      {super.key,
      required this.isSignedIn,
      required this.userId,
      required this.isInternalUser});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Infinity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        primarySwatch: Colors.blue,
        // Define the default font family.
        fontFamily: 'Inter',
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 25,
            color: AppColor.captionColor,
          ),
          displayMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppColor.captionColor,
          ),
          displaySmall: TextStyle(
            fontSize: 18,
            color: AppColor.captionColor,
          ),
        ),
      ),
      //
      // home: isSignedIn
      //     ? isInternalUser
      //         ? const OfficerDashboardPage() // Your internal user page widget
      //         : AadhaarKycFrontUploadActivityPage(
      //             userId: userId,
      //           )
      //     : const SignInPage(),

      // Temporary (enable above disable this)
      home: isSignedIn
          ? isInternalUser
              ? const OfficerDashboardPage() // Your internal user page widget
              : FarmerDashboardPage(
                  userId: userId,
                )
          : const SignInPage(),
    );
  }
}
