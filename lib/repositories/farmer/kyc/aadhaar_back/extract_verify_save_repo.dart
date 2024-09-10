import 'dart:convert';
import 'dart:math';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/AadhaarId.dart';
import 'package:farm_infinity/models/AadhaarKycOcrDataBack.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Import the http_parser package

late Map<String, dynamic> ocrData;

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

  // Not in use as verification is done in front image
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
          // Return verification status
          return (jsonData['status-code'] == '101');
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

  // Not in use as verification is done in front image
  Future<Map<String, dynamic>> consent(String caseId) async {
    try {
      // Define your post parameters as a Map
      final Map<String, dynamic> postParams = {
        'lat': '19',
        'lon': '82',
        'ipAddress': '121.12.12.12',
        'consentText': 'I give my consent',
        'consentTime':
            (DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000).toString(),
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

  Future<bool> save(String aadhaarDBRefID) async {
    try {
      final backImgData = AadhaarKycOcrDataBack(
        documentType: ocrData['result']['documents'][0]['ocrData']
            ['documentType'],
        subType: ocrData['result']['documents'][0]['ocrData']['documentType'],
        number: ocrData['result']['documents'][0]['ocrData']['aadhaar']
            ['value'],
        numberCS: ocrData['result']['documents'][0]['ocrData']['aadhaar']
                ['confidence']
            .toString(),
        addressFull: ocrData['result']['documents'][0]['ocrData']['address']
            ['value'],
        addressCS: ocrData['result']['documents'][0]['ocrData']['address']
                ['confidence']
            .toString(),
        pin: ocrData['result']['documents'][0]['ocrData']['pin']['value'],
        pinCS: ocrData['result']['documents'][0]['ocrData']['address']
                ['confidence']
            .toString(),
        building: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['building'],
        city: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['city'],
        district: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['district'],
        floor: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['floor'],
        house: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['house'],
        locality: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['locality'],
        state: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['state'],
        street: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['street'],
        complex: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['building'],
        landmark: ocrData['result']['documents'][0]['additionalDetails']['addressSplit']
            ['landmark'],
      );

      // Save back image
      await Amplify.DataStore.save(backImgData);

      // Retrieve the previously saved AadhaarId
      final List<AadhaarId> existingAadhaarIds = await Amplify.DataStore.query(
        AadhaarId.classType,
        where: AadhaarId.ID.eq(aadhaarDBRefID),
      );
      if (existingAadhaarIds.isNotEmpty) {
        // Update the first AadhaarId found with the reference to the back image
        final updatedAadhaarId = existingAadhaarIds.first.copyWith(
          AadhaarToAadhaarKycOcrBack: backImgData,
          aadhaarIdAadhaarToAadhaarKycOcrBackId: backImgData.id
        );
        // Save AadhaarId with reference to the back image
        await Amplify.DataStore.save(updatedAadhaarId);
      }

      safePrint('Saved');
      return true;
    } on DataStoreException catch (e) {
      safePrint('Something went wrong saving model: ${e.message}');
      return false;
    } catch (e) {
      safePrint('Error $e');
      return false;
    }
  }

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
