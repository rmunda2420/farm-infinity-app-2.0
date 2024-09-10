import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/repositories/BaseDataRepository.dart';

import '../../models/Farming.dart';

class FarmingRepo implements BaseDataRepository<Farming> {
  @override
  Future<void> autoUpdateField<T>(
      String farmingId, String keyToUpdate, T value, {bool? isSecondaryActivity}) async {
    try {
      // Retrieve the previously saved bio
      final List<Farming> existingFarmingActivities =
          await Amplify.DataStore.query(
        Farming.classType,
        where: Farming.ID.eq(farmingId) & Farming.ISSECONDARYACTIVITY.eq(isSecondaryActivity)
      );
      if (existingFarmingActivities.isNotEmpty) {
        Farming oldFarmingActivity = existingFarmingActivities.first;
        Farming newFarmingActivity = oldFarmingActivity;

        // Use a switch statement to update the specified field
        switch (keyToUpdate) {
          case 'landOwned':
            newFarmingActivity =
                oldFarmingActivity.copyWith(landOwned: value as double);
            break;
          case 'areaUnit':
            newFarmingActivity =
                oldFarmingActivity.copyWith(areaUnit: value as String);
            break;
          case 'areaUnitId':
            newFarmingActivity =
                oldFarmingActivity.copyWith(areaUnitId: value as int);
            break;
          case 'cultivationArea':
            newFarmingActivity =
                oldFarmingActivity.copyWith(cultivationArea: value as double);
            break;
          case 'isPostHarvestStorageAvailable':
            newFarmingActivity = oldFarmingActivity.copyWith(
                isPostHarvestStorageAvailable: value as bool);
            break;
          case 'isCropInsured':
            newFarmingActivity =
                oldFarmingActivity.copyWith(isCropInsured: value as bool);
            break;
          default:
            safePrint('Invalid field: $keyToUpdate');
            return;
        }
        await Amplify.DataStore.save(newFarmingActivity);
        // Optionally, you can handle success or show a message
        safePrint('Farm data updated successfully');
      }
    } catch (e) {
      // Handle errors
      safePrint('Error while updating data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  @override
  Future<void> create(Farming farming) async {
    try {
      await Amplify.DataStore.save(farming);
      // Optionally, you can handle success or show a message
      safePrint('Farming data created successfully');
    } catch (e) {
      // Handle errors
      safePrint('Error saving farming activity data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  @override
  Future<Farming?> fetch(String farmingId, {bool? isSecondaryActivity}) async {
    try {
      final List<Farming> farmings = await Amplify.DataStore.query(
        Farming.classType,
        where: Farming.ID.eq(farmingId) & Farming.ISSECONDARYACTIVITY.eq(isSecondaryActivity)
      );

      if (farmings.isNotEmpty) {
        final Farming farming = farmings.first;
        return farming;
      } else {
        safePrint('Farming activity data not found for $farmingId');
      }
    } catch (e) {
      safePrint('Error fetching Farming activity data: $e');
    }
    return null;
  }
}
