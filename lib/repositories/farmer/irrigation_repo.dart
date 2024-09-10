import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/Equipment.dart';
import 'package:farm_infinity/models/Irrigation.dart';

class IrrigationRepo {
  Future<void> add(Irrigation irrigation) async {
    try {
      await Amplify.DataStore.save(irrigation);
      safePrint('Irrigation added successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error saving irrigation data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<void> delete(Irrigation irrigation) async {
    try {
      await Amplify.DataStore.delete(irrigation);
      safePrint('Irrigation deleted successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error deleting irrigation: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<List<Irrigation>> fetch(String farmingId, bool isSecondaryActivity) async {
    try {
      final List<Irrigation> irrigationTypes = await Amplify.DataStore.query(
        Irrigation.classType,
        where: Irrigation.FARMINGID.eq(farmingId) & Irrigation.ISSECONDARYACTIVITY.eq(isSecondaryActivity)
      );
      return irrigationTypes;
    } catch (e) {
      safePrint('Error fetching irrigation types: $e');
      return [];
    }
  }
}
