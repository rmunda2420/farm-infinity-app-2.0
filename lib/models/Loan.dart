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


/** This is an auto generated class representing the Loan type in your schema. */
class Loan extends amplify_core.Model {
  static const classType = const _LoanModelType();
  final String id;
  final String? _loanId;
  final double? _amount;
  final int? _tenure;
  final String? _sanctionType;
  final String? _partnerLoanReferenceId;
  final String? _partnerCustomerReferenceId;
  final String? _channelPartnerReferenceId;
  final String? _lendingPartnerId;
  final String? _approvalDate;
  final bool? _moratorium;
  final String? _moratoriumPeriod;
  final double? _emiAmount;
  final double? _interestRate;
  final String? _per;
  final double? _totalInterest;
  final double? _totalRepaymentAmount;
  final int? _bureauScore;
  final String? _fiScore;
  final int? _loanStatus;
  final bool? _isClosed;
  final String? _farmerapplicationID;
  final Disbursal? _LoanToDisbursal;
  final List<PaymentDetail>? _LoanToPaymentDetails;
  final List<Repayment>? _LoanToRepayments;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _loanLoanToDisbursalId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LoanModelIdentifier get modelIdentifier {
      return LoanModelIdentifier(
        id: id
      );
  }
  
  String? get loanId {
    return _loanId;
  }
  
  double? get amount {
    return _amount;
  }
  
  int? get tenure {
    return _tenure;
  }
  
  String? get sanctionType {
    return _sanctionType;
  }
  
  String? get partnerLoanReferenceId {
    return _partnerLoanReferenceId;
  }
  
  String? get partnerCustomerReferenceId {
    return _partnerCustomerReferenceId;
  }
  
  String? get channelPartnerReferenceId {
    return _channelPartnerReferenceId;
  }
  
  String? get lendingPartnerId {
    return _lendingPartnerId;
  }
  
  String? get approvalDate {
    return _approvalDate;
  }
  
  bool? get moratorium {
    return _moratorium;
  }
  
  String? get moratoriumPeriod {
    return _moratoriumPeriod;
  }
  
  double? get emiAmount {
    return _emiAmount;
  }
  
  double? get interestRate {
    return _interestRate;
  }
  
  String? get per {
    return _per;
  }
  
  double? get totalInterest {
    return _totalInterest;
  }
  
  double? get totalRepaymentAmount {
    return _totalRepaymentAmount;
  }
  
  int? get bureauScore {
    return _bureauScore;
  }
  
  String? get fiScore {
    return _fiScore;
  }
  
  int? get loanStatus {
    return _loanStatus;
  }
  
  bool? get isClosed {
    return _isClosed;
  }
  
  String get farmerapplicationID {
    try {
      return _farmerapplicationID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Disbursal? get LoanToDisbursal {
    return _LoanToDisbursal;
  }
  
  List<PaymentDetail>? get LoanToPaymentDetails {
    return _LoanToPaymentDetails;
  }
  
  List<Repayment>? get LoanToRepayments {
    return _LoanToRepayments;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get loanLoanToDisbursalId {
    return _loanLoanToDisbursalId;
  }
  
  const Loan._internal({required this.id, loanId, amount, tenure, sanctionType, partnerLoanReferenceId, partnerCustomerReferenceId, channelPartnerReferenceId, lendingPartnerId, approvalDate, moratorium, moratoriumPeriod, emiAmount, interestRate, per, totalInterest, totalRepaymentAmount, bureauScore, fiScore, loanStatus, isClosed, required farmerapplicationID, LoanToDisbursal, LoanToPaymentDetails, LoanToRepayments, createdAt, updatedAt, loanLoanToDisbursalId}): _loanId = loanId, _amount = amount, _tenure = tenure, _sanctionType = sanctionType, _partnerLoanReferenceId = partnerLoanReferenceId, _partnerCustomerReferenceId = partnerCustomerReferenceId, _channelPartnerReferenceId = channelPartnerReferenceId, _lendingPartnerId = lendingPartnerId, _approvalDate = approvalDate, _moratorium = moratorium, _moratoriumPeriod = moratoriumPeriod, _emiAmount = emiAmount, _interestRate = interestRate, _per = per, _totalInterest = totalInterest, _totalRepaymentAmount = totalRepaymentAmount, _bureauScore = bureauScore, _fiScore = fiScore, _loanStatus = loanStatus, _isClosed = isClosed, _farmerapplicationID = farmerapplicationID, _LoanToDisbursal = LoanToDisbursal, _LoanToPaymentDetails = LoanToPaymentDetails, _LoanToRepayments = LoanToRepayments, _createdAt = createdAt, _updatedAt = updatedAt, _loanLoanToDisbursalId = loanLoanToDisbursalId;
  
  factory Loan({String? id, String? loanId, double? amount, int? tenure, String? sanctionType, String? partnerLoanReferenceId, String? partnerCustomerReferenceId, String? channelPartnerReferenceId, String? lendingPartnerId, String? approvalDate, bool? moratorium, String? moratoriumPeriod, double? emiAmount, double? interestRate, String? per, double? totalInterest, double? totalRepaymentAmount, int? bureauScore, String? fiScore, int? loanStatus, bool? isClosed, required String farmerapplicationID, Disbursal? LoanToDisbursal, List<PaymentDetail>? LoanToPaymentDetails, List<Repayment>? LoanToRepayments, String? loanLoanToDisbursalId}) {
    return Loan._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      loanId: loanId,
      amount: amount,
      tenure: tenure,
      sanctionType: sanctionType,
      partnerLoanReferenceId: partnerLoanReferenceId,
      partnerCustomerReferenceId: partnerCustomerReferenceId,
      channelPartnerReferenceId: channelPartnerReferenceId,
      lendingPartnerId: lendingPartnerId,
      approvalDate: approvalDate,
      moratorium: moratorium,
      moratoriumPeriod: moratoriumPeriod,
      emiAmount: emiAmount,
      interestRate: interestRate,
      per: per,
      totalInterest: totalInterest,
      totalRepaymentAmount: totalRepaymentAmount,
      bureauScore: bureauScore,
      fiScore: fiScore,
      loanStatus: loanStatus,
      isClosed: isClosed,
      farmerapplicationID: farmerapplicationID,
      LoanToDisbursal: LoanToDisbursal,
      LoanToPaymentDetails: LoanToPaymentDetails != null ? List<PaymentDetail>.unmodifiable(LoanToPaymentDetails) : LoanToPaymentDetails,
      LoanToRepayments: LoanToRepayments != null ? List<Repayment>.unmodifiable(LoanToRepayments) : LoanToRepayments,
      loanLoanToDisbursalId: loanLoanToDisbursalId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Loan &&
      id == other.id &&
      _loanId == other._loanId &&
      _amount == other._amount &&
      _tenure == other._tenure &&
      _sanctionType == other._sanctionType &&
      _partnerLoanReferenceId == other._partnerLoanReferenceId &&
      _partnerCustomerReferenceId == other._partnerCustomerReferenceId &&
      _channelPartnerReferenceId == other._channelPartnerReferenceId &&
      _lendingPartnerId == other._lendingPartnerId &&
      _approvalDate == other._approvalDate &&
      _moratorium == other._moratorium &&
      _moratoriumPeriod == other._moratoriumPeriod &&
      _emiAmount == other._emiAmount &&
      _interestRate == other._interestRate &&
      _per == other._per &&
      _totalInterest == other._totalInterest &&
      _totalRepaymentAmount == other._totalRepaymentAmount &&
      _bureauScore == other._bureauScore &&
      _fiScore == other._fiScore &&
      _loanStatus == other._loanStatus &&
      _isClosed == other._isClosed &&
      _farmerapplicationID == other._farmerapplicationID &&
      _LoanToDisbursal == other._LoanToDisbursal &&
      DeepCollectionEquality().equals(_LoanToPaymentDetails, other._LoanToPaymentDetails) &&
      DeepCollectionEquality().equals(_LoanToRepayments, other._LoanToRepayments) &&
      _loanLoanToDisbursalId == other._loanLoanToDisbursalId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Loan {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("loanId=" + "$_loanId" + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("tenure=" + (_tenure != null ? _tenure!.toString() : "null") + ", ");
    buffer.write("sanctionType=" + "$_sanctionType" + ", ");
    buffer.write("partnerLoanReferenceId=" + "$_partnerLoanReferenceId" + ", ");
    buffer.write("partnerCustomerReferenceId=" + "$_partnerCustomerReferenceId" + ", ");
    buffer.write("channelPartnerReferenceId=" + "$_channelPartnerReferenceId" + ", ");
    buffer.write("lendingPartnerId=" + "$_lendingPartnerId" + ", ");
    buffer.write("approvalDate=" + "$_approvalDate" + ", ");
    buffer.write("moratorium=" + (_moratorium != null ? _moratorium!.toString() : "null") + ", ");
    buffer.write("moratoriumPeriod=" + "$_moratoriumPeriod" + ", ");
    buffer.write("emiAmount=" + (_emiAmount != null ? _emiAmount!.toString() : "null") + ", ");
    buffer.write("interestRate=" + (_interestRate != null ? _interestRate!.toString() : "null") + ", ");
    buffer.write("per=" + "$_per" + ", ");
    buffer.write("totalInterest=" + (_totalInterest != null ? _totalInterest!.toString() : "null") + ", ");
    buffer.write("totalRepaymentAmount=" + (_totalRepaymentAmount != null ? _totalRepaymentAmount!.toString() : "null") + ", ");
    buffer.write("bureauScore=" + (_bureauScore != null ? _bureauScore!.toString() : "null") + ", ");
    buffer.write("fiScore=" + "$_fiScore" + ", ");
    buffer.write("loanStatus=" + (_loanStatus != null ? _loanStatus!.toString() : "null") + ", ");
    buffer.write("isClosed=" + (_isClosed != null ? _isClosed!.toString() : "null") + ", ");
    buffer.write("farmerapplicationID=" + "$_farmerapplicationID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("loanLoanToDisbursalId=" + "$_loanLoanToDisbursalId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Loan copyWith({String? loanId, double? amount, int? tenure, String? sanctionType, String? partnerLoanReferenceId, String? partnerCustomerReferenceId, String? channelPartnerReferenceId, String? lendingPartnerId, String? approvalDate, bool? moratorium, String? moratoriumPeriod, double? emiAmount, double? interestRate, String? per, double? totalInterest, double? totalRepaymentAmount, int? bureauScore, String? fiScore, int? loanStatus, bool? isClosed, String? farmerapplicationID, Disbursal? LoanToDisbursal, List<PaymentDetail>? LoanToPaymentDetails, List<Repayment>? LoanToRepayments, String? loanLoanToDisbursalId}) {
    return Loan._internal(
      id: id,
      loanId: loanId ?? this.loanId,
      amount: amount ?? this.amount,
      tenure: tenure ?? this.tenure,
      sanctionType: sanctionType ?? this.sanctionType,
      partnerLoanReferenceId: partnerLoanReferenceId ?? this.partnerLoanReferenceId,
      partnerCustomerReferenceId: partnerCustomerReferenceId ?? this.partnerCustomerReferenceId,
      channelPartnerReferenceId: channelPartnerReferenceId ?? this.channelPartnerReferenceId,
      lendingPartnerId: lendingPartnerId ?? this.lendingPartnerId,
      approvalDate: approvalDate ?? this.approvalDate,
      moratorium: moratorium ?? this.moratorium,
      moratoriumPeriod: moratoriumPeriod ?? this.moratoriumPeriod,
      emiAmount: emiAmount ?? this.emiAmount,
      interestRate: interestRate ?? this.interestRate,
      per: per ?? this.per,
      totalInterest: totalInterest ?? this.totalInterest,
      totalRepaymentAmount: totalRepaymentAmount ?? this.totalRepaymentAmount,
      bureauScore: bureauScore ?? this.bureauScore,
      fiScore: fiScore ?? this.fiScore,
      loanStatus: loanStatus ?? this.loanStatus,
      isClosed: isClosed ?? this.isClosed,
      farmerapplicationID: farmerapplicationID ?? this.farmerapplicationID,
      LoanToDisbursal: LoanToDisbursal ?? this.LoanToDisbursal,
      LoanToPaymentDetails: LoanToPaymentDetails ?? this.LoanToPaymentDetails,
      LoanToRepayments: LoanToRepayments ?? this.LoanToRepayments,
      loanLoanToDisbursalId: loanLoanToDisbursalId ?? this.loanLoanToDisbursalId);
  }
  
  Loan copyWithModelFieldValues({
    ModelFieldValue<String?>? loanId,
    ModelFieldValue<double?>? amount,
    ModelFieldValue<int?>? tenure,
    ModelFieldValue<String?>? sanctionType,
    ModelFieldValue<String?>? partnerLoanReferenceId,
    ModelFieldValue<String?>? partnerCustomerReferenceId,
    ModelFieldValue<String?>? channelPartnerReferenceId,
    ModelFieldValue<String?>? lendingPartnerId,
    ModelFieldValue<String?>? approvalDate,
    ModelFieldValue<bool?>? moratorium,
    ModelFieldValue<String?>? moratoriumPeriod,
    ModelFieldValue<double?>? emiAmount,
    ModelFieldValue<double?>? interestRate,
    ModelFieldValue<String?>? per,
    ModelFieldValue<double?>? totalInterest,
    ModelFieldValue<double?>? totalRepaymentAmount,
    ModelFieldValue<int?>? bureauScore,
    ModelFieldValue<String?>? fiScore,
    ModelFieldValue<int?>? loanStatus,
    ModelFieldValue<bool?>? isClosed,
    ModelFieldValue<String>? farmerapplicationID,
    ModelFieldValue<Disbursal?>? LoanToDisbursal,
    ModelFieldValue<List<PaymentDetail>?>? LoanToPaymentDetails,
    ModelFieldValue<List<Repayment>?>? LoanToRepayments,
    ModelFieldValue<String?>? loanLoanToDisbursalId
  }) {
    return Loan._internal(
      id: id,
      loanId: loanId == null ? this.loanId : loanId.value,
      amount: amount == null ? this.amount : amount.value,
      tenure: tenure == null ? this.tenure : tenure.value,
      sanctionType: sanctionType == null ? this.sanctionType : sanctionType.value,
      partnerLoanReferenceId: partnerLoanReferenceId == null ? this.partnerLoanReferenceId : partnerLoanReferenceId.value,
      partnerCustomerReferenceId: partnerCustomerReferenceId == null ? this.partnerCustomerReferenceId : partnerCustomerReferenceId.value,
      channelPartnerReferenceId: channelPartnerReferenceId == null ? this.channelPartnerReferenceId : channelPartnerReferenceId.value,
      lendingPartnerId: lendingPartnerId == null ? this.lendingPartnerId : lendingPartnerId.value,
      approvalDate: approvalDate == null ? this.approvalDate : approvalDate.value,
      moratorium: moratorium == null ? this.moratorium : moratorium.value,
      moratoriumPeriod: moratoriumPeriod == null ? this.moratoriumPeriod : moratoriumPeriod.value,
      emiAmount: emiAmount == null ? this.emiAmount : emiAmount.value,
      interestRate: interestRate == null ? this.interestRate : interestRate.value,
      per: per == null ? this.per : per.value,
      totalInterest: totalInterest == null ? this.totalInterest : totalInterest.value,
      totalRepaymentAmount: totalRepaymentAmount == null ? this.totalRepaymentAmount : totalRepaymentAmount.value,
      bureauScore: bureauScore == null ? this.bureauScore : bureauScore.value,
      fiScore: fiScore == null ? this.fiScore : fiScore.value,
      loanStatus: loanStatus == null ? this.loanStatus : loanStatus.value,
      isClosed: isClosed == null ? this.isClosed : isClosed.value,
      farmerapplicationID: farmerapplicationID == null ? this.farmerapplicationID : farmerapplicationID.value,
      LoanToDisbursal: LoanToDisbursal == null ? this.LoanToDisbursal : LoanToDisbursal.value,
      LoanToPaymentDetails: LoanToPaymentDetails == null ? this.LoanToPaymentDetails : LoanToPaymentDetails.value,
      LoanToRepayments: LoanToRepayments == null ? this.LoanToRepayments : LoanToRepayments.value,
      loanLoanToDisbursalId: loanLoanToDisbursalId == null ? this.loanLoanToDisbursalId : loanLoanToDisbursalId.value
    );
  }
  
  Loan.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _loanId = json['loanId'],
      _amount = (json['amount'] as num?)?.toDouble(),
      _tenure = (json['tenure'] as num?)?.toInt(),
      _sanctionType = json['sanctionType'],
      _partnerLoanReferenceId = json['partnerLoanReferenceId'],
      _partnerCustomerReferenceId = json['partnerCustomerReferenceId'],
      _channelPartnerReferenceId = json['channelPartnerReferenceId'],
      _lendingPartnerId = json['lendingPartnerId'],
      _approvalDate = json['approvalDate'],
      _moratorium = json['moratorium'],
      _moratoriumPeriod = json['moratoriumPeriod'],
      _emiAmount = (json['emiAmount'] as num?)?.toDouble(),
      _interestRate = (json['interestRate'] as num?)?.toDouble(),
      _per = json['per'],
      _totalInterest = (json['totalInterest'] as num?)?.toDouble(),
      _totalRepaymentAmount = (json['totalRepaymentAmount'] as num?)?.toDouble(),
      _bureauScore = (json['bureauScore'] as num?)?.toInt(),
      _fiScore = json['fiScore'],
      _loanStatus = (json['loanStatus'] as num?)?.toInt(),
      _isClosed = json['isClosed'],
      _farmerapplicationID = json['farmerapplicationID'],
      _LoanToDisbursal = json['LoanToDisbursal'] != null
        ? json['LoanToDisbursal']['serializedData'] != null
          ? Disbursal.fromJson(new Map<String, dynamic>.from(json['LoanToDisbursal']['serializedData']))
          : Disbursal.fromJson(new Map<String, dynamic>.from(json['LoanToDisbursal']))
        : null,
      _LoanToPaymentDetails = json['LoanToPaymentDetails']  is Map
        ? (json['LoanToPaymentDetails']['items'] is List
          ? (json['LoanToPaymentDetails']['items'] as List)
              .where((e) => e != null)
              .map((e) => PaymentDetail.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['LoanToPaymentDetails'] is List
          ? (json['LoanToPaymentDetails'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => PaymentDetail.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _LoanToRepayments = json['LoanToRepayments']  is Map
        ? (json['LoanToRepayments']['items'] is List
          ? (json['LoanToRepayments']['items'] as List)
              .where((e) => e != null)
              .map((e) => Repayment.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['LoanToRepayments'] is List
          ? (json['LoanToRepayments'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Repayment.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _loanLoanToDisbursalId = json['loanLoanToDisbursalId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'loanId': _loanId, 'amount': _amount, 'tenure': _tenure, 'sanctionType': _sanctionType, 'partnerLoanReferenceId': _partnerLoanReferenceId, 'partnerCustomerReferenceId': _partnerCustomerReferenceId, 'channelPartnerReferenceId': _channelPartnerReferenceId, 'lendingPartnerId': _lendingPartnerId, 'approvalDate': _approvalDate, 'moratorium': _moratorium, 'moratoriumPeriod': _moratoriumPeriod, 'emiAmount': _emiAmount, 'interestRate': _interestRate, 'per': _per, 'totalInterest': _totalInterest, 'totalRepaymentAmount': _totalRepaymentAmount, 'bureauScore': _bureauScore, 'fiScore': _fiScore, 'loanStatus': _loanStatus, 'isClosed': _isClosed, 'farmerapplicationID': _farmerapplicationID, 'LoanToDisbursal': _LoanToDisbursal?.toJson(), 'LoanToPaymentDetails': _LoanToPaymentDetails?.map((PaymentDetail? e) => e?.toJson()).toList(), 'LoanToRepayments': _LoanToRepayments?.map((Repayment? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'loanLoanToDisbursalId': _loanLoanToDisbursalId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'loanId': _loanId,
    'amount': _amount,
    'tenure': _tenure,
    'sanctionType': _sanctionType,
    'partnerLoanReferenceId': _partnerLoanReferenceId,
    'partnerCustomerReferenceId': _partnerCustomerReferenceId,
    'channelPartnerReferenceId': _channelPartnerReferenceId,
    'lendingPartnerId': _lendingPartnerId,
    'approvalDate': _approvalDate,
    'moratorium': _moratorium,
    'moratoriumPeriod': _moratoriumPeriod,
    'emiAmount': _emiAmount,
    'interestRate': _interestRate,
    'per': _per,
    'totalInterest': _totalInterest,
    'totalRepaymentAmount': _totalRepaymentAmount,
    'bureauScore': _bureauScore,
    'fiScore': _fiScore,
    'loanStatus': _loanStatus,
    'isClosed': _isClosed,
    'farmerapplicationID': _farmerapplicationID,
    'LoanToDisbursal': _LoanToDisbursal,
    'LoanToPaymentDetails': _LoanToPaymentDetails,
    'LoanToRepayments': _LoanToRepayments,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'loanLoanToDisbursalId': _loanLoanToDisbursalId
  };

  static final amplify_core.QueryModelIdentifier<LoanModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LoanModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final LOANID = amplify_core.QueryField(fieldName: "loanId");
  static final AMOUNT = amplify_core.QueryField(fieldName: "amount");
  static final TENURE = amplify_core.QueryField(fieldName: "tenure");
  static final SANCTIONTYPE = amplify_core.QueryField(fieldName: "sanctionType");
  static final PARTNERLOANREFERENCEID = amplify_core.QueryField(fieldName: "partnerLoanReferenceId");
  static final PARTNERCUSTOMERREFERENCEID = amplify_core.QueryField(fieldName: "partnerCustomerReferenceId");
  static final CHANNELPARTNERREFERENCEID = amplify_core.QueryField(fieldName: "channelPartnerReferenceId");
  static final LENDINGPARTNERID = amplify_core.QueryField(fieldName: "lendingPartnerId");
  static final APPROVALDATE = amplify_core.QueryField(fieldName: "approvalDate");
  static final MORATORIUM = amplify_core.QueryField(fieldName: "moratorium");
  static final MORATORIUMPERIOD = amplify_core.QueryField(fieldName: "moratoriumPeriod");
  static final EMIAMOUNT = amplify_core.QueryField(fieldName: "emiAmount");
  static final INTERESTRATE = amplify_core.QueryField(fieldName: "interestRate");
  static final PER = amplify_core.QueryField(fieldName: "per");
  static final TOTALINTEREST = amplify_core.QueryField(fieldName: "totalInterest");
  static final TOTALREPAYMENTAMOUNT = amplify_core.QueryField(fieldName: "totalRepaymentAmount");
  static final BUREAUSCORE = amplify_core.QueryField(fieldName: "bureauScore");
  static final FISCORE = amplify_core.QueryField(fieldName: "fiScore");
  static final LOANSTATUS = amplify_core.QueryField(fieldName: "loanStatus");
  static final ISCLOSED = amplify_core.QueryField(fieldName: "isClosed");
  static final FARMERAPPLICATIONID = amplify_core.QueryField(fieldName: "farmerapplicationID");
  static final LOANTODISBURSAL = amplify_core.QueryField(
    fieldName: "LoanToDisbursal",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Disbursal'));
  static final LOANTOPAYMENTDETAILS = amplify_core.QueryField(
    fieldName: "LoanToPaymentDetails",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'PaymentDetail'));
  static final LOANTOREPAYMENTS = amplify_core.QueryField(
    fieldName: "LoanToRepayments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Repayment'));
  static final LOANLOANTODISBURSALID = amplify_core.QueryField(fieldName: "loanLoanToDisbursalId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Loan";
    modelSchemaDefinition.pluralName = "Loans";
    
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
      amplify_core.ModelIndex(fields: const ["farmerapplicationID"], name: "byFarmerApplication")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.LOANID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.AMOUNT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.TENURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.SANCTIONTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.PARTNERLOANREFERENCEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.PARTNERCUSTOMERREFERENCEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.CHANNELPARTNERREFERENCEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.LENDINGPARTNERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.APPROVALDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.MORATORIUM,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.MORATORIUMPERIOD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.EMIAMOUNT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.INTERESTRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.PER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.TOTALINTEREST,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.TOTALREPAYMENTAMOUNT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.BUREAUSCORE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.FISCORE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.LOANSTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.ISCLOSED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Loan.FARMERAPPLICATIONID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Loan.LOANTODISBURSAL,
      isRequired: false,
      ofModelName: 'Disbursal',
      associatedKey: Disbursal.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Loan.LOANTOPAYMENTDETAILS,
      isRequired: false,
      ofModelName: 'PaymentDetail',
      associatedKey: PaymentDetail.LOANID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Loan.LOANTOREPAYMENTS,
      isRequired: false,
      ofModelName: 'Repayment',
      associatedKey: Repayment.LOANID
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
      key: Loan.LOANLOANTODISBURSALID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _LoanModelType extends amplify_core.ModelType<Loan> {
  const _LoanModelType();
  
  @override
  Loan fromJson(Map<String, dynamic> jsonData) {
    return Loan.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Loan';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Loan] in your schema.
 */
class LoanModelIdentifier implements amplify_core.ModelIdentifier<Loan> {
  final String id;

  /** Create an instance of LoanModelIdentifier using [id] the primary key. */
  const LoanModelIdentifier({
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
  String toString() => 'LoanModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LoanModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}