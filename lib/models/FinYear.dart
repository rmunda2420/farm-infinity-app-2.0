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


/** This is an auto generated class representing the FinYear type in your schema. */
class FinYear extends amplify_core.Model {
  static const classType = const _FinYearModelType();
  final String id;
  final String? _financialYear;
  final String? _startDate;
  final String? _endDate;
  final bool? _isCurrent;
  final AppVersionInterval? _FinYearToAppVersionInterval;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _finYearFinYearToAppVersionIntervalId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FinYearModelIdentifier get modelIdentifier {
      return FinYearModelIdentifier(
        id: id
      );
  }
  
  String? get financialYear {
    return _financialYear;
  }
  
  String? get startDate {
    return _startDate;
  }
  
  String? get endDate {
    return _endDate;
  }
  
  bool? get isCurrent {
    return _isCurrent;
  }
  
  AppVersionInterval? get FinYearToAppVersionInterval {
    return _FinYearToAppVersionInterval;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get finYearFinYearToAppVersionIntervalId {
    return _finYearFinYearToAppVersionIntervalId;
  }
  
  const FinYear._internal({required this.id, financialYear, startDate, endDate, isCurrent, FinYearToAppVersionInterval, createdAt, updatedAt, finYearFinYearToAppVersionIntervalId}): _financialYear = financialYear, _startDate = startDate, _endDate = endDate, _isCurrent = isCurrent, _FinYearToAppVersionInterval = FinYearToAppVersionInterval, _createdAt = createdAt, _updatedAt = updatedAt, _finYearFinYearToAppVersionIntervalId = finYearFinYearToAppVersionIntervalId;
  
  factory FinYear({String? id, String? financialYear, String? startDate, String? endDate, bool? isCurrent, AppVersionInterval? FinYearToAppVersionInterval, String? finYearFinYearToAppVersionIntervalId}) {
    return FinYear._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      financialYear: financialYear,
      startDate: startDate,
      endDate: endDate,
      isCurrent: isCurrent,
      FinYearToAppVersionInterval: FinYearToAppVersionInterval,
      finYearFinYearToAppVersionIntervalId: finYearFinYearToAppVersionIntervalId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FinYear &&
      id == other.id &&
      _financialYear == other._financialYear &&
      _startDate == other._startDate &&
      _endDate == other._endDate &&
      _isCurrent == other._isCurrent &&
      _FinYearToAppVersionInterval == other._FinYearToAppVersionInterval &&
      _finYearFinYearToAppVersionIntervalId == other._finYearFinYearToAppVersionIntervalId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FinYear {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("financialYear=" + "$_financialYear" + ", ");
    buffer.write("startDate=" + "$_startDate" + ", ");
    buffer.write("endDate=" + "$_endDate" + ", ");
    buffer.write("isCurrent=" + (_isCurrent != null ? _isCurrent!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("finYearFinYearToAppVersionIntervalId=" + "$_finYearFinYearToAppVersionIntervalId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FinYear copyWith({String? financialYear, String? startDate, String? endDate, bool? isCurrent, AppVersionInterval? FinYearToAppVersionInterval, String? finYearFinYearToAppVersionIntervalId}) {
    return FinYear._internal(
      id: id,
      financialYear: financialYear ?? this.financialYear,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrent: isCurrent ?? this.isCurrent,
      FinYearToAppVersionInterval: FinYearToAppVersionInterval ?? this.FinYearToAppVersionInterval,
      finYearFinYearToAppVersionIntervalId: finYearFinYearToAppVersionIntervalId ?? this.finYearFinYearToAppVersionIntervalId);
  }
  
  FinYear copyWithModelFieldValues({
    ModelFieldValue<String?>? financialYear,
    ModelFieldValue<String?>? startDate,
    ModelFieldValue<String?>? endDate,
    ModelFieldValue<bool?>? isCurrent,
    ModelFieldValue<AppVersionInterval?>? FinYearToAppVersionInterval,
    ModelFieldValue<String?>? finYearFinYearToAppVersionIntervalId
  }) {
    return FinYear._internal(
      id: id,
      financialYear: financialYear == null ? this.financialYear : financialYear.value,
      startDate: startDate == null ? this.startDate : startDate.value,
      endDate: endDate == null ? this.endDate : endDate.value,
      isCurrent: isCurrent == null ? this.isCurrent : isCurrent.value,
      FinYearToAppVersionInterval: FinYearToAppVersionInterval == null ? this.FinYearToAppVersionInterval : FinYearToAppVersionInterval.value,
      finYearFinYearToAppVersionIntervalId: finYearFinYearToAppVersionIntervalId == null ? this.finYearFinYearToAppVersionIntervalId : finYearFinYearToAppVersionIntervalId.value
    );
  }
  
  FinYear.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _financialYear = json['financialYear'],
      _startDate = json['startDate'],
      _endDate = json['endDate'],
      _isCurrent = json['isCurrent'],
      _FinYearToAppVersionInterval = json['FinYearToAppVersionInterval'] != null
        ? json['FinYearToAppVersionInterval']['serializedData'] != null
          ? AppVersionInterval.fromJson(new Map<String, dynamic>.from(json['FinYearToAppVersionInterval']['serializedData']))
          : AppVersionInterval.fromJson(new Map<String, dynamic>.from(json['FinYearToAppVersionInterval']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _finYearFinYearToAppVersionIntervalId = json['finYearFinYearToAppVersionIntervalId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'financialYear': _financialYear, 'startDate': _startDate, 'endDate': _endDate, 'isCurrent': _isCurrent, 'FinYearToAppVersionInterval': _FinYearToAppVersionInterval?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'finYearFinYearToAppVersionIntervalId': _finYearFinYearToAppVersionIntervalId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'financialYear': _financialYear,
    'startDate': _startDate,
    'endDate': _endDate,
    'isCurrent': _isCurrent,
    'FinYearToAppVersionInterval': _FinYearToAppVersionInterval,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'finYearFinYearToAppVersionIntervalId': _finYearFinYearToAppVersionIntervalId
  };

  static final amplify_core.QueryModelIdentifier<FinYearModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FinYearModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FINANCIALYEAR = amplify_core.QueryField(fieldName: "financialYear");
  static final STARTDATE = amplify_core.QueryField(fieldName: "startDate");
  static final ENDDATE = amplify_core.QueryField(fieldName: "endDate");
  static final ISCURRENT = amplify_core.QueryField(fieldName: "isCurrent");
  static final FINYEARTOAPPVERSIONINTERVAL = amplify_core.QueryField(
    fieldName: "FinYearToAppVersionInterval",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AppVersionInterval'));
  static final FINYEARFINYEARTOAPPVERSIONINTERVALID = amplify_core.QueryField(fieldName: "finYearFinYearToAppVersionIntervalId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FinYear";
    modelSchemaDefinition.pluralName = "FinYears";
    
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
      key: FinYear.FINANCIALYEAR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FinYear.STARTDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FinYear.ENDDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FinYear.ISCURRENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: FinYear.FINYEARTOAPPVERSIONINTERVAL,
      isRequired: false,
      ofModelName: 'AppVersionInterval',
      associatedKey: AppVersionInterval.ID
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
      key: FinYear.FINYEARFINYEARTOAPPVERSIONINTERVALID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _FinYearModelType extends amplify_core.ModelType<FinYear> {
  const _FinYearModelType();
  
  @override
  FinYear fromJson(Map<String, dynamic> jsonData) {
    return FinYear.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FinYear';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FinYear] in your schema.
 */
class FinYearModelIdentifier implements amplify_core.ModelIdentifier<FinYear> {
  final String id;

  /** Create an instance of FinYearModelIdentifier using [id] the primary key. */
  const FinYearModelIdentifier({
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
  String toString() => 'FinYearModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FinYearModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}