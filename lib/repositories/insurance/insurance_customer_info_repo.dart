import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/repositories/BaseDataRepository.dart';
import 'package:flutter/material.dart';

import '../../models/InsuranceCustomerInfo.dart';

class InsuranceCustomerInfoRepo
    implements BaseDataRepository<InsuranceCustomerInfo> {
  @override
  Future<void> create(
      InsuranceCustomerInfo insuranceCustomerInfo) async {
    try {
      // Check if a customer with the same phone number already exists
      List<InsuranceCustomerInfo> existingCustomers =
          await Amplify.DataStore.query(InsuranceCustomerInfo.classType,
              where: InsuranceCustomerInfo.PHONENO
                  .eq(insuranceCustomerInfo.phoneNo));

      if (existingCustomers.isEmpty) {
        // Save the customer information if no existing customer is found
        await Amplify.DataStore.save(insuranceCustomerInfo);
        safePrint('Customer created successfully');
      } else {
        safePrint('Customer with this phone number already exists');
        throw Exception('Customer with this phone number already exists');
      }
    } catch (e) {
      // Handle errors
      safePrint('Error saving application data: $e');
      throw Exception('Error saving customer data: $e');
    }
  }

  @override
  Future<void> autoUpdateField<T>(String userId, String keyToUpdate, T value,
      {bool? isSecondaryActivity}) async {
    /*try {
      // Create an instance of your Amplify-generated model
      final app = FarmerApplication(name: name);
      await Amplify.DataStore.save(bio);
      // Optionally, you can handle success or show a message
      safePrint('Data saved successfully');
    } catch (e) {
      // Handle errors
      safePrint('Error saving data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }*/
  }

  @override
  Future<List<InsuranceCustomerInfo>?> fetch(String userId,
      {bool? isSecondaryActivity}) async {
    try {
      // Replace 'AadhaarId' with the actual name of your DataStore model
      final List<InsuranceCustomerInfo> apps = await Amplify.DataStore.query(
        InsuranceCustomerInfo.classType,
        where: InsuranceCustomerInfo.ID.eq(userId),
      );

      if (apps.isNotEmpty) {
        return apps;
      } else {
        safePrint('Customer not found not found $userId');
      }
    } catch (e) {
      safePrint('Error fetching Customer info: $e');
    }
    return null;
  }

  Future<List<InsuranceCustomerInfo>?> fetchAll(String userId) async {
    try {
      // Replace 'AadhaarId' with the actual name of your DataStore model
      final List<InsuranceCustomerInfo> apps = await Amplify.DataStore.query(
        InsuranceCustomerInfo.classType,
        where: InsuranceCustomerInfo.ID.eq(userId),
      );

      if (apps.isNotEmpty) {
        return apps;
      } else {
        safePrint('Customer not found not found $userId');
      }
    } catch (e) {
      safePrint('Error fetching Customer info: $e');
    }
    return null;
  }

  Future<void> update(InsuranceCustomerInfo updatedCustomer) async {
    try {
      // Fetch the existing customer
      final existingCustomers = await Amplify.DataStore.query(
        InsuranceCustomerInfo.classType,
        where: InsuranceCustomerInfo.ID.eq(updatedCustomer.id),
      );

      if (existingCustomers.isNotEmpty) {
        // Use the existing customer for DataStore update
        final existingCustomer = existingCustomers.first;

        // Create a new instance with updated data
        final updatedCustomerInfo = existingCustomer.copyWith(
          name: updatedCustomer.name,
          phoneNo: updatedCustomer.phoneNo,
          village: updatedCustomer.village,
          poiType: updatedCustomer.poiType,
          poiTypeId: updatedCustomer.poiTypeId,
          poiNumber: updatedCustomer.poiNumber,
          poiImageFrontUrl: updatedCustomer.poiImageFrontUrl,
          poiImageBackUrl: updatedCustomer.poiImageBackUrl,
          poaType: updatedCustomer.poaType,
          poaTypeId: updatedCustomer.poaTypeId,
          poaNumber: updatedCustomer.poaNumber,
          poaImageFrontUrl: updatedCustomer.poaImageFrontUrl,
          poaImageBackUrl: updatedCustomer.poaImageBackUrl,
        );

        // Save the updated customer to DataStore
        await Amplify.DataStore.save(updatedCustomerInfo);
        safePrint('Customer updated successfully');
      } else {
        safePrint('Customer not found for update: ${updatedCustomer.id}');
      }
    } catch (e) {
      safePrint('Error updating customer data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }
}
