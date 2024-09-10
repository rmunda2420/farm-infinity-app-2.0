import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/CropInput.dart';
import 'package:farm_infinity/repositories/BaseDataRepository.dart';

class CropInputRepo implements BaseDataRepository<CropInput> {
  Future<void> delete(CropInput cropInput) async {
    try {
      await Amplify.DataStore.delete(cropInput);
      safePrint('Crop season deleted successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error deleting crop season: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  @override
  Future<List<CropInput>> fetch(String cropSeasonId,
      {bool? isSecondaryActivity}) async {
    try {
      final List<CropInput> cropInputs = await Amplify.DataStore.query(
          CropInput.classType,
          where: CropInput.CROPSEASONID.eq(cropSeasonId) &
              CropInput.ISSECONDARYACTIVITY.eq(isSecondaryActivity));
      return cropInputs;
    } catch (e) {
      safePrint('Error fetching crop input: $e');
      return [];
    }
  }

  @override
  Future<void> autoUpdateField<T>(
      String cropSeasonId, String keyToUpdate, T value,
      {bool? isSecondaryActivity}) async {
    try {
      // Retrieve the previously saved bio
      final List<CropInput> existingCropInputs = await Amplify.DataStore.query(
          CropInput.classType,
          where: CropInput.CROPSEASONID.eq(cropSeasonId) &
              CropInput.ISSECONDARYACTIVITY.eq(isSecondaryActivity));
      if (existingCropInputs.isNotEmpty) {
        CropInput oldCropInput = existingCropInputs.first;
        CropInput newCropInput = oldCropInput;

        // Use a switch statement to update the specified field
        switch (keyToUpdate) {
          case 'inputQuantity':
            newCropInput =
                oldCropInput.copyWith(inputQuantity: value as double);
            break;
          case 'quantityUnit':
            newCropInput = oldCropInput.copyWith(quantityUnit: value as String);
            break;
          case 'quantityUnitId':
            newCropInput = oldCropInput.copyWith(quantityUnitId: value as int);
            break;
          default:
            safePrint('Invalid field: $keyToUpdate');
            return;
        }
        await Amplify.DataStore.save(newCropInput);
        // Optionally, you can handle success or show a message
        safePrint('Farm data updated successfully');
      }
    } catch (e) {
      // Handle errors
      safePrint('Error while updating data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<void> updateField<T>(String cropInputId, String keyToUpdate, T value,
      {bool? isSecondaryActivity}) async {
    try {
      // Retrieve the previously saved bio
      final List<CropInput> existingCropInputs = await Amplify.DataStore.query(
          CropInput.classType,
          where: CropInput.ID.eq(cropInputId) &
              CropInput.ISSECONDARYACTIVITY.eq(isSecondaryActivity));
      if (existingCropInputs.isNotEmpty) {
        CropInput oldCropInput = existingCropInputs.first;
        CropInput newCropInput = oldCropInput;

        // Use a switch statement to update the specified field
        switch (keyToUpdate) {
          case 'inputQuantity':
            newCropInput =
                oldCropInput.copyWith(inputQuantity: value as double);
            break;
          case 'quantityUnit':
            newCropInput = oldCropInput.copyWith(quantityUnit: value as String);
            break;
          case 'quantityUnitId':
            newCropInput = oldCropInput.copyWith(quantityUnitId: value as int);
            break;
          default:
            safePrint('Invalid field: $keyToUpdate');
            return;
        }
        await Amplify.DataStore.save(newCropInput);
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
  Future<void> create(CropInput data) async {
    try {
      await Amplify.DataStore.save(data);
      safePrint('Crop input added successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error saving crop input data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }
}
