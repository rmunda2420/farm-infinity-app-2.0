// Not in use
part of 'aadhaar_status_cubit.dart';

abstract class AadhaarStatusState extends Equatable {
  const AadhaarStatusState();
}

class AadhaarStatusInitial extends AadhaarStatusState {
  @override
  List<Object> get props => [];
}

class Loading extends AadhaarStatusState {
  @override
  List<Object> get props => [];
}

class Loaded extends AadhaarStatusState {
  final bool isVerified;

  const Loaded({required this.isVerified});

  @override
  List<Object> get props => [isVerified];
}

class Err extends AadhaarStatusState {
  final String error;

  const Err({required this.error});

  @override
  List<Object> get props => [error];
}
