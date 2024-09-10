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


/** This is an auto generated class representing the GrownCrop type in your schema. */
class GrownCrop extends amplify_core.Model {
  static const classType = const _GrownCropModelType();
  final String id;
  final String? _cropName;
  final int? _cropId;
  final String? _photo;
  final bool? _isSecondaryActivity;
  final String? _cropseasonID;
  final int? _version;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  GrownCropModelIdentifier get modelIdentifier {
      return GrownCropModelIdentifier(
        id: id
      );
  }
  
  String? get cropName {
    return _cropName;
  }
  
  int? get cropId {
    return _cropId;
  }
  
  String? get photo {
    return _photo;
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
  
  String get cropseasonID {
    try {
      return _cropseasonID!;
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
  
  const GrownCrop._internal({required this.id, cropName, cropId, photo, required isSecondaryActivity, required cropseasonID, version, createdAt, updatedAt}): _cropName = cropName, _cropId = cropId, _photo = photo, _isSecondaryActivity = isSecondaryActivity, _cropseasonID = cropseasonID, _version = version, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GrownCrop({String? id, String? cropName, int? cropId, String? photo, required bool isSecondaryActivity, required String cropseasonID, int? version}) {
    return GrownCrop._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      cropName: cropName,
      cropId: cropId,
      photo: photo,
      isSecondaryActivity: isSecondaryActivity,
      cropseasonID: cropseasonID,
      version: version);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GrownCrop &&
      id == other.id &&
      _cropName == other._cropName &&
      _cropId == other._cropId &&
      _photo == other._photo &&
      _isSecondaryActivity == other._isSecondaryActivity &&
      _cropseasonID == other._cropseasonID &&
      _version == other._version;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GrownCrop {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("cropName=" + "$_cropName" + ", ");
    buffer.write("cropId=" + (_cropId != null ? _cropId!.toString() : "null") + ", ");
    buffer.write("photo=" + "$_photo" + ", ");
    buffer.write("isSecondaryActivity=" + (_isSecondaryActivity != null ? _isSecondaryActivity!.toString() : "null") + ", ");
    buffer.write("cropseasonID=" + "$_cropseasonID" + ", ");
    buffer.write("version=" + (_version != null ? _version!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GrownCrop copyWith({String? cropName, int? cropId, String? photo, bool? isSecondaryActivity, String? cropseasonID, int? version}) {
    return GrownCrop._internal(
      id: id,
      cropName: cropName ?? this.cropName,
      cropId: cropId ?? this.cropId,
      photo: photo ?? this.photo,
      isSecondaryActivity: isSecondaryActivity ?? this.isSecondaryActivity,
      cropseasonID: cropseasonID ?? this.cropseasonID,
      version: version ?? this.version);
  }
  
  GrownCrop copyWithModelFieldValues({
    ModelFieldValue<String?>? cropName,
    ModelFieldValue<int?>? cropId,
    ModelFieldValue<String?>? photo,
    ModelFieldValue<bool>? isSecondaryActivity,
    ModelFieldValue<String>? cropseasonID,
    ModelFieldValue<int?>? version
  }) {
    return GrownCrop._internal(
      id: id,
      cropName: cropName == null ? this.cropName : cropName.value,
      cropId: cropId == null ? this.cropId : cropId.value,
      photo: photo == null ? this.photo : photo.value,
      isSecondaryActivity: isSecondaryActivity == null ? this.isSecondaryActivity : isSecondaryActivity.value,
      cropseasonID: cropseasonID == null ? this.cropseasonID : cropseasonID.value,
      version: version == null ? this.version : version.value
    );
  }
  
  GrownCrop.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _cropName = json['cropName'],
      _cropId = (json['cropId'] as num?)?.toInt(),
      _photo = json['photo'],
      _isSecondaryActivity = json['isSecondaryActivity'],
      _cropseasonID = json['cropseasonID'],
      _version = (json['version'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'cropName': _cropName, 'cropId': _cropId, 'photo': _photo, 'isSecondaryActivity': _isSecondaryActivity, 'cropseasonID': _cropseasonID, 'version': _version, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'cropName': _cropName,
    'cropId': _cropId,
    'photo': _photo,
    'isSecondaryActivity': _isSecondaryActivity,
    'cropseasonID': _cropseasonID,
    'version': _version,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<GrownCropModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<GrownCropModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CROPNAME = amplify_core.QueryField(fieldName: "cropName");
  static final CROPID = amplify_core.QueryField(fieldName: "cropId");
  static final PHOTO = amplify_core.QueryField(fieldName: "photo");
  static final ISSECONDARYACTIVITY = amplify_core.QueryField(fieldName: "isSecondaryActivity");
  static final CROPSEASONID = amplify_core.QueryField(fieldName: "cropseasonID");
  static final VERSION = amplify_core.QueryField(fieldName: "version");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GrownCrop";
    modelSchemaDefinition.pluralName = "GrownCrops";
    
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
      amplify_core.ModelIndex(fields: const ["cropseasonID"], name: "byCropSeason")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GrownCrop.CROPNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GrownCrop.CROPID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GrownCrop.PHOTO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GrownCrop.ISSECONDARYACTIVITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GrownCrop.CROPSEASONID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GrownCrop.VERSION,
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

class _GrownCropModelType extends amplify_core.ModelType<GrownCrop> {
  const _GrownCropModelType();
  
  @override
  GrownCrop fromJson(Map<String, dynamic> jsonData) {
    return GrownCrop.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'GrownCrop';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [GrownCrop] in your schema.
 */
class GrownCropModelIdentifier implements amplify_core.ModelIdentifier<GrownCrop> {
  final String id;

  /** Create an instance of GrownCropModelIdentifier using [id] the primary key. */
  const GrownCropModelIdentifier({
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
  String toString() => 'GrownCropModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is GrownCropModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}