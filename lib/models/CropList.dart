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


/** This is an auto generated class representing the CropList type in your schema. */
class CropList extends amplify_core.Model {
  static const classType = const _CropListModelType();
  final String id;
  final int? _cropId;
  final String? _cropName;
  final String? _category;
  final String? _subCategory;
  final bool? _isActive;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CropListModelIdentifier get modelIdentifier {
      return CropListModelIdentifier(
        id: id
      );
  }
  
  int get cropId {
    try {
      return _cropId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get cropName {
    try {
      return _cropName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get category {
    try {
      return _category!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get subCategory {
    return _subCategory;
  }
  
  bool? get isActive {
    return _isActive;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CropList._internal({required this.id, required cropId, required cropName, required category, subCategory, isActive, createdAt, updatedAt}): _cropId = cropId, _cropName = cropName, _category = category, _subCategory = subCategory, _isActive = isActive, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CropList({String? id, required int cropId, required String cropName, required String category, String? subCategory, bool? isActive}) {
    return CropList._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      cropId: cropId,
      cropName: cropName,
      category: category,
      subCategory: subCategory,
      isActive: isActive);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CropList &&
      id == other.id &&
      _cropId == other._cropId &&
      _cropName == other._cropName &&
      _category == other._category &&
      _subCategory == other._subCategory &&
      _isActive == other._isActive;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CropList {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("cropId=" + (_cropId != null ? _cropId!.toString() : "null") + ", ");
    buffer.write("cropName=" + "$_cropName" + ", ");
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("subCategory=" + "$_subCategory" + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CropList copyWith({int? cropId, String? cropName, String? category, String? subCategory, bool? isActive}) {
    return CropList._internal(
      id: id,
      cropId: cropId ?? this.cropId,
      cropName: cropName ?? this.cropName,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      isActive: isActive ?? this.isActive);
  }
  
  CropList copyWithModelFieldValues({
    ModelFieldValue<int>? cropId,
    ModelFieldValue<String>? cropName,
    ModelFieldValue<String>? category,
    ModelFieldValue<String?>? subCategory,
    ModelFieldValue<bool?>? isActive
  }) {
    return CropList._internal(
      id: id,
      cropId: cropId == null ? this.cropId : cropId.value,
      cropName: cropName == null ? this.cropName : cropName.value,
      category: category == null ? this.category : category.value,
      subCategory: subCategory == null ? this.subCategory : subCategory.value,
      isActive: isActive == null ? this.isActive : isActive.value
    );
  }
  
  CropList.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _cropId = (json['cropId'] as num?)?.toInt(),
      _cropName = json['cropName'],
      _category = json['category'],
      _subCategory = json['subCategory'],
      _isActive = json['isActive'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'cropId': _cropId, 'cropName': _cropName, 'category': _category, 'subCategory': _subCategory, 'isActive': _isActive, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'cropId': _cropId,
    'cropName': _cropName,
    'category': _category,
    'subCategory': _subCategory,
    'isActive': _isActive,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CropListModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CropListModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CROPID = amplify_core.QueryField(fieldName: "cropId");
  static final CROPNAME = amplify_core.QueryField(fieldName: "cropName");
  static final CATEGORY = amplify_core.QueryField(fieldName: "category");
  static final SUBCATEGORY = amplify_core.QueryField(fieldName: "subCategory");
  static final ISACTIVE = amplify_core.QueryField(fieldName: "isActive");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CropList";
    modelSchemaDefinition.pluralName = "CropLists";
    
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
      key: CropList.CROPID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropList.CROPNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropList.CATEGORY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropList.SUBCATEGORY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CropList.ISACTIVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
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

class _CropListModelType extends amplify_core.ModelType<CropList> {
  const _CropListModelType();
  
  @override
  CropList fromJson(Map<String, dynamic> jsonData) {
    return CropList.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CropList';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CropList] in your schema.
 */
class CropListModelIdentifier implements amplify_core.ModelIdentifier<CropList> {
  final String id;

  /** Create an instance of CropListModelIdentifier using [id] the primary key. */
  const CropListModelIdentifier({
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
  String toString() => 'CropListModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CropListModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}