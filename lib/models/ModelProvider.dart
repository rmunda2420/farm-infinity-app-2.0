/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'AadhaarId.dart';
import 'AadhaarKycOcrDataBack.dart';
import 'AadhaarKycOcrDataFront.dart';
import 'AppVersionInterval.dart';
import 'Bio.dart';
import 'CropInput.dart';
import 'CropList.dart';
import 'CropSeason.dart';
import 'Declaration.dart';
import 'Disbursal.dart';
import 'Equipment.dart';
import 'FamilyMember.dart';
import 'FamilyMemberBio.dart';
import 'FarmerApplication.dart';
import 'FarmerSecondaryActivity.dart';
import 'Farming.dart';
import 'FieldAgent.dart';
import 'FinYear.dart';
import 'Fpo.dart';
import 'FpoGrownCrop.dart';
import 'GrownCrop.dart';
import 'InsuranceCustomerInfo.dart';
import 'Irrigation.dart';
import 'LivestockPolicyInfo.dart';
import 'Loan.dart';
import 'PaymentDetail.dart';
import 'Repayment.dart';
import 'Staff.dart';

export 'AadhaarId.dart';
export 'AadhaarKycOcrDataBack.dart';
export 'AadhaarKycOcrDataFront.dart';
export 'AppVersionInterval.dart';
export 'Bio.dart';
export 'CropInput.dart';
export 'CropList.dart';
export 'CropSeason.dart';
export 'Declaration.dart';
export 'Disbursal.dart';
export 'Equipment.dart';
export 'FamilyMember.dart';
export 'FamilyMemberBio.dart';
export 'FarmerApplication.dart';
export 'FarmerSecondaryActivity.dart';
export 'Farming.dart';
export 'FieldAgent.dart';
export 'FinYear.dart';
export 'Fpo.dart';
export 'FpoGrownCrop.dart';
export 'GrownCrop.dart';
export 'InsuranceCustomerInfo.dart';
export 'Irrigation.dart';
export 'LivestockPolicyInfo.dart';
export 'Loan.dart';
export 'PaymentDetail.dart';
export 'Repayment.dart';
export 'Staff.dart';

class ModelProvider implements amplify_core.ModelProviderInterface {
  @override
  String version = "67ecb1eb552403c9f9622e7902db647d";
  @override
  List<amplify_core.ModelSchema> modelSchemas = [AadhaarId.schema, AadhaarKycOcrDataBack.schema, AadhaarKycOcrDataFront.schema, AppVersionInterval.schema, Bio.schema, CropInput.schema, CropList.schema, CropSeason.schema, Declaration.schema, Disbursal.schema, Equipment.schema, FamilyMember.schema, FamilyMemberBio.schema, FarmerApplication.schema, FarmerSecondaryActivity.schema, Farming.schema, FieldAgent.schema, FinYear.schema, Fpo.schema, FpoGrownCrop.schema, GrownCrop.schema, InsuranceCustomerInfo.schema, Irrigation.schema, LivestockPolicyInfo.schema, Loan.schema, PaymentDetail.schema, Repayment.schema, Staff.schema];
  @override
  List<amplify_core.ModelSchema> customTypeSchemas = [];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  amplify_core.ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "AadhaarId":
        return AadhaarId.classType;
      case "AadhaarKycOcrDataBack":
        return AadhaarKycOcrDataBack.classType;
      case "AadhaarKycOcrDataFront":
        return AadhaarKycOcrDataFront.classType;
      case "AppVersionInterval":
        return AppVersionInterval.classType;
      case "Bio":
        return Bio.classType;
      case "CropInput":
        return CropInput.classType;
      case "CropList":
        return CropList.classType;
      case "CropSeason":
        return CropSeason.classType;
      case "Declaration":
        return Declaration.classType;
      case "Disbursal":
        return Disbursal.classType;
      case "Equipment":
        return Equipment.classType;
      case "FamilyMember":
        return FamilyMember.classType;
      case "FamilyMemberBio":
        return FamilyMemberBio.classType;
      case "FarmerApplication":
        return FarmerApplication.classType;
      case "FarmerSecondaryActivity":
        return FarmerSecondaryActivity.classType;
      case "Farming":
        return Farming.classType;
      case "FieldAgent":
        return FieldAgent.classType;
      case "FinYear":
        return FinYear.classType;
      case "Fpo":
        return Fpo.classType;
      case "FpoGrownCrop":
        return FpoGrownCrop.classType;
      case "GrownCrop":
        return GrownCrop.classType;
      case "InsuranceCustomerInfo":
        return InsuranceCustomerInfo.classType;
      case "Irrigation":
        return Irrigation.classType;
      case "LivestockPolicyInfo":
        return LivestockPolicyInfo.classType;
      case "Loan":
        return Loan.classType;
      case "PaymentDetail":
        return PaymentDetail.classType;
      case "Repayment":
        return Repayment.classType;
      case "Staff":
        return Staff.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}


class ModelFieldValue<T> {
  const ModelFieldValue.value(this.value);

  final T value;
}
