
part of 'aadhaar_kyc_upload_activity_bloc.dart';

abstract class AadhaarKycUploadActivityEvent extends Equatable {
  const AadhaarKycUploadActivityEvent();

  @override
  List<Object> get props => [];
}

class FilePickerTapped extends AadhaarKycUploadActivityEvent {}

class CameraTapped extends AadhaarKycUploadActivityEvent {
  final BuildContext context;

  const CameraTapped(this.context);

  @override
  List<Object> get props => [context];
}

class EditTapped extends AadhaarKycUploadActivityEvent {}

class UploadTapped extends AadhaarKycUploadActivityEvent {}

class ProcessingError extends AadhaarKycUploadActivityEvent {}
