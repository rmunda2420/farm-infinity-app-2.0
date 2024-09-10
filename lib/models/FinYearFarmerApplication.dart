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


/** This is an auto generated class representing the FinYearFarmerApplication type in your schema. */
class FinYearFarmerApplication extends amplify_core.Model {
  static const classType = const _FinYearFarmerApplicationModelType();
  final String id;
  final FinYear? _finYear;
  final FarmerApplication? _farmerApplication;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FinYearFarmerApplicationModelIdentifier get modelIdentifier {
      return FinYearFarmerApplicationModelIdentifier(
        id: id
      );
  }
  
  FinYear get finYear {
    try {
      return _finYear!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  FarmerApplication get farmerApplication {
    try {
      return _farmerApplication!;
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
  
  const FinYearFarmerApplication._internal({required this.id, required finYear, required farmerApplication, createdAt, updatedAt}): _finYear = finYear, _farmerApplication = farmerApplication, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FinYearFarmerApplication({String? id, required FinYear finYear, required FarmerApplication farmerApplication}) {
    return FinYearFarmerApplication._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      finYear: finYear,
      farmerApplication: farmerApplication);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FinYearFarmerApplication &&
      id == other.id &&
      _finYear == other._finYear &&
      _farmerApplication == other._farmerApplication;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FinYearFarmerApplication {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("finYear=" + (_finYear != null ? _finYear!.toString() : "null") + ", ");
    buffer.write("farmerApplication=" + (_farmerApplication != null ? _farmerApplication!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FinYearFarmerApplication copyWith({FinYear? finYear, FarmerApplication? farmerApplication}) {
    return FinYearFarmerApplication._internal(
      id: id,
      finYear: finYear ?? this.finYear,
      farmerApplication: farmerApplication ?? this.farmerApplication);
  }
  
  FinYearFarmerApplication copyWithModelFieldValues({
    ModelFieldValue<FinYear>? finYear,
    ModelFieldValue<FarmerApplication>? farmerApplication
  }) {
    return FinYearFarmerApplication._internal(
      id: id,
      finYear: finYear == null ? this.finYear : finYear.value,
      farmerApplication: farmerApplication == null ? this.farmerApplication : farmerApplication.value
    );
  }
  
  FinYearFarmerApplication.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _finYear = json['finYear'] != null
        ? json['finYear']['serializedData'] != null
          ? FinYear.fromJson(new Map<String, dynamic>.from(json['finYear']['serializedData']))
          : FinYear.fromJson(new Map<String, dynamic>.from(json['finYear']))
        : null,
      _farmerApplication = json['farmerApplication'] != null
        ? json['farmerApplication']['serializedData'] != null
          ? FarmerApplication.fromJson(new Map<String, dynamic>.from(json['farmerApplication']['serializedData']))
          : FarmerApplication.fromJson(new Map<String, dynamic>.from(json['farmerApplication']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'finYear': _finYear?.toJson(), 'farmerApplication': _farmerApplication?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'finYear': _finYear,
    'farmerApplication': _farmerApplication,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FinYearFarmerApplicationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FinYearFarmerApplicationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FINYEAR = amplify_core.QueryField(
    fieldName: "finYear",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FinYear'));
  static final FARMERAPPLICATION = amplify_core.QueryField(
    fieldName: "farmerApplication",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FarmerApplication'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FinYearFarmerApplication";
    modelSchemaDefinition.pluralName = "FinYearFarmerApplications";
    
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
      amplify_core.ModelIndex(fields: const ["finYearId"], name: "byFinYear"),
      amplify_core.ModelIndex(fields: const ["farmerApplicationId"], name: "byFarmerApplication")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: FinYearFarmerApplication.FINYEAR,
      isRequired: true,
      targetNames: ['finYearId'],
      ofModelName: 'FinYear'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: FinYearFarmerApplication.FARMERAPPLICATION,
      isRequired: true,
      targetNames: ['farmerApplicationId'],
      ofModelName: 'FarmerApplication'
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

class _FinYearFarmerApplicationModelType extends amplify_core.ModelType<FinYearFarmerApplication> {
  const _FinYearFarmerApplicationModelType();
  
  @override
  FinYearFarmerApplication fromJson(Map<String, dynamic> jsonData) {
    return FinYearFarmerApplication.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FinYearFarmerApplication';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FinYearFarmerApplication] in your schema.
 */
class FinYearFarmerApplicationModelIdentifier implements amplify_core.ModelIdentifier<FinYearFarmerApplication> {
  final String id;

  /** Create an instance of FinYearFarmerApplicationModelIdentifier using [id] the primary key. */
  const FinYearFarmerApplicationModelIdentifier({
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
  String toString() => 'FinYearFarmerApplicationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FinYearFarmerApplicationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}