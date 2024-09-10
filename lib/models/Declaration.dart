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


/** This is an auto generated class representing the Declaration type in your schema. */
class Declaration extends amplify_core.Model {
  static const classType = const _DeclarationModelType();
  final String id;
  final bool? _farmerDeclaration;
  final String? _farmerDeclarationText;
  final bool? _officerDeclaration;
  final String? _officerDeclarationText;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  DeclarationModelIdentifier get modelIdentifier {
      return DeclarationModelIdentifier(
        id: id
      );
  }
  
  bool? get farmerDeclaration {
    return _farmerDeclaration;
  }
  
  String? get farmerDeclarationText {
    return _farmerDeclarationText;
  }
  
  bool? get officerDeclaration {
    return _officerDeclaration;
  }
  
  String? get officerDeclarationText {
    return _officerDeclarationText;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Declaration._internal({required this.id, farmerDeclaration, farmerDeclarationText, officerDeclaration, officerDeclarationText, createdAt, updatedAt}): _farmerDeclaration = farmerDeclaration, _farmerDeclarationText = farmerDeclarationText, _officerDeclaration = officerDeclaration, _officerDeclarationText = officerDeclarationText, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Declaration({String? id, bool? farmerDeclaration, String? farmerDeclarationText, bool? officerDeclaration, String? officerDeclarationText}) {
    return Declaration._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      farmerDeclaration: farmerDeclaration,
      farmerDeclarationText: farmerDeclarationText,
      officerDeclaration: officerDeclaration,
      officerDeclarationText: officerDeclarationText);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Declaration &&
      id == other.id &&
      _farmerDeclaration == other._farmerDeclaration &&
      _farmerDeclarationText == other._farmerDeclarationText &&
      _officerDeclaration == other._officerDeclaration &&
      _officerDeclarationText == other._officerDeclarationText;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Declaration {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("farmerDeclaration=" + (_farmerDeclaration != null ? _farmerDeclaration!.toString() : "null") + ", ");
    buffer.write("farmerDeclarationText=" + "$_farmerDeclarationText" + ", ");
    buffer.write("officerDeclaration=" + (_officerDeclaration != null ? _officerDeclaration!.toString() : "null") + ", ");
    buffer.write("officerDeclarationText=" + "$_officerDeclarationText" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Declaration copyWith({bool? farmerDeclaration, String? farmerDeclarationText, bool? officerDeclaration, String? officerDeclarationText}) {
    return Declaration._internal(
      id: id,
      farmerDeclaration: farmerDeclaration ?? this.farmerDeclaration,
      farmerDeclarationText: farmerDeclarationText ?? this.farmerDeclarationText,
      officerDeclaration: officerDeclaration ?? this.officerDeclaration,
      officerDeclarationText: officerDeclarationText ?? this.officerDeclarationText);
  }
  
  Declaration copyWithModelFieldValues({
    ModelFieldValue<bool?>? farmerDeclaration,
    ModelFieldValue<String?>? farmerDeclarationText,
    ModelFieldValue<bool?>? officerDeclaration,
    ModelFieldValue<String?>? officerDeclarationText
  }) {
    return Declaration._internal(
      id: id,
      farmerDeclaration: farmerDeclaration == null ? this.farmerDeclaration : farmerDeclaration.value,
      farmerDeclarationText: farmerDeclarationText == null ? this.farmerDeclarationText : farmerDeclarationText.value,
      officerDeclaration: officerDeclaration == null ? this.officerDeclaration : officerDeclaration.value,
      officerDeclarationText: officerDeclarationText == null ? this.officerDeclarationText : officerDeclarationText.value
    );
  }
  
  Declaration.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _farmerDeclaration = json['farmerDeclaration'],
      _farmerDeclarationText = json['farmerDeclarationText'],
      _officerDeclaration = json['officerDeclaration'],
      _officerDeclarationText = json['officerDeclarationText'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'farmerDeclaration': _farmerDeclaration, 'farmerDeclarationText': _farmerDeclarationText, 'officerDeclaration': _officerDeclaration, 'officerDeclarationText': _officerDeclarationText, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'farmerDeclaration': _farmerDeclaration,
    'farmerDeclarationText': _farmerDeclarationText,
    'officerDeclaration': _officerDeclaration,
    'officerDeclarationText': _officerDeclarationText,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<DeclarationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<DeclarationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FARMERDECLARATION = amplify_core.QueryField(fieldName: "farmerDeclaration");
  static final FARMERDECLARATIONTEXT = amplify_core.QueryField(fieldName: "farmerDeclarationText");
  static final OFFICERDECLARATION = amplify_core.QueryField(fieldName: "officerDeclaration");
  static final OFFICERDECLARATIONTEXT = amplify_core.QueryField(fieldName: "officerDeclarationText");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Declaration";
    modelSchemaDefinition.pluralName = "Declarations";
    
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
      key: Declaration.FARMERDECLARATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Declaration.FARMERDECLARATIONTEXT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Declaration.OFFICERDECLARATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Declaration.OFFICERDECLARATIONTEXT,
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
  });
}

class _DeclarationModelType extends amplify_core.ModelType<Declaration> {
  const _DeclarationModelType();
  
  @override
  Declaration fromJson(Map<String, dynamic> jsonData) {
    return Declaration.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Declaration';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Declaration] in your schema.
 */
class DeclarationModelIdentifier implements amplify_core.ModelIdentifier<Declaration> {
  final String id;

  /** Create an instance of DeclarationModelIdentifier using [id] the primary key. */
  const DeclarationModelIdentifier({
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
  String toString() => 'DeclarationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is DeclarationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}