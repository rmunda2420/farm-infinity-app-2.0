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


/** This is an auto generated class representing the FieldAgent type in your schema. */
class FieldAgent extends amplify_core.Model {
  static const classType = const _FieldAgentModelType();
  final String id;
  final String? _firstName;
  final String? _middleName;
  final String? _lastName;
  final String? _phone;
  final String? _profession;
  final String? _qualification;
  final String? _address;
  final String? _pan;
  final String? _panImage;
  final String? _accountName;
  final String? _bankName;
  final String? _ifsc;
  final String? _altPhone;
  final String? _fpoId;
  final String? _fpoName;
  final bool? _isMapped;
  final bool? _changedInitialPassword;
  final int? _userTypeId;
  final bool? _addPrivilege;
  final bool? _editPrivilege;
  final bool? _deletePrivilege;
  final bool? _viewPrivilege;
  final bool? _isActive;
  final String? _userId;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FieldAgentModelIdentifier get modelIdentifier {
      return FieldAgentModelIdentifier(
        id: id
      );
  }
  
  String? get firstName {
    return _firstName;
  }
  
  String? get middleName {
    return _middleName;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  String? get phone {
    return _phone;
  }
  
  String? get profession {
    return _profession;
  }
  
  String? get qualification {
    return _qualification;
  }
  
  String? get address {
    return _address;
  }
  
  String? get pan {
    return _pan;
  }
  
  String? get panImage {
    return _panImage;
  }
  
  String? get accountName {
    return _accountName;
  }
  
  String? get bankName {
    return _bankName;
  }
  
  String? get ifsc {
    return _ifsc;
  }
  
  String? get altPhone {
    return _altPhone;
  }
  
  String? get fpoId {
    return _fpoId;
  }
  
  String? get fpoName {
    return _fpoName;
  }
  
  bool? get isMapped {
    return _isMapped;
  }
  
  bool? get changedInitialPassword {
    return _changedInitialPassword;
  }
  
  int? get userTypeId {
    return _userTypeId;
  }
  
  bool? get addPrivilege {
    return _addPrivilege;
  }
  
  bool? get editPrivilege {
    return _editPrivilege;
  }
  
  bool? get deletePrivilege {
    return _deletePrivilege;
  }
  
  bool? get viewPrivilege {
    return _viewPrivilege;
  }
  
  bool? get isActive {
    return _isActive;
  }
  
  String? get userId {
    return _userId;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const FieldAgent._internal({required this.id, firstName, middleName, lastName, phone, profession, qualification, address, pan, panImage, accountName, bankName, ifsc, altPhone, fpoId, fpoName, isMapped, changedInitialPassword, userTypeId, addPrivilege, editPrivilege, deletePrivilege, viewPrivilege, isActive, userId, createdAt, updatedAt}): _firstName = firstName, _middleName = middleName, _lastName = lastName, _phone = phone, _profession = profession, _qualification = qualification, _address = address, _pan = pan, _panImage = panImage, _accountName = accountName, _bankName = bankName, _ifsc = ifsc, _altPhone = altPhone, _fpoId = fpoId, _fpoName = fpoName, _isMapped = isMapped, _changedInitialPassword = changedInitialPassword, _userTypeId = userTypeId, _addPrivilege = addPrivilege, _editPrivilege = editPrivilege, _deletePrivilege = deletePrivilege, _viewPrivilege = viewPrivilege, _isActive = isActive, _userId = userId, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FieldAgent({String? id, String? firstName, String? middleName, String? lastName, String? phone, String? profession, String? qualification, String? address, String? pan, String? panImage, String? accountName, String? bankName, String? ifsc, String? altPhone, String? fpoId, String? fpoName, bool? isMapped, bool? changedInitialPassword, int? userTypeId, bool? addPrivilege, bool? editPrivilege, bool? deletePrivilege, bool? viewPrivilege, bool? isActive, String? userId}) {
    return FieldAgent._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      phone: phone,
      profession: profession,
      qualification: qualification,
      address: address,
      pan: pan,
      panImage: panImage,
      accountName: accountName,
      bankName: bankName,
      ifsc: ifsc,
      altPhone: altPhone,
      fpoId: fpoId,
      fpoName: fpoName,
      isMapped: isMapped,
      changedInitialPassword: changedInitialPassword,
      userTypeId: userTypeId,
      addPrivilege: addPrivilege,
      editPrivilege: editPrivilege,
      deletePrivilege: deletePrivilege,
      viewPrivilege: viewPrivilege,
      isActive: isActive,
      userId: userId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FieldAgent &&
      id == other.id &&
      _firstName == other._firstName &&
      _middleName == other._middleName &&
      _lastName == other._lastName &&
      _phone == other._phone &&
      _profession == other._profession &&
      _qualification == other._qualification &&
      _address == other._address &&
      _pan == other._pan &&
      _panImage == other._panImage &&
      _accountName == other._accountName &&
      _bankName == other._bankName &&
      _ifsc == other._ifsc &&
      _altPhone == other._altPhone &&
      _fpoId == other._fpoId &&
      _fpoName == other._fpoName &&
      _isMapped == other._isMapped &&
      _changedInitialPassword == other._changedInitialPassword &&
      _userTypeId == other._userTypeId &&
      _addPrivilege == other._addPrivilege &&
      _editPrivilege == other._editPrivilege &&
      _deletePrivilege == other._deletePrivilege &&
      _viewPrivilege == other._viewPrivilege &&
      _isActive == other._isActive &&
      _userId == other._userId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FieldAgent {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("middleName=" + "$_middleName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("profession=" + "$_profession" + ", ");
    buffer.write("qualification=" + "$_qualification" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("pan=" + "$_pan" + ", ");
    buffer.write("panImage=" + "$_panImage" + ", ");
    buffer.write("accountName=" + "$_accountName" + ", ");
    buffer.write("bankName=" + "$_bankName" + ", ");
    buffer.write("ifsc=" + "$_ifsc" + ", ");
    buffer.write("altPhone=" + "$_altPhone" + ", ");
    buffer.write("fpoId=" + "$_fpoId" + ", ");
    buffer.write("fpoName=" + "$_fpoName" + ", ");
    buffer.write("isMapped=" + (_isMapped != null ? _isMapped!.toString() : "null") + ", ");
    buffer.write("changedInitialPassword=" + (_changedInitialPassword != null ? _changedInitialPassword!.toString() : "null") + ", ");
    buffer.write("userTypeId=" + (_userTypeId != null ? _userTypeId!.toString() : "null") + ", ");
    buffer.write("addPrivilege=" + (_addPrivilege != null ? _addPrivilege!.toString() : "null") + ", ");
    buffer.write("editPrivilege=" + (_editPrivilege != null ? _editPrivilege!.toString() : "null") + ", ");
    buffer.write("deletePrivilege=" + (_deletePrivilege != null ? _deletePrivilege!.toString() : "null") + ", ");
    buffer.write("viewPrivilege=" + (_viewPrivilege != null ? _viewPrivilege!.toString() : "null") + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FieldAgent copyWith({String? firstName, String? middleName, String? lastName, String? phone, String? profession, String? qualification, String? address, String? pan, String? panImage, String? accountName, String? bankName, String? ifsc, String? altPhone, String? fpoId, String? fpoName, bool? isMapped, bool? changedInitialPassword, int? userTypeId, bool? addPrivilege, bool? editPrivilege, bool? deletePrivilege, bool? viewPrivilege, bool? isActive, String? userId}) {
    return FieldAgent._internal(
      id: id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      profession: profession ?? this.profession,
      qualification: qualification ?? this.qualification,
      address: address ?? this.address,
      pan: pan ?? this.pan,
      panImage: panImage ?? this.panImage,
      accountName: accountName ?? this.accountName,
      bankName: bankName ?? this.bankName,
      ifsc: ifsc ?? this.ifsc,
      altPhone: altPhone ?? this.altPhone,
      fpoId: fpoId ?? this.fpoId,
      fpoName: fpoName ?? this.fpoName,
      isMapped: isMapped ?? this.isMapped,
      changedInitialPassword: changedInitialPassword ?? this.changedInitialPassword,
      userTypeId: userTypeId ?? this.userTypeId,
      addPrivilege: addPrivilege ?? this.addPrivilege,
      editPrivilege: editPrivilege ?? this.editPrivilege,
      deletePrivilege: deletePrivilege ?? this.deletePrivilege,
      viewPrivilege: viewPrivilege ?? this.viewPrivilege,
      isActive: isActive ?? this.isActive,
      userId: userId ?? this.userId);
  }
  
  FieldAgent copyWithModelFieldValues({
    ModelFieldValue<String?>? firstName,
    ModelFieldValue<String?>? middleName,
    ModelFieldValue<String?>? lastName,
    ModelFieldValue<String?>? phone,
    ModelFieldValue<String?>? profession,
    ModelFieldValue<String?>? qualification,
    ModelFieldValue<String?>? address,
    ModelFieldValue<String?>? pan,
    ModelFieldValue<String?>? panImage,
    ModelFieldValue<String?>? accountName,
    ModelFieldValue<String?>? bankName,
    ModelFieldValue<String?>? ifsc,
    ModelFieldValue<String?>? altPhone,
    ModelFieldValue<String?>? fpoId,
    ModelFieldValue<String?>? fpoName,
    ModelFieldValue<bool?>? isMapped,
    ModelFieldValue<bool?>? changedInitialPassword,
    ModelFieldValue<int?>? userTypeId,
    ModelFieldValue<bool?>? addPrivilege,
    ModelFieldValue<bool?>? editPrivilege,
    ModelFieldValue<bool?>? deletePrivilege,
    ModelFieldValue<bool?>? viewPrivilege,
    ModelFieldValue<bool?>? isActive,
    ModelFieldValue<String?>? userId
  }) {
    return FieldAgent._internal(
      id: id,
      firstName: firstName == null ? this.firstName : firstName.value,
      middleName: middleName == null ? this.middleName : middleName.value,
      lastName: lastName == null ? this.lastName : lastName.value,
      phone: phone == null ? this.phone : phone.value,
      profession: profession == null ? this.profession : profession.value,
      qualification: qualification == null ? this.qualification : qualification.value,
      address: address == null ? this.address : address.value,
      pan: pan == null ? this.pan : pan.value,
      panImage: panImage == null ? this.panImage : panImage.value,
      accountName: accountName == null ? this.accountName : accountName.value,
      bankName: bankName == null ? this.bankName : bankName.value,
      ifsc: ifsc == null ? this.ifsc : ifsc.value,
      altPhone: altPhone == null ? this.altPhone : altPhone.value,
      fpoId: fpoId == null ? this.fpoId : fpoId.value,
      fpoName: fpoName == null ? this.fpoName : fpoName.value,
      isMapped: isMapped == null ? this.isMapped : isMapped.value,
      changedInitialPassword: changedInitialPassword == null ? this.changedInitialPassword : changedInitialPassword.value,
      userTypeId: userTypeId == null ? this.userTypeId : userTypeId.value,
      addPrivilege: addPrivilege == null ? this.addPrivilege : addPrivilege.value,
      editPrivilege: editPrivilege == null ? this.editPrivilege : editPrivilege.value,
      deletePrivilege: deletePrivilege == null ? this.deletePrivilege : deletePrivilege.value,
      viewPrivilege: viewPrivilege == null ? this.viewPrivilege : viewPrivilege.value,
      isActive: isActive == null ? this.isActive : isActive.value,
      userId: userId == null ? this.userId : userId.value
    );
  }
  
  FieldAgent.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _firstName = json['firstName'],
      _middleName = json['middleName'],
      _lastName = json['lastName'],
      _phone = json['phone'],
      _profession = json['profession'],
      _qualification = json['qualification'],
      _address = json['address'],
      _pan = json['pan'],
      _panImage = json['panImage'],
      _accountName = json['accountName'],
      _bankName = json['bankName'],
      _ifsc = json['ifsc'],
      _altPhone = json['altPhone'],
      _fpoId = json['fpoId'],
      _fpoName = json['fpoName'],
      _isMapped = json['isMapped'],
      _changedInitialPassword = json['changedInitialPassword'],
      _userTypeId = (json['userTypeId'] as num?)?.toInt(),
      _addPrivilege = json['addPrivilege'],
      _editPrivilege = json['editPrivilege'],
      _deletePrivilege = json['deletePrivilege'],
      _viewPrivilege = json['viewPrivilege'],
      _isActive = json['isActive'],
      _userId = json['userId'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'firstName': _firstName, 'middleName': _middleName, 'lastName': _lastName, 'phone': _phone, 'profession': _profession, 'qualification': _qualification, 'address': _address, 'pan': _pan, 'panImage': _panImage, 'accountName': _accountName, 'bankName': _bankName, 'ifsc': _ifsc, 'altPhone': _altPhone, 'fpoId': _fpoId, 'fpoName': _fpoName, 'isMapped': _isMapped, 'changedInitialPassword': _changedInitialPassword, 'userTypeId': _userTypeId, 'addPrivilege': _addPrivilege, 'editPrivilege': _editPrivilege, 'deletePrivilege': _deletePrivilege, 'viewPrivilege': _viewPrivilege, 'isActive': _isActive, 'userId': _userId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'firstName': _firstName,
    'middleName': _middleName,
    'lastName': _lastName,
    'phone': _phone,
    'profession': _profession,
    'qualification': _qualification,
    'address': _address,
    'pan': _pan,
    'panImage': _panImage,
    'accountName': _accountName,
    'bankName': _bankName,
    'ifsc': _ifsc,
    'altPhone': _altPhone,
    'fpoId': _fpoId,
    'fpoName': _fpoName,
    'isMapped': _isMapped,
    'changedInitialPassword': _changedInitialPassword,
    'userTypeId': _userTypeId,
    'addPrivilege': _addPrivilege,
    'editPrivilege': _editPrivilege,
    'deletePrivilege': _deletePrivilege,
    'viewPrivilege': _viewPrivilege,
    'isActive': _isActive,
    'userId': _userId,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FieldAgentModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FieldAgentModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FIRSTNAME = amplify_core.QueryField(fieldName: "firstName");
  static final MIDDLENAME = amplify_core.QueryField(fieldName: "middleName");
  static final LASTNAME = amplify_core.QueryField(fieldName: "lastName");
  static final PHONE = amplify_core.QueryField(fieldName: "phone");
  static final PROFESSION = amplify_core.QueryField(fieldName: "profession");
  static final QUALIFICATION = amplify_core.QueryField(fieldName: "qualification");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final PAN = amplify_core.QueryField(fieldName: "pan");
  static final PANIMAGE = amplify_core.QueryField(fieldName: "panImage");
  static final ACCOUNTNAME = amplify_core.QueryField(fieldName: "accountName");
  static final BANKNAME = amplify_core.QueryField(fieldName: "bankName");
  static final IFSC = amplify_core.QueryField(fieldName: "ifsc");
  static final ALTPHONE = amplify_core.QueryField(fieldName: "altPhone");
  static final FPOID = amplify_core.QueryField(fieldName: "fpoId");
  static final FPONAME = amplify_core.QueryField(fieldName: "fpoName");
  static final ISMAPPED = amplify_core.QueryField(fieldName: "isMapped");
  static final CHANGEDINITIALPASSWORD = amplify_core.QueryField(fieldName: "changedInitialPassword");
  static final USERTYPEID = amplify_core.QueryField(fieldName: "userTypeId");
  static final ADDPRIVILEGE = amplify_core.QueryField(fieldName: "addPrivilege");
  static final EDITPRIVILEGE = amplify_core.QueryField(fieldName: "editPrivilege");
  static final DELETEPRIVILEGE = amplify_core.QueryField(fieldName: "deletePrivilege");
  static final VIEWPRIVILEGE = amplify_core.QueryField(fieldName: "viewPrivilege");
  static final ISACTIVE = amplify_core.QueryField(fieldName: "isActive");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FieldAgent";
    modelSchemaDefinition.pluralName = "FieldAgents";
    
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
      key: FieldAgent.FIRSTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.MIDDLENAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.LASTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.PHONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.PROFESSION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.QUALIFICATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.ADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.PAN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.PANIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.ACCOUNTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.BANKNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.IFSC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.ALTPHONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.FPOID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.FPONAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.ISMAPPED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.CHANGEDINITIALPASSWORD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.USERTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.ADDPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.EDITPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.DELETEPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.VIEWPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.ISACTIVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FieldAgent.USERID,
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

class _FieldAgentModelType extends amplify_core.ModelType<FieldAgent> {
  const _FieldAgentModelType();
  
  @override
  FieldAgent fromJson(Map<String, dynamic> jsonData) {
    return FieldAgent.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FieldAgent';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FieldAgent] in your schema.
 */
class FieldAgentModelIdentifier implements amplify_core.ModelIdentifier<FieldAgent> {
  final String id;

  /** Create an instance of FieldAgentModelIdentifier using [id] the primary key. */
  const FieldAgentModelIdentifier({
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
  String toString() => 'FieldAgentModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FieldAgentModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}