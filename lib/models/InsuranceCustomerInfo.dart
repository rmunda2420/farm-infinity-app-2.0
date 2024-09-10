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


/** This is an auto generated class representing the InsuranceCustomerInfo type in your schema. */
class InsuranceCustomerInfo extends amplify_core.Model {
  static const classType = const _InsuranceCustomerInfoModelType();
  final String id;
  final String? _name;
  final String? _phoneNo;
  final String? _village;
  final String? _poiType;
  final String? _poiNumber;
  final String? _poiImageFrontUrl;
  final String? _poiImageBackUrl;
  final String? _poaType;
  final String? _poaNumber;
  final String? _poaImageFrontUrl;
  final String? _poaImageBackUrl;
  final List<LivestockPolicyInfo>? _InsCustInfoToCustLivstkPolInfos;
  final int? _poiTypeId;
  final int? _poaTypeId;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  InsuranceCustomerInfoModelIdentifier get modelIdentifier {
      return InsuranceCustomerInfoModelIdentifier(
        id: id
      );
  }
  
  String? get name {
    return _name;
  }
  
  String? get phoneNo {
    return _phoneNo;
  }
  
  String? get village {
    return _village;
  }
  
  String? get poiType {
    return _poiType;
  }
  
  String? get poiNumber {
    return _poiNumber;
  }
  
  String? get poiImageFrontUrl {
    return _poiImageFrontUrl;
  }
  
  String? get poiImageBackUrl {
    return _poiImageBackUrl;
  }
  
  String? get poaType {
    return _poaType;
  }
  
  String? get poaNumber {
    return _poaNumber;
  }
  
  String? get poaImageFrontUrl {
    return _poaImageFrontUrl;
  }
  
  String? get poaImageBackUrl {
    return _poaImageBackUrl;
  }
  
  List<LivestockPolicyInfo>? get InsCustInfoToCustLivstkPolInfos {
    return _InsCustInfoToCustLivstkPolInfos;
  }
  
  int? get poiTypeId {
    return _poiTypeId;
  }
  
  int? get poaTypeId {
    return _poaTypeId;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const InsuranceCustomerInfo._internal({required this.id, name, phoneNo, village, poiType, poiNumber, poiImageFrontUrl, poiImageBackUrl, poaType, poaNumber, poaImageFrontUrl, poaImageBackUrl, InsCustInfoToCustLivstkPolInfos, poiTypeId, poaTypeId, createdAt, updatedAt}): _name = name, _phoneNo = phoneNo, _village = village, _poiType = poiType, _poiNumber = poiNumber, _poiImageFrontUrl = poiImageFrontUrl, _poiImageBackUrl = poiImageBackUrl, _poaType = poaType, _poaNumber = poaNumber, _poaImageFrontUrl = poaImageFrontUrl, _poaImageBackUrl = poaImageBackUrl, _InsCustInfoToCustLivstkPolInfos = InsCustInfoToCustLivstkPolInfos, _poiTypeId = poiTypeId, _poaTypeId = poaTypeId, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory InsuranceCustomerInfo({String? id, String? name, String? phoneNo, String? village, String? poiType, String? poiNumber, String? poiImageFrontUrl, String? poiImageBackUrl, String? poaType, String? poaNumber, String? poaImageFrontUrl, String? poaImageBackUrl, List<LivestockPolicyInfo>? InsCustInfoToCustLivstkPolInfos, int? poiTypeId, int? poaTypeId}) {
    return InsuranceCustomerInfo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      phoneNo: phoneNo,
      village: village,
      poiType: poiType,
      poiNumber: poiNumber,
      poiImageFrontUrl: poiImageFrontUrl,
      poiImageBackUrl: poiImageBackUrl,
      poaType: poaType,
      poaNumber: poaNumber,
      poaImageFrontUrl: poaImageFrontUrl,
      poaImageBackUrl: poaImageBackUrl,
      InsCustInfoToCustLivstkPolInfos: InsCustInfoToCustLivstkPolInfos != null ? List<LivestockPolicyInfo>.unmodifiable(InsCustInfoToCustLivstkPolInfos) : InsCustInfoToCustLivstkPolInfos,
      poiTypeId: poiTypeId,
      poaTypeId: poaTypeId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InsuranceCustomerInfo &&
      id == other.id &&
      _name == other._name &&
      _phoneNo == other._phoneNo &&
      _village == other._village &&
      _poiType == other._poiType &&
      _poiNumber == other._poiNumber &&
      _poiImageFrontUrl == other._poiImageFrontUrl &&
      _poiImageBackUrl == other._poiImageBackUrl &&
      _poaType == other._poaType &&
      _poaNumber == other._poaNumber &&
      _poaImageFrontUrl == other._poaImageFrontUrl &&
      _poaImageBackUrl == other._poaImageBackUrl &&
      DeepCollectionEquality().equals(_InsCustInfoToCustLivstkPolInfos, other._InsCustInfoToCustLivstkPolInfos) &&
      _poiTypeId == other._poiTypeId &&
      _poaTypeId == other._poaTypeId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("InsuranceCustomerInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("phoneNo=" + "$_phoneNo" + ", ");
    buffer.write("village=" + "$_village" + ", ");
    buffer.write("poiType=" + "$_poiType" + ", ");
    buffer.write("poiNumber=" + "$_poiNumber" + ", ");
    buffer.write("poiImageFrontUrl=" + "$_poiImageFrontUrl" + ", ");
    buffer.write("poiImageBackUrl=" + "$_poiImageBackUrl" + ", ");
    buffer.write("poaType=" + "$_poaType" + ", ");
    buffer.write("poaNumber=" + "$_poaNumber" + ", ");
    buffer.write("poaImageFrontUrl=" + "$_poaImageFrontUrl" + ", ");
    buffer.write("poaImageBackUrl=" + "$_poaImageBackUrl" + ", ");
    buffer.write("poiTypeId=" + (_poiTypeId != null ? _poiTypeId!.toString() : "null") + ", ");
    buffer.write("poaTypeId=" + (_poaTypeId != null ? _poaTypeId!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  InsuranceCustomerInfo copyWith({String? name, String? phoneNo, String? village, String? poiType, String? poiNumber, String? poiImageFrontUrl, String? poiImageBackUrl, String? poaType, String? poaNumber, String? poaImageFrontUrl, String? poaImageBackUrl, List<LivestockPolicyInfo>? InsCustInfoToCustLivstkPolInfos, int? poiTypeId, int? poaTypeId}) {
    return InsuranceCustomerInfo._internal(
      id: id,
      name: name ?? this.name,
      phoneNo: phoneNo ?? this.phoneNo,
      village: village ?? this.village,
      poiType: poiType ?? this.poiType,
      poiNumber: poiNumber ?? this.poiNumber,
      poiImageFrontUrl: poiImageFrontUrl ?? this.poiImageFrontUrl,
      poiImageBackUrl: poiImageBackUrl ?? this.poiImageBackUrl,
      poaType: poaType ?? this.poaType,
      poaNumber: poaNumber ?? this.poaNumber,
      poaImageFrontUrl: poaImageFrontUrl ?? this.poaImageFrontUrl,
      poaImageBackUrl: poaImageBackUrl ?? this.poaImageBackUrl,
      InsCustInfoToCustLivstkPolInfos: InsCustInfoToCustLivstkPolInfos ?? this.InsCustInfoToCustLivstkPolInfos,
      poiTypeId: poiTypeId ?? this.poiTypeId,
      poaTypeId: poaTypeId ?? this.poaTypeId);
  }
  
  InsuranceCustomerInfo copyWithModelFieldValues({
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? phoneNo,
    ModelFieldValue<String?>? village,
    ModelFieldValue<String?>? poiType,
    ModelFieldValue<String?>? poiNumber,
    ModelFieldValue<String?>? poiImageFrontUrl,
    ModelFieldValue<String?>? poiImageBackUrl,
    ModelFieldValue<String?>? poaType,
    ModelFieldValue<String?>? poaNumber,
    ModelFieldValue<String?>? poaImageFrontUrl,
    ModelFieldValue<String?>? poaImageBackUrl,
    ModelFieldValue<List<LivestockPolicyInfo>?>? InsCustInfoToCustLivstkPolInfos,
    ModelFieldValue<int?>? poiTypeId,
    ModelFieldValue<int?>? poaTypeId
  }) {
    return InsuranceCustomerInfo._internal(
      id: id,
      name: name == null ? this.name : name.value,
      phoneNo: phoneNo == null ? this.phoneNo : phoneNo.value,
      village: village == null ? this.village : village.value,
      poiType: poiType == null ? this.poiType : poiType.value,
      poiNumber: poiNumber == null ? this.poiNumber : poiNumber.value,
      poiImageFrontUrl: poiImageFrontUrl == null ? this.poiImageFrontUrl : poiImageFrontUrl.value,
      poiImageBackUrl: poiImageBackUrl == null ? this.poiImageBackUrl : poiImageBackUrl.value,
      poaType: poaType == null ? this.poaType : poaType.value,
      poaNumber: poaNumber == null ? this.poaNumber : poaNumber.value,
      poaImageFrontUrl: poaImageFrontUrl == null ? this.poaImageFrontUrl : poaImageFrontUrl.value,
      poaImageBackUrl: poaImageBackUrl == null ? this.poaImageBackUrl : poaImageBackUrl.value,
      InsCustInfoToCustLivstkPolInfos: InsCustInfoToCustLivstkPolInfos == null ? this.InsCustInfoToCustLivstkPolInfos : InsCustInfoToCustLivstkPolInfos.value,
      poiTypeId: poiTypeId == null ? this.poiTypeId : poiTypeId.value,
      poaTypeId: poaTypeId == null ? this.poaTypeId : poaTypeId.value
    );
  }
  
  InsuranceCustomerInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _phoneNo = json['phoneNo'],
      _village = json['village'],
      _poiType = json['poiType'],
      _poiNumber = json['poiNumber'],
      _poiImageFrontUrl = json['poiImageFrontUrl'],
      _poiImageBackUrl = json['poiImageBackUrl'],
      _poaType = json['poaType'],
      _poaNumber = json['poaNumber'],
      _poaImageFrontUrl = json['poaImageFrontUrl'],
      _poaImageBackUrl = json['poaImageBackUrl'],
      _InsCustInfoToCustLivstkPolInfos = json['InsCustInfoToCustLivstkPolInfos']  is Map
        ? (json['InsCustInfoToCustLivstkPolInfos']['items'] is List
          ? (json['InsCustInfoToCustLivstkPolInfos']['items'] as List)
              .where((e) => e != null)
              .map((e) => LivestockPolicyInfo.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['InsCustInfoToCustLivstkPolInfos'] is List
          ? (json['InsCustInfoToCustLivstkPolInfos'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => LivestockPolicyInfo.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _poiTypeId = (json['poiTypeId'] as num?)?.toInt(),
      _poaTypeId = (json['poaTypeId'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'phoneNo': _phoneNo, 'village': _village, 'poiType': _poiType, 'poiNumber': _poiNumber, 'poiImageFrontUrl': _poiImageFrontUrl, 'poiImageBackUrl': _poiImageBackUrl, 'poaType': _poaType, 'poaNumber': _poaNumber, 'poaImageFrontUrl': _poaImageFrontUrl, 'poaImageBackUrl': _poaImageBackUrl, 'InsCustInfoToCustLivstkPolInfos': _InsCustInfoToCustLivstkPolInfos?.map((LivestockPolicyInfo? e) => e?.toJson()).toList(), 'poiTypeId': _poiTypeId, 'poaTypeId': _poaTypeId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'phoneNo': _phoneNo,
    'village': _village,
    'poiType': _poiType,
    'poiNumber': _poiNumber,
    'poiImageFrontUrl': _poiImageFrontUrl,
    'poiImageBackUrl': _poiImageBackUrl,
    'poaType': _poaType,
    'poaNumber': _poaNumber,
    'poaImageFrontUrl': _poaImageFrontUrl,
    'poaImageBackUrl': _poaImageBackUrl,
    'InsCustInfoToCustLivstkPolInfos': _InsCustInfoToCustLivstkPolInfos,
    'poiTypeId': _poiTypeId,
    'poaTypeId': _poaTypeId,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<InsuranceCustomerInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<InsuranceCustomerInfoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final PHONENO = amplify_core.QueryField(fieldName: "phoneNo");
  static final VILLAGE = amplify_core.QueryField(fieldName: "village");
  static final POITYPE = amplify_core.QueryField(fieldName: "poiType");
  static final POINUMBER = amplify_core.QueryField(fieldName: "poiNumber");
  static final POIIMAGEFRONTURL = amplify_core.QueryField(fieldName: "poiImageFrontUrl");
  static final POIIMAGEBACKURL = amplify_core.QueryField(fieldName: "poiImageBackUrl");
  static final POATYPE = amplify_core.QueryField(fieldName: "poaType");
  static final POANUMBER = amplify_core.QueryField(fieldName: "poaNumber");
  static final POAIMAGEFRONTURL = amplify_core.QueryField(fieldName: "poaImageFrontUrl");
  static final POAIMAGEBACKURL = amplify_core.QueryField(fieldName: "poaImageBackUrl");
  static final INSCUSTINFOTOCUSTLIVSTKPOLINFOS = amplify_core.QueryField(
    fieldName: "InsCustInfoToCustLivstkPolInfos",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'LivestockPolicyInfo'));
  static final POITYPEID = amplify_core.QueryField(fieldName: "poiTypeId");
  static final POATYPEID = amplify_core.QueryField(fieldName: "poaTypeId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "InsuranceCustomerInfo";
    modelSchemaDefinition.pluralName = "InsuranceCustomerInfos";
    
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
      key: InsuranceCustomerInfo.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.PHONENO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.VILLAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POITYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POINUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POIIMAGEFRONTURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POIIMAGEBACKURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POATYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POANUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POAIMAGEFRONTURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POAIMAGEBACKURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: InsuranceCustomerInfo.INSCUSTINFOTOCUSTLIVSTKPOLINFOS,
      isRequired: false,
      ofModelName: 'LivestockPolicyInfo',
      associatedKey: LivestockPolicyInfo.INSURANCECUSTOMERINFOID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POITYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: InsuranceCustomerInfo.POATYPEID,
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

class _InsuranceCustomerInfoModelType extends amplify_core.ModelType<InsuranceCustomerInfo> {
  const _InsuranceCustomerInfoModelType();
  
  @override
  InsuranceCustomerInfo fromJson(Map<String, dynamic> jsonData) {
    return InsuranceCustomerInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'InsuranceCustomerInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [InsuranceCustomerInfo] in your schema.
 */
class InsuranceCustomerInfoModelIdentifier implements amplify_core.ModelIdentifier<InsuranceCustomerInfo> {
  final String id;

  /** Create an instance of InsuranceCustomerInfoModelIdentifier using [id] the primary key. */
  const InsuranceCustomerInfoModelIdentifier({
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
  String toString() => 'InsuranceCustomerInfoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is InsuranceCustomerInfoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}