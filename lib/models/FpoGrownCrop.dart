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


/** This is an auto generated class representing the FpoGrownCrop type in your schema. */
class FpoGrownCrop extends amplify_core.Model {
  static const classType = const _FpoGrownCropModelType();
  final String id;
  final String? _cropName;
  final int? _cropId;
  final String? _fpoID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FpoGrownCropModelIdentifier get modelIdentifier {
      return FpoGrownCropModelIdentifier(
        id: id
      );
  }
  
  String? get cropName {
    return _cropName;
  }
  
  int? get cropId {
    return _cropId;
  }
  
  String get fpoID {
    try {
      return _fpoID!;
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
  
  const FpoGrownCrop._internal({required this.id, cropName, cropId, required fpoID, createdAt, updatedAt}): _cropName = cropName, _cropId = cropId, _fpoID = fpoID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FpoGrownCrop({String? id, String? cropName, int? cropId, required String fpoID}) {
    return FpoGrownCrop._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      cropName: cropName,
      cropId: cropId,
      fpoID: fpoID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FpoGrownCrop &&
      id == other.id &&
      _cropName == other._cropName &&
      _cropId == other._cropId &&
      _fpoID == other._fpoID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FpoGrownCrop {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("cropName=" + "$_cropName" + ", ");
    buffer.write("cropId=" + (_cropId != null ? _cropId!.toString() : "null") + ", ");
    buffer.write("fpoID=" + "$_fpoID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FpoGrownCrop copyWith({String? cropName, int? cropId, String? fpoID}) {
    return FpoGrownCrop._internal(
      id: id,
      cropName: cropName ?? this.cropName,
      cropId: cropId ?? this.cropId,
      fpoID: fpoID ?? this.fpoID);
  }
  
  FpoGrownCrop copyWithModelFieldValues({
    ModelFieldValue<String?>? cropName,
    ModelFieldValue<int?>? cropId,
    ModelFieldValue<String>? fpoID
  }) {
    return FpoGrownCrop._internal(
      id: id,
      cropName: cropName == null ? this.cropName : cropName.value,
      cropId: cropId == null ? this.cropId : cropId.value,
      fpoID: fpoID == null ? this.fpoID : fpoID.value
    );
  }
  
  FpoGrownCrop.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _cropName = json['cropName'],
      _cropId = (json['cropId'] as num?)?.toInt(),
      _fpoID = json['fpoID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'cropName': _cropName, 'cropId': _cropId, 'fpoID': _fpoID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'cropName': _cropName,
    'cropId': _cropId,
    'fpoID': _fpoID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FpoGrownCropModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FpoGrownCropModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CROPNAME = amplify_core.QueryField(fieldName: "cropName");
  static final CROPID = amplify_core.QueryField(fieldName: "cropId");
  static final FPOID = amplify_core.QueryField(fieldName: "fpoID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FpoGrownCrop";
    modelSchemaDefinition.pluralName = "FpoGrownCrops";
    
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
      amplify_core.ModelIndex(fields: const ["fpoID"], name: "byFpo")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FpoGrownCrop.CROPNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FpoGrownCrop.CROPID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FpoGrownCrop.FPOID,
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

class _FpoGrownCropModelType extends amplify_core.ModelType<FpoGrownCrop> {
  const _FpoGrownCropModelType();
  
  @override
  FpoGrownCrop fromJson(Map<String, dynamic> jsonData) {
    return FpoGrownCrop.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FpoGrownCrop';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FpoGrownCrop] in your schema.
 */
class FpoGrownCropModelIdentifier implements amplify_core.ModelIdentifier<FpoGrownCrop> {
  final String id;

  /** Create an instance of FpoGrownCropModelIdentifier using [id] the primary key. */
  const FpoGrownCropModelIdentifier({
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
  String toString() => 'FpoGrownCropModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FpoGrownCropModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}