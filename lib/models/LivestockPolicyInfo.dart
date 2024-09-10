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


/** This is an auto generated class representing the LivestockPolicyInfo type in your schema. */
class LivestockPolicyInfo extends amplify_core.Model {
  static const classType = const _LivestockPolicyInfoModelType();
  final String id;
  final String? _applicationFormPageOneImageUrl;
  final String? _applicationFormPageTwoImageUrl;
  final String? _healthCertificatePageOneImageUrl;
  final String? _healthCertificatePageTwoImageUrl;
  final String? _livestockFrontImageUrl;
  final String? _livestockBackImageUrl;
  final String? _livestockLeftImageUrl;
  final String? _livestockRightImageUrl;
  final String? _livestockWithTagImageUrl;
  final String? _tagNo;
  final int? _status;
  final String? _insurancecustomerinfoID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LivestockPolicyInfoModelIdentifier get modelIdentifier {
      return LivestockPolicyInfoModelIdentifier(
        id: id
      );
  }
  
  String? get applicationFormPageOneImageUrl {
    return _applicationFormPageOneImageUrl;
  }
  
  String? get applicationFormPageTwoImageUrl {
    return _applicationFormPageTwoImageUrl;
  }
  
  String? get healthCertificatePageOneImageUrl {
    return _healthCertificatePageOneImageUrl;
  }
  
  String? get healthCertificatePageTwoImageUrl {
    return _healthCertificatePageTwoImageUrl;
  }
  
  String? get livestockFrontImageUrl {
    return _livestockFrontImageUrl;
  }
  
  String? get livestockBackImageUrl {
    return _livestockBackImageUrl;
  }
  
  String? get livestockLeftImageUrl {
    return _livestockLeftImageUrl;
  }
  
  String? get livestockRightImageUrl {
    return _livestockRightImageUrl;
  }
  
  String? get livestockWithTagImageUrl {
    return _livestockWithTagImageUrl;
  }
  
  String? get tagNo {
    return _tagNo;
  }
  
  int? get status {
    return _status;
  }
  
  String get insurancecustomerinfoID {
    try {
      return _insurancecustomerinfoID!;
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
  
  const LivestockPolicyInfo._internal({required this.id, applicationFormPageOneImageUrl, applicationFormPageTwoImageUrl, healthCertificatePageOneImageUrl, healthCertificatePageTwoImageUrl, livestockFrontImageUrl, livestockBackImageUrl, livestockLeftImageUrl, livestockRightImageUrl, livestockWithTagImageUrl, tagNo, status, required insurancecustomerinfoID, createdAt, updatedAt}): _applicationFormPageOneImageUrl = applicationFormPageOneImageUrl, _applicationFormPageTwoImageUrl = applicationFormPageTwoImageUrl, _healthCertificatePageOneImageUrl = healthCertificatePageOneImageUrl, _healthCertificatePageTwoImageUrl = healthCertificatePageTwoImageUrl, _livestockFrontImageUrl = livestockFrontImageUrl, _livestockBackImageUrl = livestockBackImageUrl, _livestockLeftImageUrl = livestockLeftImageUrl, _livestockRightImageUrl = livestockRightImageUrl, _livestockWithTagImageUrl = livestockWithTagImageUrl, _tagNo = tagNo, _status = status, _insurancecustomerinfoID = insurancecustomerinfoID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory LivestockPolicyInfo({String? id, String? applicationFormPageOneImageUrl, String? applicationFormPageTwoImageUrl, String? healthCertificatePageOneImageUrl, String? healthCertificatePageTwoImageUrl, String? livestockFrontImageUrl, String? livestockBackImageUrl, String? livestockLeftImageUrl, String? livestockRightImageUrl, String? livestockWithTagImageUrl, String? tagNo, int? status, required String insurancecustomerinfoID}) {
    return LivestockPolicyInfo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      applicationFormPageOneImageUrl: applicationFormPageOneImageUrl,
      applicationFormPageTwoImageUrl: applicationFormPageTwoImageUrl,
      healthCertificatePageOneImageUrl: healthCertificatePageOneImageUrl,
      healthCertificatePageTwoImageUrl: healthCertificatePageTwoImageUrl,
      livestockFrontImageUrl: livestockFrontImageUrl,
      livestockBackImageUrl: livestockBackImageUrl,
      livestockLeftImageUrl: livestockLeftImageUrl,
      livestockRightImageUrl: livestockRightImageUrl,
      livestockWithTagImageUrl: livestockWithTagImageUrl,
      tagNo: tagNo,
      status: status,
      insurancecustomerinfoID: insurancecustomerinfoID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LivestockPolicyInfo &&
      id == other.id &&
      _applicationFormPageOneImageUrl == other._applicationFormPageOneImageUrl &&
      _applicationFormPageTwoImageUrl == other._applicationFormPageTwoImageUrl &&
      _healthCertificatePageOneImageUrl == other._healthCertificatePageOneImageUrl &&
      _healthCertificatePageTwoImageUrl == other._healthCertificatePageTwoImageUrl &&
      _livestockFrontImageUrl == other._livestockFrontImageUrl &&
      _livestockBackImageUrl == other._livestockBackImageUrl &&
      _livestockLeftImageUrl == other._livestockLeftImageUrl &&
      _livestockRightImageUrl == other._livestockRightImageUrl &&
      _livestockWithTagImageUrl == other._livestockWithTagImageUrl &&
      _tagNo == other._tagNo &&
      _status == other._status &&
      _insurancecustomerinfoID == other._insurancecustomerinfoID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LivestockPolicyInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("applicationFormPageOneImageUrl=" + "$_applicationFormPageOneImageUrl" + ", ");
    buffer.write("applicationFormPageTwoImageUrl=" + "$_applicationFormPageTwoImageUrl" + ", ");
    buffer.write("healthCertificatePageOneImageUrl=" + "$_healthCertificatePageOneImageUrl" + ", ");
    buffer.write("healthCertificatePageTwoImageUrl=" + "$_healthCertificatePageTwoImageUrl" + ", ");
    buffer.write("livestockFrontImageUrl=" + "$_livestockFrontImageUrl" + ", ");
    buffer.write("livestockBackImageUrl=" + "$_livestockBackImageUrl" + ", ");
    buffer.write("livestockLeftImageUrl=" + "$_livestockLeftImageUrl" + ", ");
    buffer.write("livestockRightImageUrl=" + "$_livestockRightImageUrl" + ", ");
    buffer.write("livestockWithTagImageUrl=" + "$_livestockWithTagImageUrl" + ", ");
    buffer.write("tagNo=" + "$_tagNo" + ", ");
    buffer.write("status=" + (_status != null ? _status!.toString() : "null") + ", ");
    buffer.write("insurancecustomerinfoID=" + "$_insurancecustomerinfoID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LivestockPolicyInfo copyWith({String? applicationFormPageOneImageUrl, String? applicationFormPageTwoImageUrl, String? healthCertificatePageOneImageUrl, String? healthCertificatePageTwoImageUrl, String? livestockFrontImageUrl, String? livestockBackImageUrl, String? livestockLeftImageUrl, String? livestockRightImageUrl, String? livestockWithTagImageUrl, String? tagNo, int? status, String? insurancecustomerinfoID}) {
    return LivestockPolicyInfo._internal(
      id: id,
      applicationFormPageOneImageUrl: applicationFormPageOneImageUrl ?? this.applicationFormPageOneImageUrl,
      applicationFormPageTwoImageUrl: applicationFormPageTwoImageUrl ?? this.applicationFormPageTwoImageUrl,
      healthCertificatePageOneImageUrl: healthCertificatePageOneImageUrl ?? this.healthCertificatePageOneImageUrl,
      healthCertificatePageTwoImageUrl: healthCertificatePageTwoImageUrl ?? this.healthCertificatePageTwoImageUrl,
      livestockFrontImageUrl: livestockFrontImageUrl ?? this.livestockFrontImageUrl,
      livestockBackImageUrl: livestockBackImageUrl ?? this.livestockBackImageUrl,
      livestockLeftImageUrl: livestockLeftImageUrl ?? this.livestockLeftImageUrl,
      livestockRightImageUrl: livestockRightImageUrl ?? this.livestockRightImageUrl,
      livestockWithTagImageUrl: livestockWithTagImageUrl ?? this.livestockWithTagImageUrl,
      tagNo: tagNo ?? this.tagNo,
      status: status ?? this.status,
      insurancecustomerinfoID: insurancecustomerinfoID ?? this.insurancecustomerinfoID);
  }
  
  LivestockPolicyInfo copyWithModelFieldValues({
    ModelFieldValue<String?>? applicationFormPageOneImageUrl,
    ModelFieldValue<String?>? applicationFormPageTwoImageUrl,
    ModelFieldValue<String?>? healthCertificatePageOneImageUrl,
    ModelFieldValue<String?>? healthCertificatePageTwoImageUrl,
    ModelFieldValue<String?>? livestockFrontImageUrl,
    ModelFieldValue<String?>? livestockBackImageUrl,
    ModelFieldValue<String?>? livestockLeftImageUrl,
    ModelFieldValue<String?>? livestockRightImageUrl,
    ModelFieldValue<String?>? livestockWithTagImageUrl,
    ModelFieldValue<String?>? tagNo,
    ModelFieldValue<int?>? status,
    ModelFieldValue<String>? insurancecustomerinfoID
  }) {
    return LivestockPolicyInfo._internal(
      id: id,
      applicationFormPageOneImageUrl: applicationFormPageOneImageUrl == null ? this.applicationFormPageOneImageUrl : applicationFormPageOneImageUrl.value,
      applicationFormPageTwoImageUrl: applicationFormPageTwoImageUrl == null ? this.applicationFormPageTwoImageUrl : applicationFormPageTwoImageUrl.value,
      healthCertificatePageOneImageUrl: healthCertificatePageOneImageUrl == null ? this.healthCertificatePageOneImageUrl : healthCertificatePageOneImageUrl.value,
      healthCertificatePageTwoImageUrl: healthCertificatePageTwoImageUrl == null ? this.healthCertificatePageTwoImageUrl : healthCertificatePageTwoImageUrl.value,
      livestockFrontImageUrl: livestockFrontImageUrl == null ? this.livestockFrontImageUrl : livestockFrontImageUrl.value,
      livestockBackImageUrl: livestockBackImageUrl == null ? this.livestockBackImageUrl : livestockBackImageUrl.value,
      livestockLeftImageUrl: livestockLeftImageUrl == null ? this.livestockLeftImageUrl : livestockLeftImageUrl.value,
      livestockRightImageUrl: livestockRightImageUrl == null ? this.livestockRightImageUrl : livestockRightImageUrl.value,
      livestockWithTagImageUrl: livestockWithTagImageUrl == null ? this.livestockWithTagImageUrl : livestockWithTagImageUrl.value,
      tagNo: tagNo == null ? this.tagNo : tagNo.value,
      status: status == null ? this.status : status.value,
      insurancecustomerinfoID: insurancecustomerinfoID == null ? this.insurancecustomerinfoID : insurancecustomerinfoID.value
    );
  }
  
  LivestockPolicyInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _applicationFormPageOneImageUrl = json['applicationFormPageOneImageUrl'],
      _applicationFormPageTwoImageUrl = json['applicationFormPageTwoImageUrl'],
      _healthCertificatePageOneImageUrl = json['healthCertificatePageOneImageUrl'],
      _healthCertificatePageTwoImageUrl = json['healthCertificatePageTwoImageUrl'],
      _livestockFrontImageUrl = json['livestockFrontImageUrl'],
      _livestockBackImageUrl = json['livestockBackImageUrl'],
      _livestockLeftImageUrl = json['livestockLeftImageUrl'],
      _livestockRightImageUrl = json['livestockRightImageUrl'],
      _livestockWithTagImageUrl = json['livestockWithTagImageUrl'],
      _tagNo = json['tagNo'],
      _status = (json['status'] as num?)?.toInt(),
      _insurancecustomerinfoID = json['insurancecustomerinfoID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'applicationFormPageOneImageUrl': _applicationFormPageOneImageUrl, 'applicationFormPageTwoImageUrl': _applicationFormPageTwoImageUrl, 'healthCertificatePageOneImageUrl': _healthCertificatePageOneImageUrl, 'healthCertificatePageTwoImageUrl': _healthCertificatePageTwoImageUrl, 'livestockFrontImageUrl': _livestockFrontImageUrl, 'livestockBackImageUrl': _livestockBackImageUrl, 'livestockLeftImageUrl': _livestockLeftImageUrl, 'livestockRightImageUrl': _livestockRightImageUrl, 'livestockWithTagImageUrl': _livestockWithTagImageUrl, 'tagNo': _tagNo, 'status': _status, 'insurancecustomerinfoID': _insurancecustomerinfoID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'applicationFormPageOneImageUrl': _applicationFormPageOneImageUrl,
    'applicationFormPageTwoImageUrl': _applicationFormPageTwoImageUrl,
    'healthCertificatePageOneImageUrl': _healthCertificatePageOneImageUrl,
    'healthCertificatePageTwoImageUrl': _healthCertificatePageTwoImageUrl,
    'livestockFrontImageUrl': _livestockFrontImageUrl,
    'livestockBackImageUrl': _livestockBackImageUrl,
    'livestockLeftImageUrl': _livestockLeftImageUrl,
    'livestockRightImageUrl': _livestockRightImageUrl,
    'livestockWithTagImageUrl': _livestockWithTagImageUrl,
    'tagNo': _tagNo,
    'status': _status,
    'insurancecustomerinfoID': _insurancecustomerinfoID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LivestockPolicyInfoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LivestockPolicyInfoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final APPLICATIONFORMPAGEONEIMAGEURL = amplify_core.QueryField(fieldName: "applicationFormPageOneImageUrl");
  static final APPLICATIONFORMPAGETWOIMAGEURL = amplify_core.QueryField(fieldName: "applicationFormPageTwoImageUrl");
  static final HEALTHCERTIFICATEPAGEONEIMAGEURL = amplify_core.QueryField(fieldName: "healthCertificatePageOneImageUrl");
  static final HEALTHCERTIFICATEPAGETWOIMAGEURL = amplify_core.QueryField(fieldName: "healthCertificatePageTwoImageUrl");
  static final LIVESTOCKFRONTIMAGEURL = amplify_core.QueryField(fieldName: "livestockFrontImageUrl");
  static final LIVESTOCKBACKIMAGEURL = amplify_core.QueryField(fieldName: "livestockBackImageUrl");
  static final LIVESTOCKLEFTIMAGEURL = amplify_core.QueryField(fieldName: "livestockLeftImageUrl");
  static final LIVESTOCKRIGHTIMAGEURL = amplify_core.QueryField(fieldName: "livestockRightImageUrl");
  static final LIVESTOCKWITHTAGIMAGEURL = amplify_core.QueryField(fieldName: "livestockWithTagImageUrl");
  static final TAGNO = amplify_core.QueryField(fieldName: "tagNo");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final INSURANCECUSTOMERINFOID = amplify_core.QueryField(fieldName: "insurancecustomerinfoID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LivestockPolicyInfo";
    modelSchemaDefinition.pluralName = "LivestockPolicyInfos";
    
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
      amplify_core.ModelIndex(fields: const ["insurancecustomerinfoID"], name: "byInsuranceCustomerInfo")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.APPLICATIONFORMPAGEONEIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.APPLICATIONFORMPAGETWOIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.HEALTHCERTIFICATEPAGEONEIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.HEALTHCERTIFICATEPAGETWOIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.LIVESTOCKFRONTIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.LIVESTOCKBACKIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.LIVESTOCKLEFTIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.LIVESTOCKRIGHTIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.LIVESTOCKWITHTAGIMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.TAGNO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LivestockPolicyInfo.INSURANCECUSTOMERINFOID,
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

class _LivestockPolicyInfoModelType extends amplify_core.ModelType<LivestockPolicyInfo> {
  const _LivestockPolicyInfoModelType();
  
  @override
  LivestockPolicyInfo fromJson(Map<String, dynamic> jsonData) {
    return LivestockPolicyInfo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'LivestockPolicyInfo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [LivestockPolicyInfo] in your schema.
 */
class LivestockPolicyInfoModelIdentifier implements amplify_core.ModelIdentifier<LivestockPolicyInfo> {
  final String id;

  /** Create an instance of LivestockPolicyInfoModelIdentifier using [id] the primary key. */
  const LivestockPolicyInfoModelIdentifier({
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
  String toString() => 'LivestockPolicyInfoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LivestockPolicyInfoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}