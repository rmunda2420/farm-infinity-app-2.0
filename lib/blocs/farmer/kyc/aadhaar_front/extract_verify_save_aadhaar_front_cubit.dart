import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../repositories/farmer/kyc/aadhaar_front/extract_verify_save_repo.dart';

part 'extract_verify_save_aadhaar_front_state.dart';

class ExtractVerifySaveAadhaarFrontCubit
    extends Cubit<ExtractVerifySaveAadhaarFrontState> {
  final KycExtractVerifySaveRepository _ocrRepository =
      KycExtractVerifySaveRepository();

  ExtractVerifySaveAadhaarFrontCubit()
      : super(ExtractVerifySaveAadhaarFrontInitial());

  void saveKycDocument(String filePath) async {
    try {
      emit(Extracting());
      // Perform ocr on document
      bool ocrSuccess = await _ocrRepository.ocr(filePath);
      if (ocrSuccess) {
        emit(Extracted());
      } else {
        emit(const Error(error: 'OCR operation failed'));
      }
      // Verify document number
      emit(Verifying());
      bool verificationSuccess = await _ocrRepository.verify();
      if (verificationSuccess) {
        emit(Verified());
        // Save data in database using amplify datastore
        emit(Saving());
        String? dbAadhaarRefId = await _ocrRepository.save(await getUserId());
        if (dbAadhaarRefId != null) {
          // Emit the aadhaar id for back
          emit(Saved(aadhaarDatabaseRefId: dbAadhaarRefId));
        } else {
          emit(const Error(error: 'Could not save'));
        }
      } else {
        emit(Failed());
      }
    } catch (e) {
      emit(const Error(error: 'Some error occurred'));
    }
  }

  // Only for dev keep commented
  /*void saveKycDocument(String filePath) async {
    try {
      emit(Extracting());
      // Perform ocr on document
      bool ocrSuccess = true;
      if (ocrSuccess) {
        emit(Extracted());
      } else {
        emit(const Error(error: 'OCR operation failed'));
      }
      // Verify document number
      emit(Verifying());
      bool verificationSuccess = true;
      if (verificationSuccess) {
        emit(Verified());
        // Save data in database using amplify datastore
        emit(Saving());
        String? dbRefId = 'erts-rty9-ty6hg-rter5';
        if (dbRefId != null) {
          emit(Saved(aadhaarDatabaseRefId: dbRefId));
        } else {
          emit(const Error(error: 'Could not save'));
        }
      } else {
        emit(Failed());
      }
    } catch (e) {
      emit(const Error(error: 'Some error occurred'));
    }
  }*/

  Future<String> getUserId() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'userId') ??
        ''; // Default value if not found
  }
}
