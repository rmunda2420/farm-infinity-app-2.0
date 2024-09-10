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


/** This is an auto generated class representing the FarmerSecondaryActivity type in your schema. */
class FarmerSecondaryActivity extends amplify_core.Model {
  static const classType = const _FarmerSecondaryActivityModelType();
  final String id;
  final int? _activityId;
  final String? _farmerapplicationID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FarmerSecondaryActivityModelIdentifier get modelIdentifier {
      return FarmerSecondaryActivityModelIdentifier(
        id: id
      );
  }
  
  int? get activityId {
    return _activityId;
  }
  
  String get farmerapplicationID {
    try {
      return _farmerapplicationID!;
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
  
  const FarmerSecondaryActivity._internal({required this.id, activityId, required farmerapplicationID, createdAt, updatedAt}): _activityId = activityId, _farmerapplicationID = farmerapplicationID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FarmerSecondaryActivity({String? id, int? activityId, required String farmerapplicationID}) {
    return FarmerSecondaryActivity._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      activityId: activityId,
      farmerapplicationID: farmerapplicationID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FarmerSecondaryActivity &&
      id == other.id &&
      _activityId == other._activityId &&
      _farmerapplicationID == other._farmerapplicationID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FarmerSecondaryActivity {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("activityId=" + (_activityId != null ? _activityId!.toString() : "null") + ", ");
    buffer.write("farmerapplicationID=" + "$_farmerapplicationID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FarmerSecondaryActivity copyWith({int? activityId, String? farmerapplicationID}) {
    return FarmerSecondaryActivity._internal(
      id: id,
      activityId: activityId ?? this.activityId,
      farmerapplicationID: farmerapplicationID ?? this.farmerapplicationID);
  }
  
  FarmerSecondaryActivity copyWithModelFieldValues({
    ModelFieldValue<int?>? activityId,
    ModelFieldValue<String>? farmerapplicationID
  }) {
    return FarmerSecondaryActivity._internal(
      id: id,
      activityId: activityId == null ? this.activityId : activityId.value,
      farmerapplicationID: farmerapplicationID == null ? this.farmerapplicationID : farmerapplicationID.value
    );
  }
  
  FarmerSecondaryActivity.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _activityId = (json['activityId'] as num?)?.toInt(),
      _farmerapplicationID = json['farmerapplicationID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'activityId': _activityId, 'farmerapplicationID': _farmerapplicationID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'activityId': _activityId,
    'farmerapplicationID': _farmerapplicationID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FarmerSecondaryActivityModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FarmerSecondaryActivityModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ACTIVITYID = amplify_core.QueryField(fieldName: "activityId");
  static final FARMERAPPLICATIONID = amplify_core.QueryField(fieldName: "farmerapplicationID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FarmerSecondaryActivity";
    modelSchemaDefinition.pluralName = "FarmerSecondaryActivities";
    
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
      amplify_core.ModelIndex(fields: const ["farmerapplicationID"], name: "byFarmerApplication")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerSecondaryActivity.ACTIVITYID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FarmerSecondaryActivity.FARMERAPPLICATIONID,
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

class _FarmerSecondaryActivityModelType extends amplify_core.ModelType<FarmerSecondaryActivity> {
  const _FarmerSecondaryActivityModelType();
  
  @override
  FarmerSecondaryActivity fromJson(Map<String, dynamic> jsonData) {
    return FarmerSecondaryActivity.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FarmerSecondaryActivity';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FarmerSecondaryActivity] in your schema.
 */
class FarmerSecondaryActivityModelIdentifier implements amplify_core.ModelIdentifier<FarmerSecondaryActivity> {
  final String id;

  /** Create an instance of FarmerSecondaryActivityModelIdentifier using [id] the primary key. */
  const FarmerSecondaryActivityModelIdentifier({
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
  String toString() => 'FarmerSecondaryActivityModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FarmerSecondaryActivityModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}