import 'package:amplify_flutter/amplify_flutter.dart';

import '../../../models/AadhaarId.dart';

class AadhaarStatus {
  Future<bool> fetchAadhaarVerificationStatus(String userId) async {
    try {
      // Replace 'AadhaarId' with the actual name of your DataStore model
      final List<AadhaarId> aadhaarIds = await Amplify.DataStore.query(
        AadhaarId.classType,
        where: AadhaarId.USERID.eq(userId),
      );

      if (aadhaarIds.isNotEmpty) {
        final AadhaarId aadhaarId = aadhaarIds.first;
        final bool isVerified = aadhaarId.verified ?? false;

        safePrint('Verification Status for aadhaar $userId: $isVerified');
        return isVerified;
      } else {
        safePrint('AadhaarId not found for User $userId');
      }
    } catch (e) {
      safePrint('Error fetching AadhaarId: $e');
    }
    return false;
  }
}
