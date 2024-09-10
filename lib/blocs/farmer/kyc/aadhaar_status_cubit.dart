// Not in use
import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/AadhaarId.dart';
import '../../../repositories/farmer/kyc/fetch_aadhaar_status.dart';

part 'aadhaar_status_state.dart';

class AadhaarStatusCubit extends Cubit<AadhaarStatusState> {
  final String userId;
  final AadhaarStatus aadhaarStatusRepo = AadhaarStatus();
  late final StreamSubscription _subscription;

  AadhaarStatusCubit(this.userId) : super(AadhaarStatusInitial()){
    // Subscribe to Amplify DataStore events for FarmerApplication
    _subscription = Amplify.DataStore.observe(AadhaarId.classType)
        .listen((event) {
      // On event, re-fetch data and emit a new state
      fetchFarmerApplicationStatus(userId);
    });
  }

  Future<void> fetchFarmerApplicationStatus(String userId) async {
    try {
      final isVerified =
          await aadhaarStatusRepo.fetchAadhaarVerificationStatus(userId);
      safePrint('Hi Hello');
      emit(Loaded(isVerified: isVerified));
    } catch (e) {
      emit(const Err(error: 'Failed to fetch farmer applications'));
      safePrint('Error fetching data: $e');
    }
  }
}
