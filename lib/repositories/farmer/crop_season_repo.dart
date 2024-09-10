import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/CropSeason.dart';

class CropSeasonRepo {
  Future<void> add(CropSeason cropSeason) async {
    try {
      await Amplify.DataStore.save(cropSeason);
      safePrint('Crop season added successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error saving crop season data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<void> delete(CropSeason cropSeason) async {
    try {
      await Amplify.DataStore.delete(cropSeason);
      safePrint('Crop season deleted successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error deleting crop season: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<List<CropSeason>> fetch(
      String farmingId, bool isSecondaryActivity) async {
    try {
      final List<CropSeason> cropSeasons = await Amplify.DataStore.query(
          CropSeason.classType,
          where: CropSeason.FARMINGID.eq(farmingId) &
              CropSeason.ISSECONDARYACTIVITY.eq(isSecondaryActivity));
      return cropSeasons;
    } catch (e) {
      safePrint('Error fetching crop seasons: $e');
      return [];
    }
  }
}
