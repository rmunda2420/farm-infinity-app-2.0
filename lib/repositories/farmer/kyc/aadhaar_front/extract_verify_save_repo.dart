import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/AadhaarId.dart';
import 'package:farm_infinity/models/AadhaarKycOcrDataFront.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Import the http_parser package

late Map<String, dynamic> ocrData;
late String verificationId;

class KycExtractVerifySaveRepository {
  final String baseUrl = 'https://testapi.karza.in';

  Future<bool> ocr(String filePath) async {
    try {
      // Create a multipart request
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/v3/ocr-plus/kyc'),
      );

      // Add custom headers to the request
      request.headers['content-type'] = 'application/json';
      request.headers['x-karza-key'] = 'VnFcWJfFBvtkAT8f';

      // Add the file to the request
      request.files.add(await http.MultipartFile.fromPath(
        'file', // Field name for the file
        filePath, // Path to the file you want to upload
        contentType: MediaType('image', 'jpg'), // Set the content type
      ));

      // Add other form fields as needed
      //request.fields['maskAadhaarText'] = 'EIGHT_DIGITS';
      request.fields['requiredConfidence'] = 'true';

      // Send the request and get the response
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseJson = await response.stream.bytesToString();
        final Map<String, dynamic> jsonData = json.decode(responseJson);
        safePrint(jsonData);
        if (jsonData['statusCode'] == 101) {
          ocrData = jsonData;
          safePrint('In ocr: $ocrData');
          return true;
        }
        // Show message for corresponding error code 1xx
        return false;
      } else {
        // Handle error code
        throw Exception('Some error occurred');
        return false;
      }
    } catch (error) {
      // Handle the error, e.g., log it or show a user-friendly error message
      safePrint('Error in ocr request: $error');
      return false;
      // You can also re-throw the error if needed
      // rethrow;
    }
  }

  Future<bool> verify() async {
    final String caseId = generateRandomID();
    try {
      // Check user consent
      final Map<String, dynamic> consentInfo = await consent(caseId);

      // Verify aadhaar if consent accepted
      if (consentInfo['statusCode'] == 101) {
        safePrint('In verify: $ocrData');
        // Define your post parameters as a Map
        final Map<String, dynamic> postParams = {
          //'aadhaarNo': '977183955079',
          'aadhaarNo': ocrData['result']['documents'][0]['ocrData']['aadhaar']
          ['value'],
          'consent': 'Y',
          'accessKey': consentInfo['result']['accessKey'],
          'clientData': {'caseId': caseId}
          // Add more parameters as needed
        };
        safePrint('params $postParams');
        // Serialize the post parameters to JSON
        final String postParamsJson = json.encode(postParams);

        final response = await http.post(
          Uri.parse('$baseUrl/v2/aadhaar-verification'),
          headers: {
            'Content-Type': 'application/json',
            'x-karza-key': 'VnFcWJfFBvtkAT8f' // Set the content type to JSON
          },
          body: postParamsJson, // Use the serialized JSON as the request body
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          safePrint(jsonData);
          if (jsonData['status-code'] == '101') {
            verificationId = jsonData['request_id'];
            return true;
          }
          return false;
        } else {
          throw Exception('Some error occurred');
        }
      } else {
        return false;
      }
    } catch (error) {
      // Handle the error, e.g., log it or show a user-friendly error message
      safePrint('Error in verification request: $error');
      // You can also re-throw the error if needed
      rethrow;
    }
  }

  Future<Map<String, dynamic>> consent(String caseId) async {
    try {
      // Define your post parameters as a Map
      final Map<String, dynamic> postParams = {
        'lat': '19',
        'lon': '82',
        'ipAddress': '121.12.12.12',
        'consentText': 'I give my consent',
        'consentTime':
        (DateTime
            .now()
            .toUtc()
            .millisecondsSinceEpoch ~/ 1000).toString(),
        //'name': 'Alok Kumar Ekka',
        'name': ocrData['result']['documents'][0]['ocrData']['name']['value'],
        'consent': 'Y',
        'clientData': {'caseId': caseId}
        // Add more parameters as needed
      };

      // Serialize the post parameters to JSON
      final String postParamsJson = json.encode(postParams);

      final response = await http.post(
        Uri.parse('$baseUrl/v3/aadhaar-consent'),
        headers: {
          'Content-Type': 'application/json',
          'x-karza-key': 'VnFcWJfFBvtkAT8f' // Set the content type to JSON
        },
        body: postParamsJson, // Use the serialized JSON as the request body
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        safePrint('consent data: $jsonResponse');
        return jsonResponse;
      } else {
        throw Exception('Failed during consent');
      }
    } catch (error) {
      // Handle the error, e.g., log it or show a user-friendly error message
      safePrint('Error in consent request: $error');
      // You can also re-throw the error if needed
      rethrow;
    }
  }

  Future<String?> save(String userId) async {
    if (userId.isEmpty) {
      throw Exception('User id not found');
    }
    try {
      // Aadhaar front image model
      final frontImgData = AadhaarKycOcrDataFront(
          number: ocrData['result']['documents'][0]['ocrData']['aadhaar']
          ['value'],
          numberCS: ocrData['result']['documents'][0]['ocrData']['aadhaar']
          ['confidence'].toString(),
          name: ocrData['result']['documents'][0]['ocrData']['name']['value'],
          nameCS: ocrData['result']['documents'][0]['ocrData']['name']
          ['confidence'].toString(),
          documentType: ocrData['result']['documents'][0]['ocrData']
          ['documentType'],
          subType: ocrData['result']['documents'][0]['ocrData']['subType'],
          dob: ocrData['result']['documents'][0]['ocrData']['dob']['value'],
          dobCS: ocrData['result']['documents'][0]['ocrData']['dob']
          ['confidence'].toString(),
          father: ocrData['result']['documents'][0]['ocrData']['father']
          ['value'],
          fatherCS: ocrData['result']['documents'][0]['ocrData']['father']
          ['confidence'].toString(),
          gender: ocrData['result']['documents'][0]['ocrData']['gender']
          ['value'],
          genderCS: ocrData['result']['documents'][0]['ocrData']['gender']
          ['confidence'].toString(),
          husband: ocrData['result']['documents'][0]['ocrData']['husband']
          ['value'],
          husbandCS: ocrData['result']['documents'][0]['ocrData']['husband']
          ['confidence'].toString(),
          mother: ocrData['result']['documents'][0]['ocrData']['mother']
          ['value'],
          motherCS: ocrData['result']['documents'][0]['ocrData']['mother']
          ['confidence'].toString(),
          yob: ocrData['result']['documents'][0]['ocrData']['yob']['value'],
          yobCS: ocrData['result']['documents'][0]['ocrData']['yob']
          ['confidence'].toString());

      // Save front image data
      await Amplify.DataStore.save(frontImgData);

      // Aadhaar parent table model
      final aadhaarId = AadhaarId(
          userId: userId,
          verified: true,
          verificationId: verificationId,
          AadhaarToAadhaarKycOcrFront: frontImgData,
          aadhaarIdAadhaarToAadhaarKycOcrFrontId: frontImgData.id
      );

      // Save AadhaarId with reference to the front image
      await Amplify.DataStore.save(aadhaarId);

      safePrint('Saved');
      return aadhaarId.id;
    } on DataStoreException catch (e) {
      safePrint('Something went wrong saving model: ${e.message}');
      return null;
    } catch (e) {
      safePrint('Error $e');
      return null;
    }
  }

  // Alternate method using graphQL not in use
  Future<bool> saveData() async {
    try {
      // Create an instance of AadhaarKycOcrDataFront
      final frontImg = AadhaarKycOcrDataFront(
        number: '977183955079',
        name: 'Alok Kumar Ekka',
      );
      safePrint(frontImg.id);
      // Generate a GraphQL mutation for creating AadhaarKycOcrDataFront
      final frontImgMutation = ModelMutations.create(frontImg);

      // Perform the mutation to create AadhaarKycOcrDataFront
      final frontImgResponse =
      await Amplify.API
          .mutate(request: frontImgMutation)
          .response;

      // Assuming the Amplify Flutter API doesn't return null for 'data'
      final createdFrontImg = frontImgResponse.data;

      // Create an instance of AadhaarId with reference to the front image
      final aadhaarId = AadhaarId(
        userId: '4e58b7',
        verified: true,
        verificationId: 'eyg12-fghd7-qw2',
        //frontRefId: createdFrontImg?.id, // Assuming you have a field for reference ID
      );

      // Generate a GraphQL mutation for creating AadhaarId
      final aadhaarIdMutation = ModelMutations.create(aadhaarId);

      // Perform the mutation to create AadhaarId
      final aadhaarIdResponse =
      await Amplify.API
          .mutate(request: aadhaarIdMutation)
          .response;

      safePrint('Data saved successfully');
      return true;
    } on ApiException catch (e) {
      // Handle API exceptions
      safePrint('Mutation failed: $e');
      return false;
    }
  }

  // Used to generate case id for aadhaar verification
  String generateRandomID() {
    const String characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final Random random = Random();
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < 5; i++) {
      final int randomIndex = random.nextInt(characters.length);
      buffer.write(characters[randomIndex]);
    }

    return buffer.toString();
  }
}
