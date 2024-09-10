part of 'aadhaar_kyc_upload_activity_bloc.dart';

class AadhaarKycUploadActivityState extends Equatable {
  final File? file;
  final Enum mode;
  final String? errMsg;
  
  const AadhaarKycUploadActivityState(this.file, this.mode, this.errMsg);

  factory AadhaarKycUploadActivityState.initial() =>
      const AadhaarKycUploadActivityState(null, Mode.select, null);

  @override
  List<Object?> get props => [file, mode, errMsg];
}
