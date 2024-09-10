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


/** This is an auto generated class representing the Disbursal type in your schema. */
class Disbursal extends amplify_core.Model {
  static const classType = const _DisbursalModelType();
  final String id;
  final String? _repaymentStartMonth;
  final String? _disbursalDate;
  final String? _remarks;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  DisbursalModelIdentifier get modelIdentifier {
      return DisbursalModelIdentifier(
        id: id
      );
  }
  
  String? get repaymentStartMonth {
    return _repaymentStartMonth;
  }
  
  String? get disbursalDate {
    return _disbursalDate;
  }
  
  String? get remarks {
    return _remarks;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Disbursal._internal({required this.id, repaymentStartMonth, disbursalDate, remarks, createdAt, updatedAt}): _repaymentStartMonth = repaymentStartMonth, _disbursalDate = disbursalDate, _remarks = remarks, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Disbursal({String? id, String? repaymentStartMonth, String? disbursalDate, String? remarks}) {
    return Disbursal._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      repaymentStartMonth: repaymentStartMonth,
      disbursalDate: disbursalDate,
      remarks: remarks);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Disbursal &&
      id == other.id &&
      _repaymentStartMonth == other._repaymentStartMonth &&
      _disbursalDate == other._disbursalDate &&
      _remarks == other._remarks;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Disbursal {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("repaymentStartMonth=" + "$_repaymentStartMonth" + ", ");
    buffer.write("disbursalDate=" + "$_disbursalDate" + ", ");
    buffer.write("remarks=" + "$_remarks" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Disbursal copyWith({String? repaymentStartMonth, String? disbursalDate, String? remarks}) {
    return Disbursal._internal(
      id: id,
      repaymentStartMonth: repaymentStartMonth ?? this.repaymentStartMonth,
      disbursalDate: disbursalDate ?? this.disbursalDate,
      remarks: remarks ?? this.remarks);
  }
  
  Disbursal copyWithModelFieldValues({
    ModelFieldValue<String?>? repaymentStartMonth,
    ModelFieldValue<String?>? disbursalDate,
    ModelFieldValue<String?>? remarks
  }) {
    return Disbursal._internal(
      id: id,
      repaymentStartMonth: repaymentStartMonth == null ? this.repaymentStartMonth : repaymentStartMonth.value,
      disbursalDate: disbursalDate == null ? this.disbursalDate : disbursalDate.value,
      remarks: remarks == null ? this.remarks : remarks.value
    );
  }
  
  Disbursal.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _repaymentStartMonth = json['repaymentStartMonth'],
      _disbursalDate = json['disbursalDate'],
      _remarks = json['remarks'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'repaymentStartMonth': _repaymentStartMonth, 'disbursalDate': _disbursalDate, 'remarks': _remarks, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'repaymentStartMonth': _repaymentStartMonth,
    'disbursalDate': _disbursalDate,
    'remarks': _remarks,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<DisbursalModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<DisbursalModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final REPAYMENTSTARTMONTH = amplify_core.QueryField(fieldName: "repaymentStartMonth");
  static final DISBURSALDATE = amplify_core.QueryField(fieldName: "disbursalDate");
  static final REMARKS = amplify_core.QueryField(fieldName: "remarks");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Disbursal";
    modelSchemaDefinition.pluralName = "Disbursals";
    
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
      key: Disbursal.REPAYMENTSTARTMONTH,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Disbursal.DISBURSALDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Disbursal.REMARKS,
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

class _DisbursalModelType extends amplify_core.ModelType<Disbursal> {
  const _DisbursalModelType();
  
  @override
  Disbursal fromJson(Map<String, dynamic> jsonData) {
    return Disbursal.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Disbursal';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Disbursal] in your schema.
 */
class DisbursalModelIdentifier implements amplify_core.ModelIdentifier<Disbursal> {
  final String id;

  /** Create an instance of DisbursalModelIdentifier using [id] the primary key. */
  const DisbursalModelIdentifier({
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
  String toString() => 'DisbursalModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is DisbursalModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}