import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farm_infinity/repositories/farmer/application_repo.dart';

import '../../models/FarmerApplication.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final String userId;
  final ApplicationRepo appRepo = ApplicationRepo();
  late final StreamSubscription _subscription;

  AppCubit(this.userId) : super(AppInitial()){
    // Subscribe to Amplify DataStore events for FarmerApplication
    _subscription = Amplify.DataStore.observe(FarmerApplication.classType)
        .listen((event) {
      // On event, re-fetch data and emit a new state
      fetchFarmerApplications(userId);
    });
  }

  Future<void> fetchFarmerApplications(String userId) async {
    try {
      emit(Loading());

      final List<FarmerApplication>? farmerApplications =
          await appRepo.fetch(userId);

      if (farmerApplications != null && farmerApplications.isNotEmpty) {
        emit(Loaded(farmerApplications: farmerApplications));
      } else {
        emit(AppInitial());
      }
    } catch (e) {
      emit(const Error(error: 'Failed to fetch farmer applications'));
      safePrint('Error fetching data: $e');
    }
  }

  @override
  Future<void> close() {
    // Cancel the subscription when the cubit is closed
    _subscription.cancel();
    return super.close();
  }
}
