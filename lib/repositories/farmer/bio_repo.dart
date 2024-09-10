import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/FarmerApplication.dart';
import 'package:farm_infinity/repositories/BaseDataRepository.dart';

import '../../models/Bio.dart';
// Import your Amplify-generated models

class BioRepo implements BaseDataRepository<Bio> {
  @override
  Future<void> create(Bio bio) async {
    try {
      await Amplify.DataStore.save(bio);
      // Optionally, you can handle success or show a message
      safePrint('Bio created successfully');
    } catch (e) {
      // Handle errors
      safePrint('Error saving bio data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  @override
  Future<void> autoUpdateField<T>(
      String bioId, String keyToUpdate, T value, {bool? isSecondaryActivity}) async {
    try {
      // Retrieve the previously saved bio
      final List<Bio> existingBios = await Amplify.DataStore.query(
        Bio.classType,
        where: Bio.ID.eq(bioId),
      );
      if (existingBios.isNotEmpty) {
        Bio oldBio = existingBios.first;
        Bio newBio = oldBio;

        // Use a switch statement to update the specified field
        switch (keyToUpdate) {
          case 'name':
            newBio = oldBio.copyWith(name: value as String);
            break;
          case 'dob':
            newBio = oldBio.copyWith(dob: value as String);
            break;
          case 'email':
            newBio = oldBio.copyWith(email: value as String);
            break;
          case 'altPhone':
            newBio = oldBio.copyWith(altPhone: value as String);
            break;
          case 'fullAddress':
            newBio = oldBio.copyWith(fullAddress: value as String);
            break;
          case 'district':
            newBio = oldBio.copyWith(district: value as String);
            break;
          case 'city':
            newBio = oldBio.copyWith(city: value as String);
            break;
          case 'state':
            newBio = oldBio.copyWith(state: value as String);
            break;
          case 'pin':
            newBio = oldBio.copyWith(pin: value as String);
            break;

          default:
            safePrint('Invalid field: $keyToUpdate');
            return;
        }
        await Amplify.DataStore.save(newBio);
        // Optionally, you can handle success or show a message
        safePrint('Bio data updated successfully');
      }
    } catch (e) {
      // Handle errors
      safePrint('Error while updating data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }

  Future<void> completeLevel(String applicationId) async {
    final List<FarmerApplication> applications = await Amplify.DataStore.query(
        FarmerApplication.classType,
        where: FarmerApplication.APPLICATIONID.eq(applicationId));
    final FarmerApplication application = applications.first;

    final List<Bio> existingBios = await Amplify.DataStore.query(Bio.classType,
        where: Bio.ID.eq(application.farmerApplicationFarmerApplicationToBioId));
    if (existingBios.isNotEmpty) {
      Bio oldBio = existingBios.first;
      if (oldBio.isComplete) {
        // Do nothing
        return;
      }
      Bio newBio = oldBio;

      newBio = oldBio.copyWith(isComplete: true);
      await Amplify.DataStore.save(newBio);
      safePrint('Bio data updated successfully');
    }
  }

  Future<void> uploadedProfilePhotoPath(String applicationId, path) async {
    final List<FarmerApplication> applications = await Amplify.DataStore.query(
        FarmerApplication.classType,
        where: FarmerApplication.APPLICATIONID.eq(applicationId));
    final FarmerApplication application = applications.first;

    final List<Bio> existingBios = await Amplify.DataStore.query(Bio.classType,
        where: Bio.ID.eq(application.farmerApplicationFarmerApplicationToBioId));
    if (existingBios.isNotEmpty) {
      Bio oldBio = existingBios.first;
      if (oldBio.isComplete) {
        // Do nothing
        return;
      }
      Bio newBio = oldBio;

      newBio = oldBio.copyWith(profilePicUrl: path);
      await Amplify.DataStore.save(newBio);
      safePrint('Bio data updated successfully');
    }
  }

  @override
  Future<Bio?> fetch(String bioId, {bool? isSecondaryActivity}) async {
    try {
      final List<Bio> bios = await Amplify.DataStore.query(
        Bio.classType,
        where: Bio.ID.eq(bioId),
      );

      if (bios.isNotEmpty) {
        final Bio bio = bios.first;
        return bio;
      } else {
        safePrint('Bio not found for User $bioId');
      }
    } catch (e) {
      safePrint('Error fetching Bio: $e');
    }
    return null;
  }
}
