import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/GrownCrop.dart';

class CropRepo {
  Future<void> add(GrownCrop crops) async {
    try {
      await Amplify.DataStore.save(crops);
      safePrint('Crop added successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error saving application data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<void> delete(GrownCrop crop) async {
    try {
      await Amplify.DataStore.delete(crop);
      safePrint('Crop deleted successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error deleting crop: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<List<GrownCrop>> fetch(
      String cropSeasonId, bool isSecondaryActivity) async {
    try {
      final List<GrownCrop> crops = await Amplify.DataStore.query(
          GrownCrop.classType,
          where: GrownCrop.CROPSEASONID.eq(cropSeasonId) &
              GrownCrop.ISSECONDARYACTIVITY.eq(isSecondaryActivity));
      return crops;
    } catch (e) {
      safePrint('Error fetching Bio: $e');
      return [];
    }
  }
}
