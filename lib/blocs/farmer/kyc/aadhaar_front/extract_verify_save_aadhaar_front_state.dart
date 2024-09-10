part of 'extract_verify_save_aadhaar_front_cubit.dart';

abstract class ExtractVerifySaveAadhaarFrontState extends Equatable {
  const ExtractVerifySaveAadhaarFrontState();
}

class ExtractVerifySaveAadhaarFrontInitial
    extends ExtractVerifySaveAadhaarFrontState {
  @override
  List<Object> get props => [];
}

class Extracting extends ExtractVerifySaveAadhaarFrontState {
  @override
  List<Object> get props => [];
}

class Extracted extends ExtractVerifySaveAadhaarFrontState {
  @override
  List<Object> get props => [];
}

class Verifying extends ExtractVerifySaveAadhaarFrontState {
  @override
  List<Object> get props => [];
}

class Verified extends ExtractVerifySaveAadhaarFrontState {
  @override
  List<Object> get props => [];
}

class Saving extends ExtractVerifySaveAadhaarFrontState {
  @override
  List<Object> get props => [];
}

class Saved extends ExtractVerifySaveAadhaarFrontState {
  final String aadhaarDatabaseRefId;

  const Saved({required this.aadhaarDatabaseRefId});

  @override
  List<Object> get props => [aadhaarDatabaseRefId];
}

class Failed extends ExtractVerifySaveAadhaarFrontState {
  @override
  List<Object> get props => [];
}

class Error extends ExtractVerifySaveAadhaarFrontState {
  final String error;

  const Error({required this.error});

  @override
  List<Object> get props => [error];
}
