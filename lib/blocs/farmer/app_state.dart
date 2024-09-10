part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class Loading extends AppState {
  @override
  List<Object> get props => [];
}

class Loaded extends AppState {
  final List<FarmerApplication> farmerApplications;

  const Loaded({required this.farmerApplications});

  @override
  List<Object> get props => [farmerApplications];
}

/*class LoadedAndEmpty extends AppState {
  @override
  List<Object> get props => [];
}*/

class Error extends AppState {
  final String error;

  const Error({required this.error});

  @override
  List<Object> get props => [error];
}
