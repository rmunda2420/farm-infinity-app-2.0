import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:farm_infinity/models/LivestockPolicyInfo.dart';
import 'package:farm_infinity/repositories/BaseDataRepository.dart';
import 'package:flutter/cupertino.dart';

class CustomerLivestockInfoRepo
    implements BaseDataRepository<LivestockPolicyInfo> {
  @override
  Future<void> create(LivestockPolicyInfo customerLivestockInfo) async {
    try {
      // Check if a customer with the same phone number already exists
      List<LivestockPolicyInfo> existingTagNo = await Amplify.DataStore.query(
          LivestockPolicyInfo.classType,
          where: LivestockPolicyInfo.TAGNO.eq(customerLivestockInfo.tagNo));
      if (existingTagNo.isEmpty) {
        await Amplify.DataStore.save(customerLivestockInfo);
        safePrint('LivestockPolicyInfo created successfully');
      } else {
        // Throw an exception if the phone number already exists
        safePrint('Customer with this tag number already exists');
        throw Exception('Customer with this tag number already exists');
      }
    } catch (e) {
      safePrint('Error saving LivestockPolicyInfo data: $e');
      throw Exception('Error saving policy data: $e');
    }
  }

  @override
  Future<void> autoUpdateField<T>(String userId, String keyToUpdate, T value,
      {bool? isSecondaryActivity}) async {
    // You can implement this if needed
  }

  @override
  Future<List<LivestockPolicyInfo>?> fetch(String insuranceCustomerId,
      {bool? isSecondaryActivity}) async {
    try {
      // Fetch policies based on insurancecustomerinfoID
      final List<LivestockPolicyInfo> policies = await Amplify.DataStore.query(
        LivestockPolicyInfo.classType,
        where:
            LivestockPolicyInfo.INSURANCECUSTOMERINFOID.eq(insuranceCustomerId),
      );

      if (policies.isNotEmpty) {
        return policies;
      } else {
        safePrint(
            'No policies found for InsuranceCustomerInfo: $insuranceCustomerId');
      }
    } catch (e) {
      safePrint('Error fetching LivestockPolicyInfo: $e');
    }
    return null;
  }

  Future<List<LivestockPolicyInfo>?> fetchAll(
      String insuranceCustomerId) async {
    try {
      // Fetch all policies based on insurancecustomerinfoID
      final List<LivestockPolicyInfo> policies = await Amplify.DataStore.query(
        LivestockPolicyInfo.classType,
        where:
            LivestockPolicyInfo.INSURANCECUSTOMERINFOID.eq(insuranceCustomerId),
      );

      if (policies.isNotEmpty) {
        return policies;
      } else {
        safePrint(
            'No policies found for InsuranceCustomerInfo: $insuranceCustomerId');
      }
    } catch (e) {
      safePrint('Error fetching LivestockPolicyInfo: $e');
    }
    return null;
  }

  Future<void> update(LivestockPolicyInfo updatedPolicy) async {
    try {
      // Fetch the existing policy
      final existingPolicies = await Amplify.DataStore.query(
        LivestockPolicyInfo.classType,
        where: LivestockPolicyInfo.ID.eq(updatedPolicy.id),
      );

      if (existingPolicies.isNotEmpty) {
        // Use the existing policy for DataStore update
        final existingPolicy = existingPolicies.first;

        // Create a new instance with updated data
        final updatedPolicyInfo = existingPolicy.copyWith(
            // Update fields here as needed
            livestockLeftImageUrl: updatedPolicy.livestockLeftImageUrl ??
                existingPolicy.livestockLeftImageUrl,
            livestockRightImageUrl: updatedPolicy.livestockRightImageUrl ??
                existingPolicy.livestockRightImageUrl,
            livestockFrontImageUrl: updatedPolicy.livestockFrontImageUrl ??
                existingPolicy.livestockFrontImageUrl,
            livestockBackImageUrl: updatedPolicy.livestockBackImageUrl ??
                existingPolicy.livestockBackImageUrl,
            livestockWithTagImageUrl: updatedPolicy.livestockWithTagImageUrl ??
                existingPolicy.livestockWithTagImageUrl,
            applicationFormPageOneImageUrl:
                updatedPolicy.applicationFormPageOneImageUrl ??
                    existingPolicy.applicationFormPageOneImageUrl,
            applicationFormPageTwoImageUrl:
                updatedPolicy.applicationFormPageTwoImageUrl ??
                    existingPolicy.applicationFormPageTwoImageUrl,
            healthCertificatePageOneImageUrl:
                updatedPolicy.healthCertificatePageOneImageUrl ??
                    existingPolicy.healthCertificatePageOneImageUrl,
            healthCertificatePageTwoImageUrl:
                updatedPolicy.healthCertificatePageTwoImageUrl ??
                    existingPolicy.healthCertificatePageTwoImageUrl,
            tagNo: updatedPolicy.tagNo ?? existingPolicy.tagNo,
            status: updatedPolicy.status ??
                existingPolicy.status // Add other fields here if needed
            );

        // Save the updated policy to DataStore
        await Amplify.DataStore.save(updatedPolicyInfo);
        safePrint('LivestockPolicyInfo updated successfully');
      } else {
        safePrint(
            'LivestockPolicyInfo not found for update: ${updatedPolicy.id}');
      }
    } catch (e) {
      safePrint('Error updating LivestockPolicyInfo data: $e');
      rethrow; // Re-throw the exception to let the caller handle it if needed
    }
  }
}
