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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the CropSeason type in your schema. */
class CropSeason extends amplify_core.Model {
  static const classType = const _CropSeasonModelType();
  final String id;
  final String? _seasonName;
  final int? _seasonId;
  final bool? _isSecondaryActivity;
  final String? _farmingID;
  final List<GrownCrop>? _CropSeasonsToGrownCrops;
  final List<CropInput>? _CropSeasonToCropInputs;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CropSeasonModelIdentifier get modelIdentifier {
      return CropSeasonModelIdentifier(
        id: id
      );
  }
  
  String? get seasonName {
    return _seasonName;
  }
  
  int? get seasonId {
    return _seasonId;
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
  
  List<GrownCrop>? get CropSeasonsToGrownCrops {
    return _CropSeasonsToGrownCrops;
  }
  
  List<CropInput>? get CropSeasonToCropInputs {
    return _CropSeasonToCropInputs;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CropSeason._internal({required this.id, seasonName, seasonId, required isSecondaryActivity, required farmingID, CropSeasonsToGrownCrops, CropSeasonToCropInputs, createdAt, updatedAt}): _seasonName = seasonName, _seasonId = seasonId, _isSecondaryActivity = isSecondaryActivity, _farmingID = farmingID, _CropSeasonsToGrownCrops = CropSeasonsToGrownCrops, _CropSeasonToCropInputs = CropSeasonToCropInputs, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CropSeason({String? id, String? seasonName, int? seasonId, required bool isSecondaryActivity, required String farmingID, List<GrownCrop>? CropSeasonsToGrownCrops, List<CropInput>? CropSeasonToCropInputs}) {
    return CropSeason._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      seasonName: seasonName,
      seasonId: seasonId,
      isSecondaryActivity: isSecondaryActivity,
      farmingID: farmingID,
      CropSeasonsToGrownCrops: CropSeasonsToGrownCrops != null ? List<GrownCrop>.unmodifiable(CropSeasonsToGrownCrops) : CropSeasonsToGrownCrops,
      CropSeasonToCropInputs: CropSeasonToCropInputs != null ? List<CropInput>.unmodifiable(CropSeasonToCropInputs) : CropSeasonToCropInputs);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CropSeason &&
      id == other.id &&
      _seasonName == other._seasonName &&
      _seasonId == other._seasonId &&
      _isSecondaryActivity == other._isSecondaryActivity &&
      _farmingID == other._farmingID &&
      DeepCollectionEquality().equals(_CropSeasonsToGrownCrops, other._CropSeasonsToGrownCrops) &&
      DeepCollectionEquality().equals(_CropSeasonToCropInputs, other._CropSeasonToCropInputs);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CropSeason {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("seasonName=" + "$_seasonName" + ", ");
    buffer.write("seasonId=" + (_seasonId != null ? _seasonId!.toString() : "null") + ", ");
    buffer.write("isSecondaryActivity=" + (_isSecondaryActivity != null ? _isSecondaryActivity!.toString() : "null") + ", ");
    buffer.write("farmingID=" + "$_farmingID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CropSeason copyWith({String? seasonName, int? seasonId, bool? isSecondaryActivity, String? farmingID, List<GrownCrop>? CropSeasonsToGrownCrops, List<CropInput>? CropSeasonToCropInputs}) {
    return CropSeason._internal(
      id: id,
      seasonName: seasonName ?? this.seasonName,
      seasonId: seasonId ?? this.seasonId,
      isSecondaryActivity: isSecondaryActivity ?? this.isSecondaryActivity,
      farmingID: farmingID ?? this.farmingID,
      CropSeasonsToGrownCrops: CropSeasonsToGrownCrops ?? this.CropSeasonsToGrownCrops,
      CropSeasonToCropInputs: CropSeasonToCropInputs ?? this.CropSeasonToCropInputs);
  }
  
  CropSeason copyWithModelFieldValues({
    ModelFieldValue<String?>? seasonName,
    ModelFieldValue<int?>? seasonId,
    ModelFieldValue<bool>? isSecondaryActivity,
    ModelFieldValue<String>? farmingID,
    ModelFieldValue<List<GrownCrop>?>? CropSeasonsToGrownCrops,
    ModelFieldValue<List<CropInput>?>? CropSeasonToCropInputs
  }) {
    return CropSeason._internal(
      id: id,
      seasonName: seasonName == null ? this.seasonName : seasonName.value,
      seasonId: seasonId == null ? this.seasonId : seasonId.value,
      isSecondaryActivity: isSecondaryActivity == null ? this.isSecondaryActivity : isSecondaryActivity.value,
      farmingID: farmingID == null ? this.farmingID : farmingID.value,
      CropSeasonsToGrownCrops: CropSeasonsToGrownCrops == null ? this.CropSeasonsToGrownCrops : CropSeasonsToGrownCrops.value,
      CropSeasonToCropInputs: CropSeasonToCropInputs == null ? this.CropSeasonToCropInputs : CropSeasonToCropInputs.value
    );
  }
  
  CropSeason.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _seasonName = json['seasonName'],
      _seasonId = (json['seasonId'] as num?)?.toInt(),
      _isSecondaryActivity = json['isSecondaryActivity'],
      _farmingID = json['farmingID'],
      _CropSeasonsToGrownCrops = json['CropSeasonsToGrownCrops']  is Map
        ? (json['CropSeasonsToGrownCrops']['items'] is List
          ? (json['CropSeasonsToGrownCrops']['items'] as List)
              .where((e) => e != null)
              .map((e) => GrownCrop.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['CropSeasonsToGrownCrops'] is List
          ? (json['CropSeasonsToGrownCrops'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => GrownCrop.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _CropSeasonToCropInputs = json['CropSeasonToCropInputs']  is Map
        ? (json['CropSeasonToCropInputs']['items'] is List
          ? (json['CropSeasonToCropInputs']['items'] as List)
              .where((e) => e != null)
              .map((e) => CropInput.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['CropSeasonToCropInputs'] is List
          ? (json['CropSeasonToCropInputs'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => CropInput.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'seasonName': _seasonName, 'seasonId': _seasonId, 'isSecondaryActivity': _isSecondaryActivity, 'farmingID': _farmingID, 'CropSeasonsToGrownCrops': _CropSeasonsToGrownCrops?.map((GrownCrop? e) => e?.toJson()).toList(), 'CropSeasonToCropInputs': _CropSeasonToCropInputs?.map((CropInput? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'seasonName': _seasonName,
    'seasonId': _seasonId,
    'isSecondaryActivity': _isSecondaryActivity,
    'farmingID': _farmingID,
    'CropSeasonsToGrownCrops': _CropSeasonsToGrownCrops,
    'CropSeasonToCropInputs': _CropSeasonToCropInputs,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CropSeasonModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CropSeasonModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SEASONNAME = amplify_core.QueryField(fieldName: "seasonName");
  static final SEASONID = amplify_core.QueryField(fieldName: "seasonId");
  static final ISSECONDARYACTIVITY = amplify_core.QueryField(fieldName: "isSecondaryActivity");
  static final FARMINGID = amplify_core.QueryField(fieldName: "farmingID");
  static final CROPSEASONSTOGROWNCROPS = amplify_core.QueryField(
    fieldName: "CropSeasonsToGrownCrops",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GrownCrop'));
  static final CROPSEASONTOCROPINPUTS = amplify_core.QueryField(
    fieldName: "CropSeasonToCropInputs",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CropInput'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CropSeason";
    modelSchemaDefinition.pluralName = "CropSeasons";
    
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
      key: CropSeason.SEASONNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropSeason.SEASONID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropSeason.ISSECONDARYACTIVITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropSeason.FARMINGID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: CropSeason.CROPSEASONSTOGROWNCROPS,
      isRequired: false,
      ofModelName: 'GrownCrop',
      associatedKey: GrownCrop.CROPSEASONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: CropSeason.CROPSEASONTOCROPINPUTS,
      isRequired: false,
      ofModelName: 'CropInput',
      associatedKey: CropInput.CROPSEASONID
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

class _CropSeasonModelType extends amplify_core.ModelType<CropSeason> {
  const _CropSeasonModelType();
  
  @override
  CropSeason fromJson(Map<String, dynamic> jsonData) {
    return CropSeason.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CropSeason';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CropSeason] in your schema.
 */
class CropSeasonModelIdentifier implements amplify_core.ModelIdentifier<CropSeason> {
  final String id;

  /** Create an instance of CropSeasonModelIdentifier using [id] the primary key. */
  const CropSeasonModelIdentifier({
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
  String toString() => 'CropSeasonModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CropSeasonModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}