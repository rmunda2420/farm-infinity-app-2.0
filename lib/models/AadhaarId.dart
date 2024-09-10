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


/** This is an auto generated class representing the AadhaarId type in your schema. */
class AadhaarId extends amplify_core.Model {
  static const classType = const _AadhaarIdModelType();
  final String id;
  final String? _userId;
  final bool? _verified;
  final String? _verificationId;
  final AadhaarKycOcrDataFront? _AadhaarToAadhaarKycOcrFront;
  final AadhaarKycOcrDataBack? _AadhaarToAadhaarKycOcrBack;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _aadhaarIdAadhaarToAadhaarKycOcrFrontId;
  final String? _aadhaarIdAadhaarToAadhaarKycOcrBackId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AadhaarIdModelIdentifier get modelIdentifier {
      return AadhaarIdModelIdentifier(
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
  
  bool? get verified {
    return _verified;
  }
  
  String? get verificationId {
    return _verificationId;
  }
  
  AadhaarKycOcrDataFront? get AadhaarToAadhaarKycOcrFront {
    return _AadhaarToAadhaarKycOcrFront;
  }
  
  AadhaarKycOcrDataBack? get AadhaarToAadhaarKycOcrBack {
    return _AadhaarToAadhaarKycOcrBack;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get aadhaarIdAadhaarToAadhaarKycOcrFrontId {
    return _aadhaarIdAadhaarToAadhaarKycOcrFrontId;
  }
  
  String? get aadhaarIdAadhaarToAadhaarKycOcrBackId {
    return _aadhaarIdAadhaarToAadhaarKycOcrBackId;
  }
  
  const AadhaarId._internal({required this.id, required userId, verified, verificationId, AadhaarToAadhaarKycOcrFront, AadhaarToAadhaarKycOcrBack, createdAt, updatedAt, aadhaarIdAadhaarToAadhaarKycOcrFrontId, aadhaarIdAadhaarToAadhaarKycOcrBackId}): _userId = userId, _verified = verified, _verificationId = verificationId, _AadhaarToAadhaarKycOcrFront = AadhaarToAadhaarKycOcrFront, _AadhaarToAadhaarKycOcrBack = AadhaarToAadhaarKycOcrBack, _createdAt = createdAt, _updatedAt = updatedAt, _aadhaarIdAadhaarToAadhaarKycOcrFrontId = aadhaarIdAadhaarToAadhaarKycOcrFrontId, _aadhaarIdAadhaarToAadhaarKycOcrBackId = aadhaarIdAadhaarToAadhaarKycOcrBackId;
  
  factory AadhaarId({String? id, required String userId, bool? verified, String? verificationId, AadhaarKycOcrDataFront? AadhaarToAadhaarKycOcrFront, AadhaarKycOcrDataBack? AadhaarToAadhaarKycOcrBack, String? aadhaarIdAadhaarToAadhaarKycOcrFrontId, String? aadhaarIdAadhaarToAadhaarKycOcrBackId}) {
    return AadhaarId._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      userId: userId,
      verified: verified,
      verificationId: verificationId,
      AadhaarToAadhaarKycOcrFront: AadhaarToAadhaarKycOcrFront,
      AadhaarToAadhaarKycOcrBack: AadhaarToAadhaarKycOcrBack,
      aadhaarIdAadhaarToAadhaarKycOcrFrontId: aadhaarIdAadhaarToAadhaarKycOcrFrontId,
      aadhaarIdAadhaarToAadhaarKycOcrBackId: aadhaarIdAadhaarToAadhaarKycOcrBackId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AadhaarId &&
      id == other.id &&
      _userId == other._userId &&
      _verified == other._verified &&
      _verificationId == other._verificationId &&
      _AadhaarToAadhaarKycOcrFront == other._AadhaarToAadhaarKycOcrFront &&
      _AadhaarToAadhaarKycOcrBack == other._AadhaarToAadhaarKycOcrBack &&
      _aadhaarIdAadhaarToAadhaarKycOcrFrontId == other._aadhaarIdAadhaarToAadhaarKycOcrFrontId &&
      _aadhaarIdAadhaarToAadhaarKycOcrBackId == other._aadhaarIdAadhaarToAadhaarKycOcrBackId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AadhaarId {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("verified=" + (_verified != null ? _verified!.toString() : "null") + ", ");
    buffer.write("verificationId=" + "$_verificationId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("aadhaarIdAadhaarToAadhaarKycOcrFrontId=" + "$_aadhaarIdAadhaarToAadhaarKycOcrFrontId" + ", ");
    buffer.write("aadhaarIdAadhaarToAadhaarKycOcrBackId=" + "$_aadhaarIdAadhaarToAadhaarKycOcrBackId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AadhaarId copyWith({String? userId, bool? verified, String? verificationId, AadhaarKycOcrDataFront? AadhaarToAadhaarKycOcrFront, AadhaarKycOcrDataBack? AadhaarToAadhaarKycOcrBack, String? aadhaarIdAadhaarToAadhaarKycOcrFrontId, String? aadhaarIdAadhaarToAadhaarKycOcrBackId}) {
    return AadhaarId._internal(
      id: id,
      userId: userId ?? this.userId,
      verified: verified ?? this.verified,
      verificationId: verificationId ?? this.verificationId,
      AadhaarToAadhaarKycOcrFront: AadhaarToAadhaarKycOcrFront ?? this.AadhaarToAadhaarKycOcrFront,
      AadhaarToAadhaarKycOcrBack: AadhaarToAadhaarKycOcrBack ?? this.AadhaarToAadhaarKycOcrBack,
      aadhaarIdAadhaarToAadhaarKycOcrFrontId: aadhaarIdAadhaarToAadhaarKycOcrFrontId ?? this.aadhaarIdAadhaarToAadhaarKycOcrFrontId,
      aadhaarIdAadhaarToAadhaarKycOcrBackId: aadhaarIdAadhaarToAadhaarKycOcrBackId ?? this.aadhaarIdAadhaarToAadhaarKycOcrBackId);
  }
  
  AadhaarId copyWithModelFieldValues({
    ModelFieldValue<String>? userId,
    ModelFieldValue<bool?>? verified,
    ModelFieldValue<String?>? verificationId,
    ModelFieldValue<AadhaarKycOcrDataFront?>? AadhaarToAadhaarKycOcrFront,
    ModelFieldValue<AadhaarKycOcrDataBack?>? AadhaarToAadhaarKycOcrBack,
    ModelFieldValue<String?>? aadhaarIdAadhaarToAadhaarKycOcrFrontId,
    ModelFieldValue<String?>? aadhaarIdAadhaarToAadhaarKycOcrBackId
  }) {
    return AadhaarId._internal(
      id: id,
      userId: userId == null ? this.userId : userId.value,
      verified: verified == null ? this.verified : verified.value,
      verificationId: verificationId == null ? this.verificationId : verificationId.value,
      AadhaarToAadhaarKycOcrFront: AadhaarToAadhaarKycOcrFront == null ? this.AadhaarToAadhaarKycOcrFront : AadhaarToAadhaarKycOcrFront.value,
      AadhaarToAadhaarKycOcrBack: AadhaarToAadhaarKycOcrBack == null ? this.AadhaarToAadhaarKycOcrBack : AadhaarToAadhaarKycOcrBack.value,
      aadhaarIdAadhaarToAadhaarKycOcrFrontId: aadhaarIdAadhaarToAadhaarKycOcrFrontId == null ? this.aadhaarIdAadhaarToAadhaarKycOcrFrontId : aadhaarIdAadhaarToAadhaarKycOcrFrontId.value,
      aadhaarIdAadhaarToAadhaarKycOcrBackId: aadhaarIdAadhaarToAadhaarKycOcrBackId == null ? this.aadhaarIdAadhaarToAadhaarKycOcrBackId : aadhaarIdAadhaarToAadhaarKycOcrBackId.value
    );
  }
  
  AadhaarId.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _verified = json['verified'],
      _verificationId = json['verificationId'],
      _AadhaarToAadhaarKycOcrFront = json['AadhaarToAadhaarKycOcrFront'] != null
        ? json['AadhaarToAadhaarKycOcrFront']['serializedData'] != null
          ? AadhaarKycOcrDataFront.fromJson(new Map<String, dynamic>.from(json['AadhaarToAadhaarKycOcrFront']['serializedData']))
          : AadhaarKycOcrDataFront.fromJson(new Map<String, dynamic>.from(json['AadhaarToAadhaarKycOcrFront']))
        : null,
      _AadhaarToAadhaarKycOcrBack = json['AadhaarToAadhaarKycOcrBack'] != null
        ? json['AadhaarToAadhaarKycOcrBack']['serializedData'] != null
          ? AadhaarKycOcrDataBack.fromJson(new Map<String, dynamic>.from(json['AadhaarToAadhaarKycOcrBack']['serializedData']))
          : AadhaarKycOcrDataBack.fromJson(new Map<String, dynamic>.from(json['AadhaarToAadhaarKycOcrBack']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _aadhaarIdAadhaarToAadhaarKycOcrFrontId = json['aadhaarIdAadhaarToAadhaarKycOcrFrontId'],
      _aadhaarIdAadhaarToAadhaarKycOcrBackId = json['aadhaarIdAadhaarToAadhaarKycOcrBackId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'verified': _verified, 'verificationId': _verificationId, 'AadhaarToAadhaarKycOcrFront': _AadhaarToAadhaarKycOcrFront?.toJson(), 'AadhaarToAadhaarKycOcrBack': _AadhaarToAadhaarKycOcrBack?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'aadhaarIdAadhaarToAadhaarKycOcrFrontId': _aadhaarIdAadhaarToAadhaarKycOcrFrontId, 'aadhaarIdAadhaarToAadhaarKycOcrBackId': _aadhaarIdAadhaarToAadhaarKycOcrBackId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'userId': _userId,
    'verified': _verified,
    'verificationId': _verificationId,
    'AadhaarToAadhaarKycOcrFront': _AadhaarToAadhaarKycOcrFront,
    'AadhaarToAadhaarKycOcrBack': _AadhaarToAadhaarKycOcrBack,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'aadhaarIdAadhaarToAadhaarKycOcrFrontId': _aadhaarIdAadhaarToAadhaarKycOcrFrontId,
    'aadhaarIdAadhaarToAadhaarKycOcrBackId': _aadhaarIdAadhaarToAadhaarKycOcrBackId
  };

  static final amplify_core.QueryModelIdentifier<AadhaarIdModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AadhaarIdModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static final VERIFIED = amplify_core.QueryField(fieldName: "verified");
  static final VERIFICATIONID = amplify_core.QueryField(fieldName: "verificationId");
  static final AADHAARTOAADHAARKYCOCRFRONT = amplify_core.QueryField(
    fieldName: "AadhaarToAadhaarKycOcrFront",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AadhaarKycOcrDataFront'));
  static final AADHAARTOAADHAARKYCOCRBACK = amplify_core.QueryField(
    fieldName: "AadhaarToAadhaarKycOcrBack",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AadhaarKycOcrDataBack'));
  static final AADHAARIDAADHAARTOAADHAARKYCOCRFRONTID = amplify_core.QueryField(fieldName: "aadhaarIdAadhaarToAadhaarKycOcrFrontId");
  static final AADHAARIDAADHAARTOAADHAARKYCOCRBACKID = amplify_core.QueryField(fieldName: "aadhaarIdAadhaarToAadhaarKycOcrBackId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AadhaarId";
    modelSchemaDefinition.pluralName = "AadhaarIds";
    
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
      key: AadhaarId.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarId.VERIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarId.VERIFICATIONID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: AadhaarId.AADHAARTOAADHAARKYCOCRFRONT,
      isRequired: false,
      ofModelName: 'AadhaarKycOcrDataFront',
      associatedKey: AadhaarKycOcrDataFront.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: AadhaarId.AADHAARTOAADHAARKYCOCRBACK,
      isRequired: false,
      ofModelName: 'AadhaarKycOcrDataBack',
      associatedKey: AadhaarKycOcrDataBack.ID
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
      key: AadhaarId.AADHAARIDAADHAARTOAADHAARKYCOCRFRONTID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarId.AADHAARIDAADHAARTOAADHAARKYCOCRBACKID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _AadhaarIdModelType extends amplify_core.ModelType<AadhaarId> {
  const _AadhaarIdModelType();
  
  @override
  AadhaarId fromJson(Map<String, dynamic> jsonData) {
    return AadhaarId.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'AadhaarId';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [AadhaarId] in your schema.
 */
class AadhaarIdModelIdentifier implements amplify_core.ModelIdentifier<AadhaarId> {
  final String id;

  /** Create an instance of AadhaarIdModelIdentifier using [id] the primary key. */
  const AadhaarIdModelIdentifier({
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
  String toString() => 'AadhaarIdModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AadhaarIdModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}