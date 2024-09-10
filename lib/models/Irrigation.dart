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


/** This is an auto generated class representing the Irrigation type in your schema. */
class Irrigation extends amplify_core.Model {
  static const classType = const _IrrigationModelType();
  final String id;
  final String? _irrigationType;
  final int? _irrigationTypeId;
  final String? _farmingID;
  final bool? _isSecondaryActivity;
  final int? _version;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  IrrigationModelIdentifier get modelIdentifier {
      return IrrigationModelIdentifier(
        id: id
      );
  }
  
  String? get irrigationType {
    return _irrigationType;
  }
  
  int? get irrigationTypeId {
    return _irrigationTypeId;
  }
  
  String get farmingID {
    try {
      return _farmingID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  int? get version {
    return _version;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Irrigation._internal({required this.id, irrigationType, irrigationTypeId, required farmingID, required isSecondaryActivity, version, createdAt, updatedAt}): _irrigationType = irrigationType, _irrigationTypeId = irrigationTypeId, _farmingID = farmingID, _isSecondaryActivity = isSecondaryActivity, _version = version, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Irrigation({String? id, String? irrigationType, int? irrigationTypeId, required String farmingID, required bool isSecondaryActivity, int? version}) {
    return Irrigation._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      irrigationType: irrigationType,
      irrigationTypeId: irrigationTypeId,
      farmingID: farmingID,
      isSecondaryActivity: isSecondaryActivity,
      version: version);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Irrigation &&
      id == other.id &&
      _irrigationType == other._irrigationType &&
      _irrigationTypeId == other._irrigationTypeId &&
      _farmingID == other._farmingID &&
      _isSecondaryActivity == other._isSecondaryActivity &&
      _version == other._version;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Irrigation {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("irrigationType=" + "$_irrigationType" + ", ");
    buffer.write("irrigationTypeId=" + (_irrigationTypeId != null ? _irrigationTypeId!.toString() : "null") + ", ");
    buffer.write("farmingID=" + "$_farmingID" + ", ");
    buffer.write("isSecondaryActivity=" + (_isSecondaryActivity != null ? _isSecondaryActivity!.toString() : "null") + ", ");
    buffer.write("version=" + (_version != null ? _version!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Irrigation copyWith({String? irrigationType, int? irrigationTypeId, String? farmingID, bool? isSecondaryActivity, int? version}) {
    return Irrigation._internal(
      id: id,
      irrigationType: irrigationType ?? this.irrigationType,
      irrigationTypeId: irrigationTypeId ?? this.irrigationTypeId,
      farmingID: farmingID ?? this.farmingID,
      isSecondaryActivity: isSecondaryActivity ?? this.isSecondaryActivity,
      version: version ?? this.version);
  }
  
  Irrigation copyWithModelFieldValues({
    ModelFieldValue<String?>? irrigationType,
    ModelFieldValue<int?>? irrigationTypeId,
    ModelFieldValue<String>? farmingID,
    ModelFieldValue<bool>? isSecondaryActivity,
    ModelFieldValue<int?>? version
  }) {
    return Irrigation._internal(
      id: id,
      irrigationType: irrigationType == null ? this.irrigationType : irrigationType.value,
      irrigationTypeId: irrigationTypeId == null ? this.irrigationTypeId : irrigationTypeId.value,
      farmingID: farmingID == null ? this.farmingID : farmingID.value,
      isSecondaryActivity: isSecondaryActivity == null ? this.isSecondaryActivity : isSecondaryActivity.value,
      version: version == null ? this.version : version.value
    );
  }
  
  Irrigation.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _irrigationType = json['irrigationType'],
      _irrigationTypeId = (json['irrigationTypeId'] as num?)?.toInt(),
      _farmingID = json['farmingID'],
      _isSecondaryActivity = json['isSecondaryActivity'],
      _version = (json['version'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'irrigationType': _irrigationType, 'irrigationTypeId': _irrigationTypeId, 'farmingID': _farmingID, 'isSecondaryActivity': _isSecondaryActivity, 'version': _version, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'irrigationType': _irrigationType,
    'irrigationTypeId': _irrigationTypeId,
    'farmingID': _farmingID,
    'isSecondaryActivity': _isSecondaryActivity,
    'version': _version,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<IrrigationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<IrrigationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final IRRIGATIONTYPE = amplify_core.QueryField(fieldName: "irrigationType");
  static final IRRIGATIONTYPEID = amplify_core.QueryField(fieldName: "irrigationTypeId");
  static final FARMINGID = amplify_core.QueryField(fieldName: "farmingID");
  static final ISSECONDARYACTIVITY = amplify_core.QueryField(fieldName: "isSecondaryActivity");
  static final VERSION = amplify_core.QueryField(fieldName: "version");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Irrigation";
    modelSchemaDefinition.pluralName = "Irrigations";
    
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
      amplify_core.ModelIndex(fields: const ["farmingID"], name: "byFarming")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Irrigation.IRRIGATIONTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Irrigation.IRRIGATIONTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Irrigation.FARMINGID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Irrigation.ISSECONDARYACTIVITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Irrigation.VERSION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
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

class _IrrigationModelType extends amplify_core.ModelType<Irrigation> {
  const _IrrigationModelType();
  
  @override
  Irrigation fromJson(Map<String, dynamic> jsonData) {
    return Irrigation.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Irrigation';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Irrigation] in your schema.
 */
class IrrigationModelIdentifier implements amplify_core.ModelIdentifier<Irrigation> {
  final String id;

  /** Create an instance of IrrigationModelIdentifier using [id] the primary key. */
  const IrrigationModelIdentifier({
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
  String toString() => 'IrrigationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is IrrigationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}