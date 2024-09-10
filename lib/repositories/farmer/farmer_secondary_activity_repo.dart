import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/FarmerSecondaryActivity.dart';

class FarmerSecondaryActivityRepo {
  Future<void> create(FarmerSecondaryActivity farmerSecondaryActivity) async {
    try {
      await Amplify.DataStore.save(farmerSecondaryActivity);
      safePrint('Secondary activity added successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error saving Secondary activity data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<void> update(String farmerSecondaryActivityId, int value) async {
    try {
      // Select the record
      final List<FarmerSecondaryActivity> farmerSecondaryActivities =
          await Amplify.DataStore.query(FarmerSecondaryActivity.classType,
              where: FarmerSecondaryActivity.ID.eq(farmerSecondaryActivityId));

      FarmerSecondaryActivity oldFarmerSecondaryActivity =
          farmerSecondaryActivities.first;

      FarmerSecondaryActivity newFarmerSecondaryActivity =
          oldFarmerSecondaryActivity.copyWith(activityId: value);

      await Amplify.DataStore.save(newFarmerSecondaryActivity);
      safePrint('Secondary activity updated successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error updating Secondary activity data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<List<FarmerSecondaryActivity>> fetch(
      String farmerSecondaryActivityId) async {
    try {
      final List<FarmerSecondaryActivity> farmerSecondaryActivities =
          await Amplify.DataStore.query(FarmerSecondaryActivity.classType,
              where: FarmerSecondaryActivity.ID.eq(farmerSecondaryActivityId));
      return farmerSecondaryActivities;
    } catch (e) {
      safePrint('Error fetching secondary activity: $e');
      return [];
    }
  }
}
