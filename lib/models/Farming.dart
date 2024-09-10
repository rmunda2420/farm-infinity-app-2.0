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


/** This is an auto generated class representing the Farming type in your schema. */
class Farming extends amplify_core.Model {
  static const classType = const _FarmingModelType();
  final String id;
  final double? _landOwned;
  final double? _cultivationArea;
  final String? _areaUnit;
  final bool? _isPostHarvestStorageAvailable;
  final bool? _isCropInsured;
  final List<Equipment>? _FarmingToEquipments;
  final List<Irrigation>? _FarmingToIrrigations;
  final List<CropSeason>? _FarmingToCropSeasons;
  final int? _areaUnitId;
  final bool? _isSecondaryActivity;
  final int? _version;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FarmingModelIdentifier get modelIdentifier {
      return FarmingModelIdentifier(
        id: id
      );
  }
  
  double? get landOwned {
    return _landOwned;
  }
  
  double? get cultivationArea {
    return _cultivationArea;
  }
  
  String? get areaUnit {
    return _areaUnit;
  }
  
  bool? get isPostHarvestStorageAvailable {
    return _isPostHarvestStorageAvailable;
  }
  
  bool? get isCropInsured {
    return _isCropInsured;
  }
  
  List<Equipment>? get FarmingToEquipments {
    return _FarmingToEquipments;
  }
  
  List<Irrigation>? get FarmingToIrrigations {
    return _FarmingToIrrigations;
  }
  
  List<CropSeason>? get FarmingToCropSeasons {
    return _FarmingToCropSeasons;
  }
  
  int? get areaUnitId {
    return _areaUnitId;
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
  
  const Farming._internal({required this.id, landOwned, cultivationArea, areaUnit, isPostHarvestStorageAvailable, isCropInsured, FarmingToEquipments, FarmingToIrrigations, FarmingToCropSeasons, areaUnitId, required isSecondaryActivity, version, createdAt, updatedAt}): _landOwned = landOwned, _cultivationArea = cultivationArea, _areaUnit = areaUnit, _isPostHarvestStorageAvailable = isPostHarvestStorageAvailable, _isCropInsured = isCropInsured, _FarmingToEquipments = FarmingToEquipments, _FarmingToIrrigations = FarmingToIrrigations, _FarmingToCropSeasons = FarmingToCropSeasons, _areaUnitId = areaUnitId, _isSecondaryActivity = isSecondaryActivity, _version = version, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Farming({String? id, double? landOwned, double? cultivationArea, String? areaUnit, bool? isPostHarvestStorageAvailable, bool? isCropInsured, List<Equipment>? FarmingToEquipments, List<Irrigation>? FarmingToIrrigations, List<CropSeason>? FarmingToCropSeasons, int? areaUnitId, required bool isSecondaryActivity, int? version}) {
    return Farming._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      landOwned: landOwned,
      cultivationArea: cultivationArea,
      areaUnit: areaUnit,
      isPostHarvestStorageAvailable: isPostHarvestStorageAvailable,
      isCropInsured: isCropInsured,
      FarmingToEquipments: FarmingToEquipments != null ? List<Equipment>.unmodifiable(FarmingToEquipments) : FarmingToEquipments,
      FarmingToIrrigations: FarmingToIrrigations != null ? List<Irrigation>.unmodifiable(FarmingToIrrigations) : FarmingToIrrigations,
      FarmingToCropSeasons: FarmingToCropSeasons != null ? List<CropSeason>.unmodifiable(FarmingToCropSeasons) : FarmingToCropSeasons,
      areaUnitId: areaUnitId,
      isSecondaryActivity: isSecondaryActivity,
      version: version);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Farming &&
      id == other.id &&
      _landOwned == other._landOwned &&
      _cultivationArea == other._cultivationArea &&
      _areaUnit == other._areaUnit &&
      _isPostHarvestStorageAvailable == other._isPostHarvestStorageAvailable &&
      _isCropInsured == other._isCropInsured &&
      DeepCollectionEquality().equals(_FarmingToEquipments, other._FarmingToEquipments) &&
      DeepCollectionEquality().equals(_FarmingToIrrigations, other._FarmingToIrrigations) &&
      DeepCollectionEquality().equals(_FarmingToCropSeasons, other._FarmingToCropSeasons) &&
      _areaUnitId == other._areaUnitId &&
      _isSecondaryActivity == other._isSecondaryActivity &&
      _version == other._version;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Farming {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("landOwned=" + (_landOwned != null ? _landOwned!.toString() : "null") + ", ");
    buffer.write("cultivationArea=" + (_cultivationArea != null ? _cultivationArea!.toString() : "null") + ", ");
    buffer.write("areaUnit=" + "$_areaUnit" + ", ");
    buffer.write("isPostHarvestStorageAvailable=" + (_isPostHarvestStorageAvailable != null ? _isPostHarvestStorageAvailable!.toString() : "null") + ", ");
    buffer.write("isCropInsured=" + (_isCropInsured != null ? _isCropInsured!.toString() : "null") + ", ");
    buffer.write("areaUnitId=" + (_areaUnitId != null ? _areaUnitId!.toString() : "null") + ", ");
    buffer.write("isSecondaryActivity=" + (_isSecondaryActivity != null ? _isSecondaryActivity!.toString() : "null") + ", ");
    buffer.write("version=" + (_version != null ? _version!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Farming copyWith({double? landOwned, double? cultivationArea, String? areaUnit, bool? isPostHarvestStorageAvailable, bool? isCropInsured, List<Equipment>? FarmingToEquipments, List<Irrigation>? FarmingToIrrigations, List<CropSeason>? FarmingToCropSeasons, int? areaUnitId, bool? isSecondaryActivity, int? version}) {
    return Farming._internal(
      id: id,
      landOwned: landOwned ?? this.landOwned,
      cultivationArea: cultivationArea ?? this.cultivationArea,
      areaUnit: areaUnit ?? this.areaUnit,
      isPostHarvestStorageAvailable: isPostHarvestStorageAvailable ?? this.isPostHarvestStorageAvailable,
      isCropInsured: isCropInsured ?? this.isCropInsured,
      FarmingToEquipments: FarmingToEquipments ?? this.FarmingToEquipments,
      FarmingToIrrigations: FarmingToIrrigations ?? this.FarmingToIrrigations,
      FarmingToCropSeasons: FarmingToCropSeasons ?? this.FarmingToCropSeasons,
      areaUnitId: areaUnitId ?? this.areaUnitId,
      isSecondaryActivity: isSecondaryActivity ?? this.isSecondaryActivity,
      version: version ?? this.version);
  }
  
  Farming copyWithModelFieldValues({
    ModelFieldValue<double?>? landOwned,
    ModelFieldValue<double?>? cultivationArea,
    ModelFieldValue<String?>? areaUnit,
    ModelFieldValue<bool?>? isPostHarvestStorageAvailable,
    ModelFieldValue<bool?>? isCropInsured,
    ModelFieldValue<List<Equipment>?>? FarmingToEquipments,
    ModelFieldValue<List<Irrigation>?>? FarmingToIrrigations,
    ModelFieldValue<List<CropSeason>?>? FarmingToCropSeasons,
    ModelFieldValue<int?>? areaUnitId,
    ModelFieldValue<bool>? isSecondaryActivity,
    ModelFieldValue<int?>? version
  }) {
    return Farming._internal(
      id: id,
      landOwned: landOwned == null ? this.landOwned : landOwned.value,
      cultivationArea: cultivationArea == null ? this.cultivationArea : cultivationArea.value,
      areaUnit: areaUnit == null ? this.areaUnit : areaUnit.value,
      isPostHarvestStorageAvailable: isPostHarvestStorageAvailable == null ? this.isPostHarvestStorageAvailable : isPostHarvestStorageAvailable.value,
      isCropInsured: isCropInsured == null ? this.isCropInsured : isCropInsured.value,
      FarmingToEquipments: FarmingToEquipments == null ? this.FarmingToEquipments : FarmingToEquipments.value,
      FarmingToIrrigations: FarmingToIrrigations == null ? this.FarmingToIrrigations : FarmingToIrrigations.value,
      FarmingToCropSeasons: FarmingToCropSeasons == null ? this.FarmingToCropSeasons : FarmingToCropSeasons.value,
      areaUnitId: areaUnitId == null ? this.areaUnitId : areaUnitId.value,
      isSecondaryActivity: isSecondaryActivity == null ? this.isSecondaryActivity : isSecondaryActivity.value,
      version: version == null ? this.version : version.value
    );
  }
  
  Farming.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _landOwned = (json['landOwned'] as num?)?.toDouble(),
      _cultivationArea = (json['cultivationArea'] as num?)?.toDouble(),
      _areaUnit = json['areaUnit'],
      _isPostHarvestStorageAvailable = json['isPostHarvestStorageAvailable'],
      _isCropInsured = json['isCropInsured'],
      _FarmingToEquipments = json['FarmingToEquipments']  is Map
        ? (json['FarmingToEquipments']['items'] is List
          ? (json['FarmingToEquipments']['items'] as List)
              .where((e) => e != null)
              .map((e) => Equipment.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['FarmingToEquipments'] is List
          ? (json['FarmingToEquipments'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Equipment.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _FarmingToIrrigations = json['FarmingToIrrigations']  is Map
        ? (json['FarmingToIrrigations']['items'] is List
          ? (json['FarmingToIrrigations']['items'] as List)
              .where((e) => e != null)
              .map((e) => Irrigation.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['FarmingToIrrigations'] is List
          ? (json['FarmingToIrrigations'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Irrigation.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _FarmingToCropSeasons = json['FarmingToCropSeasons']  is Map
        ? (json['FarmingToCropSeasons']['items'] is List
          ? (json['FarmingToCropSeasons']['items'] as List)
              .where((e) => e != null)
              .map((e) => CropSeason.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['FarmingToCropSeasons'] is List
          ? (json['FarmingToCropSeasons'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => CropSeason.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _areaUnitId = (json['areaUnitId'] as num?)?.toInt(),
      _isSecondaryActivity = json['isSecondaryActivity'],
      _version = (json['version'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'landOwned': _landOwned, 'cultivationArea': _cultivationArea, 'areaUnit': _areaUnit, 'isPostHarvestStorageAvailable': _isPostHarvestStorageAvailable, 'isCropInsured': _isCropInsured, 'FarmingToEquipments': _FarmingToEquipments?.map((Equipment? e) => e?.toJson()).toList(), 'FarmingToIrrigations': _FarmingToIrrigations?.map((Irrigation? e) => e?.toJson()).toList(), 'FarmingToCropSeasons': _FarmingToCropSeasons?.map((CropSeason? e) => e?.toJson()).toList(), 'areaUnitId': _areaUnitId, 'isSecondaryActivity': _isSecondaryActivity, 'version': _version, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'landOwned': _landOwned,
    'cultivationArea': _cultivationArea,
    'areaUnit': _areaUnit,
    'isPostHarvestStorageAvailable': _isPostHarvestStorageAvailable,
    'isCropInsured': _isCropInsured,
    'FarmingToEquipments': _FarmingToEquipments,
    'FarmingToIrrigations': _FarmingToIrrigations,
    'FarmingToCropSeasons': _FarmingToCropSeasons,
    'areaUnitId': _areaUnitId,
    'isSecondaryActivity': _isSecondaryActivity,
    'version': _version,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FarmingModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FarmingModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final LANDOWNED = amplify_core.QueryField(fieldName: "landOwned");
  static final CULTIVATIONAREA = amplify_core.QueryField(fieldName: "cultivationArea");
  static final AREAUNIT = amplify_core.QueryField(fieldName: "areaUnit");
  static final ISPOSTHARVESTSTORAGEAVAILABLE = amplify_core.QueryField(fieldName: "isPostHarvestStorageAvailable");
  static final ISCROPINSURED = amplify_core.QueryField(fieldName: "isCropInsured");
  static final FARMINGTOEQUIPMENTS = amplify_core.QueryField(
    fieldName: "FarmingToEquipments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Equipment'));
  static final FARMINGTOIRRIGATIONS = amplify_core.QueryField(
    fieldName: "FarmingToIrrigations",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Irrigation'));
  static final FARMINGTOCROPSEASONS = amplify_core.QueryField(
    fieldName: "FarmingToCropSeasons",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CropSeason'));
  static final AREAUNITID = amplify_core.QueryField(fieldName: "areaUnitId");
  static final ISSECONDARYACTIVITY = amplify_core.QueryField(fieldName: "isSecondaryActivity");
  static final VERSION = amplify_core.QueryField(fieldName: "version");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Farming";
    modelSchemaDefinition.pluralName = "Farmings";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Farming.LANDOWNED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Farming.CULTIVATIONAREA,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Farming.AREAUNIT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Farming.ISPOSTHARVESTSTORAGEAVAILABLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Farming.ISCROPINSURED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Farming.FARMINGTOEQUIPMENTS,
      isRequired: false,
      ofModelName: 'Equipment',
      associatedKey: Equipment.FARMINGID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Farming.FARMINGTOIRRIGATIONS,
      isRequired: false,
      ofModelName: 'Irrigation',
      associatedKey: Irrigation.FARMINGID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Farming.FARMINGTOCROPSEASONS,
      isRequired: false,
      ofModelName: 'CropSeason',
      associatedKey: CropSeason.FARMINGID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Farming.AREAUNITID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Farming.ISSECONDARYACTIVITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Farming.VERSION,
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

class _FarmingModelType extends amplify_core.ModelType<Farming> {
  const _FarmingModelType();
  
  @override
  Farming fromJson(Map<String, dynamic> jsonData) {
    return Farming.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Farming';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Farming] in your schema.
 */
class FarmingModelIdentifier implements amplify_core.ModelIdentifier<Farming> {
  final String id;

  /** Create an instance of FarmingModelIdentifier using [id] the primary key. */
  const FarmingModelIdentifier({
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
  String toString() => 'FarmingModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FarmingModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}