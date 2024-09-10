part of 'extract_verify_save_aadhaar_back_cubit.dart';

abstract class ExtractVerifySaveAadhaarBackState extends Equatable {
  const ExtractVerifySaveAadhaarBackState();
}

class ExtractVerifySaveAadhaarBackInitial extends ExtractVerifySaveAadhaarBackState {
  @override
  List<Object> get props => [];
}

class Extracting extends ExtractVerifySaveAadhaarBackState {
  @override
  List<Object> get props => [];
}

class Extracted extends ExtractVerifySaveAadhaarBackState {
  @override
  List<Object> get props => [];
}

class Saving extends ExtractVerifySaveAadhaarBackState {
  @override
  List<Object> get props => [];
}

class Saved extends ExtractVerifySaveAadhaarBackState {
  @override
  List<Object> get props => [];
}

class Failed extends ExtractVerifySaveAadhaarBackState {
  @override
  List<Object> get props => [];
}

class Error extends ExtractVerifySaveAadhaarBackState {
  final String error;

  const Error({required this.error});

  @override
  List<Object> get props => [error];
}
