import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/Equipment.dart';

class EquipmentRepo {
  Future<void> add(Equipment equipment) async {
    try {
      await Amplify.DataStore.save(equipment);
      safePrint('Equipment added successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error saving equipment data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<void> delete(Equipment equipment) async {
    try {
      await Amplify.DataStore.delete(equipment);
      safePrint('Equipment deleted successfully');
    } on DataStoreException catch (e) {
      // Handle errors
      safePrint('Error deleting equipment: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<List<Equipment>> fetch(
      String farmingId, bool isSecondaryActivity) async {
    try {
      final List<Equipment> crops = await Amplify.DataStore.query(
          Equipment.classType,
          where: Equipment.FARMINGID.eq(farmingId) &
              Equipment.ISSECONDARYACTIVITY.eq(isSecondaryActivity));
      return crops;
    } catch (e) {
      safePrint('Error fetching equipments: $e');
      return [];
    }
  }
}
