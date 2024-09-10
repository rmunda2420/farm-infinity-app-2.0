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

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the CropInput type in your schema. */
class CropInput extends amplify_core.Model {
  static const classType = const _CropInputModelType();
  final String id;
  final String? _inputName;
  final int? _inputId;
  final double? _inputQuantity;
  final String? _quantityUnit;
  final int? _quantityUnitId;
  final bool? _isSecondaryActivity;
  final String? _cropseasonID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CropInputModelIdentifier get modelIdentifier {
      return CropInputModelIdentifier(
        id: id
      );
  }
  
  String? get inputName {
    return _inputName;
  }
  
  int? get inputId {
    return _inputId;
  }
  
  double? get inputQuantity {
    return _inputQuantity;
  }
  
  String? get quantityUnit {
    return _quantityUnit;
  }
  
  int? get quantityUnitId {
    return _quantityUnitId;
  }
  
  bool get isSecondaryActivity {
    try {
      return _isSecondaryActivity!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get cropseasonID {
    try {
      return _cropseasonID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CropInput._internal({required this.id, inputName, inputId, inputQuantity, quantityUnit, quantityUnitId, required isSecondaryActivity, required cropseasonID, createdAt, updatedAt}): _inputName = inputName, _inputId = inputId, _inputQuantity = inputQuantity, _quantityUnit = quantityUnit, _quantityUnitId = quantityUnitId, _isSecondaryActivity = isSecondaryActivity, _cropseasonID = cropseasonID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CropInput({String? id, String? inputName, int? inputId, double? inputQuantity, String? quantityUnit, int? quantityUnitId, required bool isSecondaryActivity, required String cropseasonID}) {
    return CropInput._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      inputName: inputName,
      inputId: inputId,
      inputQuantity: inputQuantity,
      quantityUnit: quantityUnit,
      quantityUnitId: quantityUnitId,
      isSecondaryActivity: isSecondaryActivity,
      cropseasonID: cropseasonID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CropInput &&
      id == other.id &&
      _inputName == other._inputName &&
      _inputId == other._inputId &&
      _inputQuantity == other._inputQuantity &&
      _quantityUnit == other._quantityUnit &&
      _quantityUnitId == other._quantityUnitId &&
      _isSecondaryActivity == other._isSecondaryActivity &&
      _cropseasonID == other._cropseasonID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CropInput {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("inputName=" + "$_inputName" + ", ");
    buffer.write("inputId=" + (_inputId != null ? _inputId!.toString() : "null") + ", ");
    buffer.write("inputQuantity=" + (_inputQuantity != null ? _inputQuantity!.toString() : "null") + ", ");
    buffer.write("quantityUnit=" + "$_quantityUnit" + ", ");
    buffer.write("quantityUnitId=" + (_quantityUnitId != null ? _quantityUnitId!.toString() : "null") + ", ");
    buffer.write("isSecondaryActivity=" + (_isSecondaryActivity != null ? _isSecondaryActivity!.toString() : "null") + ", ");
    buffer.write("cropseasonID=" + "$_cropseasonID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CropInput copyWith({String? inputName, int? inputId, double? inputQuantity, String? quantityUnit, int? quantityUnitId, bool? isSecondaryActivity, String? cropseasonID}) {
    return CropInput._internal(
      id: id,
      inputName: inputName ?? this.inputName,
      inputId: inputId ?? this.inputId,
      inputQuantity: inputQuantity ?? this.inputQuantity,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      quantityUnitId: quantityUnitId ?? this.quantityUnitId,
      isSecondaryActivity: isSecondaryActivity ?? this.isSecondaryActivity,
      cropseasonID: cropseasonID ?? this.cropseasonID);
  }
  
  CropInput copyWithModelFieldValues({
    ModelFieldValue<String?>? inputName,
    ModelFieldValue<int?>? inputId,
    ModelFieldValue<double?>? inputQuantity,
    ModelFieldValue<String?>? quantityUnit,
    ModelFieldValue<int?>? quantityUnitId,
    ModelFieldValue<bool>? isSecondaryActivity,
    ModelFieldValue<String>? cropseasonID
  }) {
    return CropInput._internal(
      id: id,
      inputName: inputName == null ? this.inputName : inputName.value,
      inputId: inputId == null ? this.inputId : inputId.value,
      inputQuantity: inputQuantity == null ? this.inputQuantity : inputQuantity.value,
      quantityUnit: quantityUnit == null ? this.quantityUnit : quantityUnit.value,
      quantityUnitId: quantityUnitId == null ? this.quantityUnitId : quantityUnitId.value,
      isSecondaryActivity: isSecondaryActivity == null ? this.isSecondaryActivity : isSecondaryActivity.value,
      cropseasonID: cropseasonID == null ? this.cropseasonID : cropseasonID.value
    );
  }
  
  CropInput.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _inputName = json['inputName'],
      _inputId = (json['inputId'] as num?)?.toInt(),
      _inputQuantity = (json['inputQuantity'] as num?)?.toDouble(),
      _quantityUnit = json['quantityUnit'],
      _quantityUnitId = (json['quantityUnitId'] as num?)?.toInt(),
      _isSecondaryActivity = json['isSecondaryActivity'],
      _cropseasonID = json['cropseasonID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'inputName': _inputName, 'inputId': _inputId, 'inputQuantity': _inputQuantity, 'quantityUnit': _quantityUnit, 'quantityUnitId': _quantityUnitId, 'isSecondaryActivity': _isSecondaryActivity, 'cropseasonID': _cropseasonID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'inputName': _inputName,
    'inputId': _inputId,
    'inputQuantity': _inputQuantity,
    'quantityUnit': _quantityUnit,
    'quantityUnitId': _quantityUnitId,
    'isSecondaryActivity': _isSecondaryActivity,
    'cropseasonID': _cropseasonID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CropInputModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CropInputModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final INPUTNAME = amplify_core.QueryField(fieldName: "inputName");
  static final INPUTID = amplify_core.QueryField(fieldName: "inputId");
  static final INPUTQUANTITY = amplify_core.QueryField(fieldName: "inputQuantity");
  static final QUANTITYUNIT = amplify_core.QueryField(fieldName: "quantityUnit");
  static final QUANTITYUNITID = amplify_core.QueryField(fieldName: "quantityUnitId");
  static final ISSECONDARYACTIVITY = amplify_core.QueryField(fieldName: "isSecondaryActivity");
  static final CROPSEASONID = amplify_core.QueryField(fieldName: "cropseasonID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CropInput";
    modelSchemaDefinition.pluralName = "CropInputs";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["cropseasonID"], name: "byCropSeason")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropInput.INPUTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropInput.INPUTID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropInput.INPUTQUANTITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropInput.QUANTITYUNIT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropInput.QUANTITYUNITID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropInput.ISSECONDARYACTIVITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropInput.CROPSEASONID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _CropInputModelType extends amplify_core.ModelType<CropInput> {
  const _CropInputModelType();
  
  @override
  CropInput fromJson(Map<String, dynamic> jsonData) {
    return CropInput.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CropInput';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CropInput] in your schema.
 */
class CropInputModelIdentifier implements amplify_core.ModelIdentifier<CropInput> {
  final String id;

  /** Create an instance of CropInputModelIdentifier using [id] the primary key. */
  const CropInputModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'CropInputModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CropInputModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}