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


/** This is an auto generated class representing the FarmerApplication type in your schema. */
class FarmerApplication extends amplify_core.Model {
  static const classType = const _FarmerApplicationModelType();
  final String id;
  final String? _userId;
  final String? _applicationId;
  final int? _activityId;
  final int? _status;
  final Bio? _FarmerApplicationToBio;
  final Farming? _FarmerApplicationToFarming;
  final List<FarmerSecondaryActivity>? _FarmerApplicationToFarmerSecondaryActivities;
  final List<Loan>? _FarmerApplicationToLoans;
  final int? _version;
  final String? _finYear;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _farmerApplicationFarmerApplicationToBioId;
  final String? _farmerApplicationFarmerApplicationToFarmingId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FarmerApplicationModelIdentifier get modelIdentifier {
      return FarmerApplicationModelIdentifier(
        id: id
      );
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get applicationId {
    try {
      return _applicationId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get activityId {
    return _activityId;
  }
  
  int get status {
    try {
      return _status!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Bio? get FarmerApplicationToBio {
    return _FarmerApplicationToBio;
  }
  
  Farming? get FarmerApplicationToFarming {
    return _FarmerApplicationToFarming;
  }
  
  List<FarmerSecondaryActivity>? get FarmerApplicationToFarmerSecondaryActivities {
    return _FarmerApplicationToFarmerSecondaryActivities;
  }
  
  List<Loan>? get FarmerApplicationToLoans {
    return _FarmerApplicationToLoans;
  }
  
  int? get version {
    return _version;
  }
  
  String? get finYear {
    return _finYear;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get farmerApplicationFarmerApplicationToBioId {
    return _farmerApplicationFarmerApplicationToBioId;
  }
  
  String? get farmerApplicationFarmerApplicationToFarmingId {
    return _farmerApplicationFarmerApplicationToFarmingId;
  }
  
  const FarmerApplication._internal({required this.id, required userId, required applicationId, activityId, required status, FarmerApplicationToBio, FarmerApplicationToFarming, FarmerApplicationToFarmerSecondaryActivities, FarmerApplicationToLoans, version, finYear, createdAt, updatedAt, farmerApplicationFarmerApplicationToBioId, farmerApplicationFarmerApplicationToFarmingId}): _userId = userId, _applicationId = applicationId, _activityId = activityId, _status = status, _FarmerApplicationToBio = FarmerApplicationToBio, _FarmerApplicationToFarming = FarmerApplicationToFarming, _FarmerApplicationToFarmerSecondaryActivities = FarmerApplicationToFarmerSecondaryActivities, _FarmerApplicationToLoans = FarmerApplicationToLoans, _version = version, _finYear = finYear, _createdAt = createdAt, _updatedAt = updatedAt, _farmerApplicationFarmerApplicationToBioId = farmerApplicationFarmerApplicationToBioId, _farmerApplicationFarmerApplicationToFarmingId = farmerApplicationFarmerApplicationToFarmingId;
  
  factory FarmerApplication({String? id, required String userId, required String applicationId, int? activityId, required int status, Bio? FarmerApplicationToBio, Farming? FarmerApplicationToFarming, List<FarmerSecondaryActivity>? FarmerApplicationToFarmerSecondaryActivities, List<Loan>? FarmerApplicationToLoans, int? version, String? finYear, String? farmerApplicationFarmerApplicationToBioId, String? farmerApplicationFarmerApplicationToFarmingId}) {
    return FarmerApplication._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      userId: userId,
      applicationId: applicationId,
      activityId: activityId,
      status: status,
      FarmerApplicationToBio: FarmerApplicationToBio,
      FarmerApplicationToFarming: FarmerApplicationToFarming,
      FarmerApplicationToFarmerSecondaryActivities: FarmerApplicationToFarmerSecondaryActivities != null ? List<FarmerSecondaryActivity>.unmodifiable(FarmerApplicationToFarmerSecondaryActivities) : FarmerApplicationToFarmerSecondaryActivities,
      FarmerApplicationToLoans: FarmerApplicationToLoans != null ? List<Loan>.unmodifiable(FarmerApplicationToLoans) : FarmerApplicationToLoans,
      version: version,
      finYear: finYear,
      farmerApplicationFarmerApplicationToBioId: farmerApplicationFarmerApplicationToBioId,
      farmerApplicationFarmerApplicationToFarmingId: farmerApplicationFarmerApplicationToFarmingId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FarmerApplication &&
      id == other.id &&
      _userId == other._userId &&
      _applicationId == other._applicationId &&
      _activityId == other._activityId &&
      _status == other._status &&
      _FarmerApplicationToBio == other._FarmerApplicationToBio &&
      _FarmerApplicationToFarming == other._FarmerApplicationToFarming &&
      DeepCollectionEquality().equals(_FarmerApplicationToFarmerSecondaryActivities, other._FarmerApplicationToFarmerSecondaryActivities) &&
      DeepCollectionEquality().equals(_FarmerApplicationToLoans, other._FarmerApplicationToLoans) &&
      _version == other._version &&
      _finYear == other._finYear &&
      _farmerApplicationFarmerApplicationToBioId == other._farmerApplicationFarmerApplicationToBioId &&
      _farmerApplicationFarmerApplicationToFarmingId == other._farmerApplicationFarmerApplicationToFarmingId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FarmerApplication {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("applicationId=" + "$_applicationId" + ", ");
    buffer.write("activityId=" + (_activityId != null ? _activityId!.toString() : "null") + ", ");
    buffer.write("status=" + (_status != null ? _status!.toString() : "null") + ", ");
    buffer.write("version=" + (_version != null ? _version!.toString() : "null") + ", ");
    buffer.write("finYear=" + "$_finYear" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("farmerApplicationFarmerApplicationToBioId=" + "$_farmerApplicationFarmerApplicationToBioId" + ", ");
    buffer.write("farmerApplicationFarmerApplicationToFarmingId=" + "$_farmerApplicationFarmerApplicationToFarmingId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FarmerApplication copyWith({String? userId, String? applicationId, int? activityId, int? status, Bio? FarmerApplicationToBio, Farming? FarmerApplicationToFarming, List<FarmerSecondaryActivity>? FarmerApplicationToFarmerSecondaryActivities, List<Loan>? FarmerApplicationToLoans, int? version, String? finYear, String? farmerApplicationFarmerApplicationToBioId, String? farmerApplicationFarmerApplicationToFarmingId}) {
    return FarmerApplication._internal(
      id: id,
      userId: userId ?? this.userId,
      applicationId: applicationId ?? this.applicationId,
      activityId: activityId ?? this.activityId,
      status: status ?? this.status,
      FarmerApplicationToBio: FarmerApplicationToBio ?? this.FarmerApplicationToBio,
      FarmerApplicationToFarming: FarmerApplicationToFarming ?? this.FarmerApplicationToFarming,
      FarmerApplicationToFarmerSecondaryActivities: FarmerApplicationToFarmerSecondaryActivities ?? this.FarmerApplicationToFarmerSecondaryActivities,
      FarmerApplicationToLoans: FarmerApplicationToLoans ?? this.FarmerApplicationToLoans,
      version: version ?? this.version,
      finYear: finYear ?? this.finYear,
      farmerApplicationFarmerApplicationToBioId: farmerApplicationFarmerApplicationToBioId ?? this.farmerApplicationFarmerApplicationToBioId,
      farmerApplicationFarmerApplicationToFarmingId: farmerApplicationFarmerApplicationToFarmingId ?? this.farmerApplicationFarmerApplicationToFarmingId);
  }
  
  FarmerApplication copyWithModelFieldValues({
    ModelFieldValue<String>? userId,
    ModelFieldValue<String>? applicationId,
    ModelFieldValue<int?>? activityId,
    ModelFieldValue<int>? status,
    ModelFieldValue<Bio?>? FarmerApplicationToBio,
    ModelFieldValue<Farming?>? FarmerApplicationToFarming,
    ModelFieldValue<List<FarmerSecondaryActivity>?>? FarmerApplicationToFarmerSecondaryActivities,
    ModelFieldValue<List<Loan>?>? FarmerApplicationToLoans,
    ModelFieldValue<int?>? version,
    ModelFieldValue<String?>? finYear,
    ModelFieldValue<String?>? farmerApplicationFarmerApplicationToBioId,
    ModelFieldValue<String?>? farmerApplicationFarmerApplicationToFarmingId
  }) {
    return FarmerApplication._internal(
      id: id,
      userId: userId == null ? this.userId : userId.value,
      applicationId: applicationId == null ? this.applicationId : applicationId.value,
      activityId: activityId == null ? this.activityId : activityId.value,
      status: status == null ? this.status : status.value,
      FarmerApplicationToBio: FarmerApplicationToBio == null ? this.FarmerApplicationToBio : FarmerApplicationToBio.value,
      FarmerApplicationToFarming: FarmerApplicationToFarming == null ? this.FarmerApplicationToFarming : FarmerApplicationToFarming.value,
      FarmerApplicationToFarmerSecondaryActivities: FarmerApplicationToFarmerSecondaryActivities == null ? this.FarmerApplicationToFarmerSecondaryActivities : FarmerApplicationToFarmerSecondaryActivities.value,
      FarmerApplicationToLoans: FarmerApplicationToLoans == null ? this.FarmerApplicationToLoans : FarmerApplicationToLoans.value,
      version: version == null ? this.version : version.value,
      finYear: finYear == null ? this.finYear : finYear.value,
      farmerApplicationFarmerApplicationToBioId: farmerApplicationFarmerApplicationToBioId == null ? this.farmerApplicationFarmerApplicationToBioId : farmerApplicationFarmerApplicationToBioId.value,
      farmerApplicationFarmerApplicationToFarmingId: farmerApplicationFarmerApplicationToFarmingId == null ? this.farmerApplicationFarmerApplicationToFarmingId : farmerApplicationFarmerApplicationToFarmingId.value
    );
  }
  
  FarmerApplication.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _applicationId = json['applicationId'],
      _activityId = (json['activityId'] as num?)?.toInt(),
      _status = (json['status'] as num?)?.toInt(),
      _FarmerApplicationToBio = json['FarmerApplicationToBio'] != null
        ? json['FarmerApplicationToBio']['serializedData'] != null
          ? Bio.fromJson(new Map<String, dynamic>.from(json['FarmerApplicationToBio']['serializedData']))
          : Bio.fromJson(new Map<String, dynamic>.from(json['FarmerApplicationToBio']))
        : null,
      _FarmerApplicationToFarming = json['FarmerApplicationToFarming'] != null
        ? json['FarmerApplicationToFarming']['serializedData'] != null
          ? Farming.fromJson(new Map<String, dynamic>.from(json['FarmerApplicationToFarming']['serializedData']))
          : Farming.fromJson(new Map<String, dynamic>.from(json['FarmerApplicationToFarming']))
        : null,
      _FarmerApplicationToFarmerSecondaryActivities = json['FarmerApplicationToFarmerSecondaryActivities']  is Map
        ? (json['FarmerApplicationToFarmerSecondaryActivities']['items'] is List
          ? (json['FarmerApplicationToFarmerSecondaryActivities']['items'] as List)
              .where((e) => e != null)
              .map((e) => FarmerSecondaryActivity.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['FarmerApplicationToFarmerSecondaryActivities'] is List
          ? (json['FarmerApplicationToFarmerSecondaryActivities'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => FarmerSecondaryActivity.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _FarmerApplicationToLoans = json['FarmerApplicationToLoans']  is Map
        ? (json['FarmerApplicationToLoans']['items'] is List
          ? (json['FarmerApplicationToLoans']['items'] as List)
              .where((e) => e != null)
              .map((e) => Loan.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['FarmerApplicationToLoans'] is List
          ? (json['FarmerApplicationToLoans'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Loan.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _version = (json['version'] as num?)?.toInt(),
      _finYear = json['finYear'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _farmerApplicationFarmerApplicationToBioId = json['farmerApplicationFarmerApplicationToBioId'],
      _farmerApplicationFarmerApplicationToFarmingId = json['farmerApplicationFarmerApplicationToFarmingId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'applicationId': _applicationId, 'activityId': _activityId, 'status': _status, 'FarmerApplicationToBio': _FarmerApplicationToBio?.toJson(), 'FarmerApplicationToFarming': _FarmerApplicationToFarming?.toJson(), 'FarmerApplicationToFarmerSecondaryActivities': _FarmerApplicationToFarmerSecondaryActivities?.map((FarmerSecondaryActivity? e) => e?.toJson()).toList(), 'FarmerApplicationToLoans': _FarmerApplicationToLoans?.map((Loan? e) => e?.toJson()).toList(), 'version': _version, 'finYear': _finYear, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'farmerApplicationFarmerApplicationToBioId': _farmerApplicationFarmerApplicationToBioId, 'farmerApplicationFarmerApplicationToFarmingId': _farmerApplicationFarmerApplicationToFarmingId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'userId': _userId,
    'applicationId': _applicationId,
    'activityId': _activityId,
    'status': _status,
    'FarmerApplicationToBio': _FarmerApplicationToBio,
    'FarmerApplicationToFarming': _FarmerApplicationToFarming,
    'FarmerApplicationToFarmerSecondaryActivities': _FarmerApplicationToFarmerSecondaryActivities,
    'FarmerApplicationToLoans': _FarmerApplicationToLoans,
    'version': _version,
    'finYear': _finYear,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'farmerApplicationFarmerApplicationToBioId': _farmerApplicationFarmerApplicationToBioId,
    'farmerApplicationFarmerApplicationToFarmingId': _farmerApplicationFarmerApplicationToFarmingId
  };

  static final amplify_core.QueryModelIdentifier<FarmerApplicationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FarmerApplicationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static final APPLICATIONID = amplify_core.QueryField(fieldName: "applicationId");
  static final ACTIVITYID = amplify_core.QueryField(fieldName: "activityId");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final FARMERAPPLICATIONTOBIO = amplify_core.QueryField(
    fieldName: "FarmerApplicationToBio",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Bio'));
  static final FARMERAPPLICATIONTOFARMING = amplify_core.QueryField(
    fieldName: "FarmerApplicationToFarming",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Farming'));
  static final FARMERAPPLICATIONTOFARMERSECONDARYACTIVITIES = amplify_core.QueryField(
    fieldName: "FarmerApplicationToFarmerSecondaryActivities",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FarmerSecondaryActivity'));
  static final FARMERAPPLICATIONTOLOANS = amplify_core.QueryField(
    fieldName: "FarmerApplicationToLoans",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Loan'));
  static final VERSION = amplify_core.QueryField(fieldName: "version");
  static final FINYEAR = amplify_core.QueryField(fieldName: "finYear");
  static final FARMERAPPLICATIONFARMERAPPLICATIONTOBIOID = amplify_core.QueryField(fieldName: "farmerApplicationFarmerApplicationToBioId");
  static final FARMERAPPLICATIONFARMERAPPLICATIONTOFARMINGID = amplify_core.QueryField(fieldName: "farmerApplicationFarmerApplicationToFarmingId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FarmerApplication";
    modelSchemaDefinition.pluralName = "FarmerApplications";
    
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
      key: FarmerApplication.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerApplication.APPLICATIONID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerApplication.ACTIVITYID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerApplication.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: FarmerApplication.FARMERAPPLICATIONTOBIO,
      isRequired: false,
      ofModelName: 'Bio',
      associatedKey: Bio.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: FarmerApplication.FARMERAPPLICATIONTOFARMING,
      isRequired: false,
      ofModelName: 'Farming',
      associatedKey: Farming.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: FarmerApplication.FARMERAPPLICATIONTOFARMERSECONDARYACTIVITIES,
      isRequired: false,
      ofModelName: 'FarmerSecondaryActivity',
      associatedKey: FarmerSecondaryActivity.FARMERAPPLICATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: FarmerApplication.FARMERAPPLICATIONTOLOANS,
      isRequired: false,
      ofModelName: 'Loan',
      associatedKey: Loan.FARMERAPPLICATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerApplication.VERSION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerApplication.FINYEAR,
      isRequired: false,
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerApplication.FARMERAPPLICATIONFARMERAPPLICATIONTOBIOID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerApplication.FARMERAPPLICATIONFARMERAPPLICATIONTOFARMINGID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _FarmerApplicationModelType extends amplify_core.ModelType<FarmerApplication> {
  const _FarmerApplicationModelType();
  
  @override
  FarmerApplication fromJson(Map<String, dynamic> jsonData) {
    return FarmerApplication.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FarmerApplication';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FarmerApplication] in your schema.
 */
class FarmerApplicationModelIdentifier implements amplify_core.ModelIdentifier<FarmerApplication> {
  final String id;

  /** Create an instance of FarmerApplicationModelIdentifier using [id] the primary key. */
  const FarmerApplicationModelIdentifier({
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
  String toString() => 'FarmerApplicationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FarmerApplicationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}