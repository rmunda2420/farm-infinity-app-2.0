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


/** This is an auto generated class representing the PaymentDetail type in your schema. */
class PaymentDetail extends amplify_core.Model {
  static const classType = const _PaymentDetailModelType();
  final String id;
  final double? _amount;
  final bool? _emiStatus;
  final String? _emiReceivedOn;
  final String? _emiCreditedOn;
  final String? _paymentMode;
  final String? _referenceNo;
  final String? _loanID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PaymentDetailModelIdentifier get modelIdentifier {
      return PaymentDetailModelIdentifier(
        id: id
      );
  }
  
  double? get amount {
    return _amount;
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
  
  const PaymentDetail._internal({required this.id, amount, emiStatus, emiReceivedOn, emiCreditedOn, paymentMode, referenceNo, required loanID, createdAt, updatedAt}): _amount = amount, _emiStatus = emiStatus, _emiReceivedOn = emiReceivedOn, _emiCreditedOn = emiCreditedOn, _paymentMode = paymentMode, _referenceNo = referenceNo, _loanID = loanID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PaymentDetail({String? id, double? amount, bool? emiStatus, String? emiReceivedOn, String? emiCreditedOn, String? paymentMode, String? referenceNo, required String loanID}) {
    return PaymentDetail._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      amount: amount,
      emiStatus: emiStatus,
      emiReceivedOn: emiReceivedOn,
      emiCreditedOn: emiCreditedOn,
      paymentMode: paymentMode,
      referenceNo: referenceNo,
      loanID: loanID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentDetail &&
      id == other.id &&
      _amount == other._amount &&
      _emiStatus == other._emiStatus &&
      _emiReceivedOn == other._emiReceivedOn &&
      _emiCreditedOn == other._emiCreditedOn &&
      _paymentMode == other._paymentMode &&
      _referenceNo == other._referenceNo &&
      _loanID == other._loanID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PaymentDetail {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("emiStatus=" + (_emiStatus != null ? _emiStatus!.toString() : "null") + ", ");
    buffer.write("emiReceivedOn=" + "$_emiReceivedOn" + ", ");
    buffer.write("emiCreditedOn=" + "$_emiCreditedOn" + ", ");
    buffer.write("paymentMode=" + "$_paymentMode" + ", ");
    buffer.write("referenceNo=" + "$_referenceNo" + ", ");
    buffer.write("loanID=" + "$_loanID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PaymentDetail copyWith({double? amount, bool? emiStatus, String? emiReceivedOn, String? emiCreditedOn, String? paymentMode, String? referenceNo, String? loanID}) {
    return PaymentDetail._internal(
      id: id,
      amount: amount ?? this.amount,
      emiStatus: emiStatus ?? this.emiStatus,
      emiReceivedOn: emiReceivedOn ?? this.emiReceivedOn,
      emiCreditedOn: emiCreditedOn ?? this.emiCreditedOn,
      paymentMode: paymentMode ?? this.paymentMode,
      referenceNo: referenceNo ?? this.referenceNo,
      loanID: loanID ?? this.loanID);
  }
  
  PaymentDetail copyWithModelFieldValues({
    ModelFieldValue<double?>? amount,
    ModelFieldValue<bool?>? emiStatus,
    ModelFieldValue<String?>? emiReceivedOn,
    ModelFieldValue<String?>? emiCreditedOn,
    ModelFieldValue<String?>? paymentMode,
    ModelFieldValue<String?>? referenceNo,
    ModelFieldValue<String>? loanID
  }) {
    return PaymentDetail._internal(
      id: id,
      amount: amount == null ? this.amount : amount.value,
      emiStatus: emiStatus == null ? this.emiStatus : emiStatus.value,
      emiReceivedOn: emiReceivedOn == null ? this.emiReceivedOn : emiReceivedOn.value,
      emiCreditedOn: emiCreditedOn == null ? this.emiCreditedOn : emiCreditedOn.value,
      paymentMode: paymentMode == null ? this.paymentMode : paymentMode.value,
      referenceNo: referenceNo == null ? this.referenceNo : referenceNo.value,
      loanID: loanID == null ? this.loanID : loanID.value
    );
  }
  
  PaymentDetail.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _amount = (json['amount'] as num?)?.toDouble(),
      _emiStatus = json['emiStatus'],
      _emiReceivedOn = json['emiReceivedOn'],
      _emiCreditedOn = json['emiCreditedOn'],
      _paymentMode = json['paymentMode'],
      _referenceNo = json['referenceNo'],
      _loanID = json['loanID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'amount': _amount, 'emiStatus': _emiStatus, 'emiReceivedOn': _emiReceivedOn, 'emiCreditedOn': _emiCreditedOn, 'paymentMode': _paymentMode, 'referenceNo': _referenceNo, 'loanID': _loanID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'amount': _amount,
    'emiStatus': _emiStatus,
    'emiReceivedOn': _emiReceivedOn,
    'emiCreditedOn': _emiCreditedOn,
    'paymentMode': _paymentMode,
    'referenceNo': _referenceNo,
    'loanID': _loanID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PaymentDetailModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PaymentDetailModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final AMOUNT = amplify_core.QueryField(fieldName: "amount");
  static final EMISTATUS = amplify_core.QueryField(fieldName: "emiStatus");
  static final EMIRECEIVEDON = amplify_core.QueryField(fieldName: "emiReceivedOn");
  static final EMICREDITEDON = amplify_core.QueryField(fieldName: "emiCreditedOn");
  static final PAYMENTMODE = amplify_core.QueryField(fieldName: "paymentMode");
  static final REFERENCENO = amplify_core.QueryField(fieldName: "referenceNo");
  static final LOANID = amplify_core.QueryField(fieldName: "loanID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PaymentDetail";
    modelSchemaDefinition.pluralName = "PaymentDetails";
    
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
      key: PaymentDetail.AMOUNT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetail.EMISTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetail.EMIRECEIVEDON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetail.EMICREDITEDON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetail.PAYMENTMODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetail.REFERENCENO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentDetail.LOANID,
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

class _PaymentDetailModelType extends amplify_core.ModelType<PaymentDetail> {
  const _PaymentDetailModelType();
  
  @override
  PaymentDetail fromJson(Map<String, dynamic> jsonData) {
    return PaymentDetail.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'PaymentDetail';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PaymentDetail] in your schema.
 */
class PaymentDetailModelIdentifier implements amplify_core.ModelIdentifier<PaymentDetail> {
  final String id;

  /** Create an instance of PaymentDetailModelIdentifier using [id] the primary key. */
  const PaymentDetailModelIdentifier({
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
  String toString() => 'PaymentDetailModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PaymentDetailModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}