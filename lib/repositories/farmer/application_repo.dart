import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/FarmerApplication.dart';
import 'package:farm_infinity/repositories/BaseDataRepository.dart';

class ApplicationRepo implements BaseDataRepository<FarmerApplication> {
  @override
  Future<void> create(FarmerApplication farmerApplication) async {
    try {
      await Amplify.DataStore.save(farmerApplication);
      // Optionally, you can handle success or show a message
      safePrint('Application created successfully');
    } catch (e) {
      // Handle errors
      safePrint('Error saving application data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  @override
  Future<void> autoUpdateField<T>(
      String applicationId, String keyToUpdate, T value,
      {bool? isSecondaryActivity}) async {
    try {
      final List<FarmerApplication> existingApplication =
          await Amplify.DataStore.query(FarmerApplication.classType,
              where: FarmerApplication.APPLICATIONID.eq(applicationId));
      if (existingApplication.isNotEmpty) {
        FarmerApplication oldApplication = existingApplication.first;
        FarmerApplication newApplication = oldApplication;
        switch (keyToUpdate) {
          case 'activityId':
            newApplication = oldApplication.copyWith(activityId: value as int);
            break;
          default:
            safePrint('Invalid field: $keyToUpdate');
            return;
        }
        await Amplify.DataStore.save(newApplication);
      }
    } catch (e) {
      safePrint('Some error occured during application update $e');
    }
  }

  @override
  Future<List<FarmerApplication>?> fetch(String userId,
      {bool? isSecondaryActivity}) async {
    try {
      // Replace 'AadhaarId' with the actual name of your DataStore model
      final List<FarmerApplication> apps = await Amplify.DataStore.query(
        FarmerApplication.classType,
        where: FarmerApplication.USERID.eq(userId),
      );

      if (apps.isNotEmpty) {
        return apps;
      } else {
        safePrint('Application not found not found for User $userId');
      }
    } catch (e) {
      safePrint('Error fetching Application: $e');
    }
    return null;
  }

  Future<List<FarmerApplication>?> fetchApplication(String applicationId,
      {bool? isSecondaryActivity}) async {
    try {
      // Replace 'AadhaarId' with the actual name of your DataStore model
      final List<FarmerApplication> apps = await Amplify.DataStore.query(
        FarmerApplication.classType,
        where: FarmerApplication.APPLICATIONID.eq(applicationId),
      );

      if (apps.isNotEmpty) {
        return apps;
      } else {
        safePrint('Application not found not found for User $applicationId');
      }
    } catch (e) {
      safePrint('Error fetching Application: $e');
    }
    return null;
  }
}
