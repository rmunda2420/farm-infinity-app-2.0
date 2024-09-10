import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../repositories/farmer/kyc/aadhaar_back/extract_verify_save_repo.dart';

part 'extract_verify_save_aadhaar_back_state.dart';

class ExtractVerifySaveAadhaarBackCubit
    extends Cubit<ExtractVerifySaveAadhaarBackState> {
  final KycExtractVerifySaveRepository _ocrRepository =
      KycExtractVerifySaveRepository();

  ExtractVerifySaveAadhaarBackCubit()
      : super(ExtractVerifySaveAadhaarBackInitial());

  void saveKycDocument(String filePath, String aadhaarDBRefID) async {
    try {
      emit(Extracting());
      // Perform ocr on document
      bool ocrSuccess = await _ocrRepository.ocr(filePath);
      if (ocrSuccess) {
        emit(Extracted());
      } else {
        emit(const Error(error: 'OCR operation failed'));
      }
      // Save data in database using amplify datastore
      emit(Saving());
      bool saveSuccessful = await _ocrRepository.save(aadhaarDBRefID);
      if (saveSuccessful) {
        emit(Saved());
      } else {
        emit(const Error(error: 'Could not save'));
      }
    } catch (e) {
      emit(const Error(error: 'Some error occurred'));
    }
  }

  // Only for dev comment in prod
  /*void saveKycDocument(String filePath, String aadhaarDBRefID) async {
    try {
      emit(Extracting());
      // Perform ocr on document
      bool ocrSuccess = true;
      if (ocrSuccess) {
        emit(Extracted());
      } else {
        emit(const Error(error: 'OCR operation failed'));
      }
      // Save data in database using amplify datastore
      emit(Saving());
      bool saveSuccessful = true;
      if (saveSuccessful) {
        emit(Saved());
      } else {
        emit(const Error(error: 'Could not save'));
      }
    } catch (e) {
      emit(const Error(error: 'Some error occurred'));
    }
  }*/
}
