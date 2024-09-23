import 'dart:convert';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import '../configurations/amplifyconfiguration_dev.dart';
import '../configurations/amplifyconfiguration_prod.dart';
import '../models/ModelProvider.dart';

class MySingleton {
  // Private constructor to prevent external instantiation
  MySingleton._privateConstructor();

  // The single instance of the class
  static final MySingleton _instance = MySingleton._privateConstructor();

  // Factory constructor to provide access to the instance
  factory MySingleton() {
    return _instance;
  }

  // AWS auth not in use
  Future<bool> isUserSignedIn() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      safePrint(result.toJson());
      return result.isSignedIn;
    } catch (e) {
      safePrint('An error occurred while fetching Amplify Auth: $e');
    }
    return false;
  }

  // My custom user session management
  Future<Map<String, dynamic>> fetchCurrentSession(String sessionId) async {
    try {
      const String host = "it5ulprrsc.execute-api.ap-south-1.amazonaws.com";
      const String path =
          "/test/auth/session"; // Replace with your API endpoint
      // Define your query parameters as a Map.
      Map<String, String> queryParameters = {
        'sessionId': sessionId,
      };
      // Create a Uri with the base URL and query parameters.
      Uri uri = Uri.https(host, path, queryParameters);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> data = json.decode(response.body);
          safePrint('Response session: $data');
          return data;
        } catch (e) {
          // Handle the case where JSON decoding failed
          safePrint('Failed to decode JSON: $e');
          return {};
        }
      } else {
        // Handle non-200 status codes or any other error scenarios here.
        safePrint('Request failed with status: ${response.statusCode}');
        return {};
      }
    } catch (error) {
      // Handle other exceptions or errors here.
      safePrint('Error: $error');
      return {};
    }
  }

  Future<void> configureAmplify() async {
    // amplify plugins
    final auth = AmplifyAuthCognito();
    final storage = AmplifyStorageS3();
    final dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    final apiPlugin = AmplifyAPI(modelProvider: ModelProvider.instance);

    // Add Amplify plugins
    await Amplify.addPlugins([auth, storage, dataStorePlugin, apiPlugin]);

    // Choose the configuration file based on the environment
    final environment = dotenv.env['AMPLIFY_ENV'];
    final amplifyConfig = environment == 'prod'
        ? amplifyconfigProd
        : amplifyconfigDev;

    // Configure Amplify
    try {
      await Amplify.configure(amplifyConfig);
      safePrint('Amplify configured successfully for $environment environment');
    } catch (e) {
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }

  // Future<void> configureAmplify() async {
  //   // amplify plugins
  //   final auth = AmplifyAuthCognito();
  //   final storage = AmplifyStorageS3();
  //   final dataStorePlugin =
  //       AmplifyDataStore(modelProvider: ModelProvider.instance);
  //   final apiPlugin = AmplifyAPI(modelProvider: ModelProvider.instance);
  //
  //   // Add Amplify plugins
  //   await Amplify.addPlugins([auth, storage, dataStorePlugin, apiPlugin]);
  //
  //   // Configure Amplify
  //   // Note that Amplify cannot be configured more than once!
  //   try {
  //     await Amplify.configure(amplifyconfig);
  //     safePrint('Amplify configured successfully');
  //   } catch (e) {
  //     // error handling can be improved for sure!
  //     // but this will be sufficient for the purposes of this tutorial
  //     safePrint('An error occurred while configuring Amplify: $e');
  //   }
  // }
}
