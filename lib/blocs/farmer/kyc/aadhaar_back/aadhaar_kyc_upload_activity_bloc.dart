// ../kyc/aadhaar_back/aadhaar_kyc_upload_activity_bloc.dart
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farm_infinity/widgets/my_mask_cam_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../enums/modes.dart';

part 'aadhaar_kyc_upload_activity_event.dart';

part 'aadhaar_kyc_upload_activity_state.dart';

class AadhaarKycUploadActivityBloc
    extends Bloc<AadhaarKycUploadActivityEvent, AadhaarKycUploadActivityState> {
  File? imageFile; // Add this property
  AadhaarKycUploadActivityBloc()
      : super(AadhaarKycUploadActivityState.initial()) {
    on<FilePickerTapped>((event, emit) async {
      // Open file picker
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path.toString());
        imageFile =
            File(result.files.single.path.toString()); // Set the imageFile
        emit(AadhaarKycUploadActivityState(imageFile, Mode.edit, null));
      } else {
        emit(const AadhaarKycUploadActivityState(
            null, Mode.edit, 'Some error occurred'));
      }
    });

    on<CameraTapped>((event, emit) async {
      // Define a callback function to handle the captured image and emit the state
      void onImageCaptured(File? imgFile) {
        if (imgFile != null) {
          imageFile = imgFile; // Set the imageFile
          emit(AadhaarKycUploadActivityState(imageFile, Mode.edit, null));
        } else {
          emit(const AadhaarKycUploadActivityState(
              null, Mode.edit, 'Some error occurred'));
        }
        Navigator.pop(event.context);
      }

      await Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => MyMaskCamera(
            onImageCaptured: onImageCaptured,
          ),
        ),
      );
    });

    on<EditTapped>((event, emit) {
      emit(const AadhaarKycUploadActivityState(null, Mode.select, null));
    });

    on<UploadTapped>((event, emit) {
      if (imageFile != null) {
        emit(AadhaarKycUploadActivityState(imageFile, Mode.upload, null));
      } else {
        emit(const AadhaarKycUploadActivityState(
            null, Mode.edit, 'Some error occurred'));
      }
    });

    on<ProcessingError>((event, emit) {
      if (imageFile != null) {
        emit(AadhaarKycUploadActivityState(imageFile, Mode.edit, null));
      } else {
        emit(const AadhaarKycUploadActivityState(
            null, Mode.edit, 'Some error occurred during processing'));
      }
    });
  }
}
