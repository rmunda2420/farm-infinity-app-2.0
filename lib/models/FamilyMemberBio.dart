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


/** This is an auto generated class representing the FamilyMemberBio type in your schema. */
class FamilyMemberBio extends amplify_core.Model {
  static const classType = const _FamilyMemberBioModelType();
  final String id;
  final FamilyMember? _familyMember;
  final Bio? _bio;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FamilyMemberBioModelIdentifier get modelIdentifier {
      return FamilyMemberBioModelIdentifier(
        id: id
      );
  }
  
  FamilyMember get familyMember {
    try {
      return _familyMember!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Bio get bio {
    try {
      return _bio!;
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
  
  const FamilyMemberBio._internal({required this.id, required familyMember, required bio, createdAt, updatedAt}): _familyMember = familyMember, _bio = bio, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FamilyMemberBio({String? id, required FamilyMember familyMember, required Bio bio}) {
    return FamilyMemberBio._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      familyMember: familyMember,
      bio: bio);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FamilyMemberBio &&
      id == other.id &&
      _familyMember == other._familyMember &&
      _bio == other._bio;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FamilyMemberBio {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("familyMember=" + (_familyMember != null ? _familyMember!.toString() : "null") + ", ");
    buffer.write("bio=" + (_bio != null ? _bio!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FamilyMemberBio copyWith({FamilyMember? familyMember, Bio? bio}) {
    return FamilyMemberBio._internal(
      id: id,
      familyMember: familyMember ?? this.familyMember,
      bio: bio ?? this.bio);
  }
  
  FamilyMemberBio copyWithModelFieldValues({
    ModelFieldValue<FamilyMember>? familyMember,
    ModelFieldValue<Bio>? bio
  }) {
    return FamilyMemberBio._internal(
      id: id,
      familyMember: familyMember == null ? this.familyMember : familyMember.value,
      bio: bio == null ? this.bio : bio.value
    );
  }
  
  FamilyMemberBio.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _familyMember = json['familyMember'] != null
        ? json['familyMember']['serializedData'] != null
          ? FamilyMember.fromJson(new Map<String, dynamic>.from(json['familyMember']['serializedData']))
          : FamilyMember.fromJson(new Map<String, dynamic>.from(json['familyMember']))
        : null,
      _bio = json['bio'] != null
        ? json['bio']['serializedData'] != null
          ? Bio.fromJson(new Map<String, dynamic>.from(json['bio']['serializedData']))
          : Bio.fromJson(new Map<String, dynamic>.from(json['bio']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'familyMember': _familyMember?.toJson(), 'bio': _bio?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'familyMember': _familyMember,
    'bio': _bio,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FamilyMemberBioModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FamilyMemberBioModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FAMILYMEMBER = amplify_core.QueryField(
    fieldName: "familyMember",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FamilyMember'));
  static final BIO = amplify_core.QueryField(
    fieldName: "bio",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Bio'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FamilyMemberBio";
    modelSchemaDefinition.pluralName = "FamilyMemberBios";
    
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
      amplify_core.ModelIndex(fields: const ["familyMemberId"], name: "byFamilyMember"),
      amplify_core.ModelIndex(fields: const ["bioId"], name: "byBio")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: FamilyMemberBio.FAMILYMEMBER,
      isRequired: true,
      targetNames: ['familyMemberId'],
      ofModelName: 'FamilyMember'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: FamilyMemberBio.BIO,
      isRequired: true,
      targetNames: ['bioId'],
      ofModelName: 'Bio'
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

class _FamilyMemberBioModelType extends amplify_core.ModelType<FamilyMemberBio> {
  const _FamilyMemberBioModelType();
  
  @override
  FamilyMemberBio fromJson(Map<String, dynamic> jsonData) {
    return FamilyMemberBio.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FamilyMemberBio';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FamilyMemberBio] in your schema.
 */
class FamilyMemberBioModelIdentifier implements amplify_core.ModelIdentifier<FamilyMemberBio> {
  final String id;

  /** Create an instance of FamilyMemberBioModelIdentifier using [id] the primary key. */
  const FamilyMemberBioModelIdentifier({
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
  String toString() => 'FamilyMemberBioModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FamilyMemberBioModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}