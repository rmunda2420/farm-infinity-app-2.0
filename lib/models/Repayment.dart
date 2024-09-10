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


/** This is an auto generated class representing the Repayment type in your schema. */
class Repayment extends amplify_core.Model {
  static const classType = const _RepaymentModelType();
  final String id;
  final double? _principal;
  final double? _interest;
  final double? _payment;
  final int? _month;
  final double? _principalBalance;
  final double? _amountReceived;
  final bool? _emiStatus;
  final String? _emiReceivedOn;
  final String? _emiCreditedOn;
  final String? _paymentMode;
  final String? _referenceNo;
  final String? _dueDate;
  final String? _loanID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  RepaymentModelIdentifier get modelIdentifier {
      return RepaymentModelIdentifier(
        id: id
      );
  }
  
  double? get principal {
    return _principal;
  }
  
  double? get interest {
    return _interest;
  }
  
  double? get payment {
    return _payment;
  }
  
  int? get month {
    return _month;
  }
  
  double? get principalBalance {
    return _principalBalance;
  }
  
  double? get amountReceived {
    return _amountReceived;
  }
  
  bool? get emiStatus {
    return _emiStatus;
  }
  
  String? get emiReceivedOn {
    return _emiReceivedOn;
  }
  
  String? get emiCreditedOn {
    return _emiCreditedOn;
  }
  
  String? get paymentMode {
    return _paymentMode;
  }
  
  String? get referenceNo {
    return _referenceNo;
  }
  
  String? get dueDate {
    return _dueDate;
  }
  
  String get loanID {
    try {
      return _loanID!;
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
  
  const Repayment._internal({required this.id, principal, interest, payment, month, principalBalance, amountReceived, emiStatus, emiReceivedOn, emiCreditedOn, paymentMode, referenceNo, dueDate, required loanID, createdAt, updatedAt}): _principal = principal, _interest = interest, _payment = payment, _month = month, _principalBalance = principalBalance, _amountReceived = amountReceived, _emiStatus = emiStatus, _emiReceivedOn = emiReceivedOn, _emiCreditedOn = emiCreditedOn, _paymentMode = paymentMode, _referenceNo = referenceNo, _dueDate = dueDate, _loanID = loanID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Repayment({String? id, double? principal, double? interest, double? payment, int? month, double? principalBalance, double? amountReceived, bool? emiStatus, String? emiReceivedOn, String? emiCreditedOn, String? paymentMode, String? referenceNo, String? dueDate, required String loanID}) {
    return Repayment._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      principal: principal,
      interest: interest,
      payment: payment,
      month: month,
      principalBalance: principalBalance,
      amountReceived: amountReceived,
      emiStatus: emiStatus,
      emiReceivedOn: emiReceivedOn,
      emiCreditedOn: emiCreditedOn,
      paymentMode: paymentMode,
      referenceNo: referenceNo,
      dueDate: dueDate,
      loanID: loanID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Repayment &&
      id == other.id &&
      _principal == other._principal &&
      _interest == other._interest &&
      _payment == other._payment &&
      _month == other._month &&
      _principalBalance == other._principalBalance &&
      _amountReceived == other._amountReceived &&
      _emiStatus == other._emiStatus &&
      _emiReceivedOn == other._emiReceivedOn &&
      _emiCreditedOn == other._emiCreditedOn &&
      _paymentMode == other._paymentMode &&
      _referenceNo == other._referenceNo &&
      _dueDate == other._dueDate &&
      _loanID == other._loanID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Repayment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("principal=" + (_principal != null ? _principal!.toString() : "null") + ", ");
    buffer.write("interest=" + (_interest != null ? _interest!.toString() : "null") + ", ");
    buffer.write("payment=" + (_payment != null ? _payment!.toString() : "null") + ", ");
    buffer.write("month=" + (_month != null ? _month!.toString() : "null") + ", ");
    buffer.write("principalBalance=" + (_principalBalance != null ? _principalBalance!.toString() : "null") + ", ");
    buffer.write("amountReceived=" + (_amountReceived != null ? _amountReceived!.toString() : "null") + ", ");
    buffer.write("emiStatus=" + (_emiStatus != null ? _emiStatus!.toString() : "null") + ", ");
    buffer.write("emiReceivedOn=" + "$_emiReceivedOn" + ", ");
    buffer.write("emiCreditedOn=" + "$_emiCreditedOn" + ", ");
    buffer.write("paymentMode=" + "$_paymentMode" + ", ");
    buffer.write("referenceNo=" + "$_referenceNo" + ", ");
    buffer.write("dueDate=" + "$_dueDate" + ", ");
    buffer.write("loanID=" + "$_loanID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Repayment copyWith({double? principal, double? interest, double? payment, int? month, double? principalBalance, double? amountReceived, bool? emiStatus, String? emiReceivedOn, String? emiCreditedOn, String? paymentMode, String? referenceNo, String? dueDate, String? loanID}) {
    return Repayment._internal(
      id: id,
      principal: principal ?? this.principal,
      interest: interest ?? this.interest,
      payment: payment ?? this.payment,
      month: month ?? this.month,
      principalBalance: principalBalance ?? this.principalBalance,
      amountReceived: amountReceived ?? this.amountReceived,
      emiStatus: emiStatus ?? this.emiStatus,
      emiReceivedOn: emiReceivedOn ?? this.emiReceivedOn,
      emiCreditedOn: emiCreditedOn ?? this.emiCreditedOn,
      paymentMode: paymentMode ?? this.paymentMode,
      referenceNo: referenceNo ?? this.referenceNo,
      dueDate: dueDate ?? this.dueDate,
      loanID: loanID ?? this.loanID);
  }
  
  Repayment copyWithModelFieldValues({
    ModelFieldValue<double?>? principal,
    ModelFieldValue<double?>? interest,
    ModelFieldValue<double?>? payment,
    ModelFieldValue<int?>? month,
    ModelFieldValue<double?>? principalBalance,
    ModelFieldValue<double?>? amountReceived,
    ModelFieldValue<bool?>? emiStatus,
    ModelFieldValue<String?>? emiReceivedOn,
    ModelFieldValue<String?>? emiCreditedOn,
    ModelFieldValue<String?>? paymentMode,
    ModelFieldValue<String?>? referenceNo,
    ModelFieldValue<String?>? dueDate,
    ModelFieldValue<String>? loanID
  }) {
    return Repayment._internal(
      id: id,
      principal: principal == null ? this.principal : principal.value,
      interest: interest == null ? this.interest : interest.value,
      payment: payment == null ? this.payment : payment.value,
      month: month == null ? this.month : month.value,
      principalBalance: principalBalance == null ? this.principalBalance : principalBalance.value,
      amountReceived: amountReceived == null ? this.amountReceived : amountReceived.value,
      emiStatus: emiStatus == null ? this.emiStatus : emiStatus.value,
      emiReceivedOn: emiReceivedOn == null ? this.emiReceivedOn : emiReceivedOn.value,
      emiCreditedOn: emiCreditedOn == null ? this.emiCreditedOn : emiCreditedOn.value,
      paymentMode: paymentMode == null ? this.paymentMode : paymentMode.value,
      referenceNo: referenceNo == null ? this.referenceNo : referenceNo.value,
      dueDate: dueDate == null ? this.dueDate : dueDate.value,
      loanID: loanID == null ? this.loanID : loanID.value
    );
  }
  
  Repayment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _principal = (json['principal'] as num?)?.toDouble(),
      _interest = (json['interest'] as num?)?.toDouble(),
      _payment = (json['payment'] as num?)?.toDouble(),
      _month = (json['month'] as num?)?.toInt(),
      _principalBalance = (json['principalBalance'] as num?)?.toDouble(),
      _amountReceived = (json['amountReceived'] as num?)?.toDouble(),
      _emiStatus = json['emiStatus'],
      _emiReceivedOn = json['emiReceivedOn'],
      _emiCreditedOn = json['emiCreditedOn'],
      _paymentMode = json['paymentMode'],
      _referenceNo = json['referenceNo'],
      _dueDate = json['dueDate'],
      _loanID = json['loanID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'principal': _principal, 'interest': _interest, 'payment': _payment, 'month': _month, 'principalBalance': _principalBalance, 'amountReceived': _amountReceived, 'emiStatus': _emiStatus, 'emiReceivedOn': _emiReceivedOn, 'emiCreditedOn': _emiCreditedOn, 'paymentMode': _paymentMode, 'referenceNo': _referenceNo, 'dueDate': _dueDate, 'loanID': _loanID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'principal': _principal,
    'interest': _interest,
    'payment': _payment,
    'month': _month,
    'principalBalance': _principalBalance,
    'amountReceived': _amountReceived,
    'emiStatus': _emiStatus,
    'emiReceivedOn': _emiReceivedOn,
    'emiCreditedOn': _emiCreditedOn,
    'paymentMode': _paymentMode,
    'referenceNo': _referenceNo,
    'dueDate': _dueDate,
    'loanID': _loanID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<RepaymentModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<RepaymentModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PRINCIPAL = amplify_core.QueryField(fieldName: "principal");
  static final INTEREST = amplify_core.QueryField(fieldName: "interest");
  static final PAYMENT = amplify_core.QueryField(fieldName: "payment");
  static final MONTH = amplify_core.QueryField(fieldName: "month");
  static final PRINCIPALBALANCE = amplify_core.QueryField(fieldName: "principalBalance");
  static final AMOUNTRECEIVED = amplify_core.QueryField(fieldName: "amountReceived");
  static final EMISTATUS = amplify_core.QueryField(fieldName: "emiStatus");
  static final EMIRECEIVEDON = amplify_core.QueryField(fieldName: "emiReceivedOn");
  static final EMICREDITEDON = amplify_core.QueryField(fieldName: "emiCreditedOn");
  static final PAYMENTMODE = amplify_core.QueryField(fieldName: "paymentMode");
  static final REFERENCENO = amplify_core.QueryField(fieldName: "referenceNo");
  static final DUEDATE = amplify_core.QueryField(fieldName: "dueDate");
  static final LOANID = amplify_core.QueryField(fieldName: "loanID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Repayment";
    modelSchemaDefinition.pluralName = "Repayments";
    
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
      amplify_core.ModelIndex(fields: const ["loanID"], name: "byLoan")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.PRINCIPAL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.INTEREST,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.PAYMENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.MONTH,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.PRINCIPALBALANCE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.AMOUNTRECEIVED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.EMISTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.EMIRECEIVEDON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.EMICREDITEDON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.PAYMENTMODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.REFERENCENO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.DUEDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Repayment.LOANID,
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

class _RepaymentModelType extends amplify_core.ModelType<Repayment> {
  const _RepaymentModelType();
  
  @override
  Repayment fromJson(Map<String, dynamic> jsonData) {
    return Repayment.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Repayment';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Repayment] in your schema.
 */
class RepaymentModelIdentifier implements amplify_core.ModelIdentifier<Repayment> {
  final String id;

  /** Create an instance of RepaymentModelIdentifier using [id] the primary key. */
  const RepaymentModelIdentifier({
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
  String toString() => 'RepaymentModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is RepaymentModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}