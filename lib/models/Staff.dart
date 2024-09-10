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


/** This is an auto generated class representing the Staff type in your schema. */
class Staff extends amplify_core.Model {
  static const classType = const _StaffModelType();
  final String id;
  final String? _firstName;
  final String? _middleName;
  final String? _lastName;
  final String? _phone;
  final String? _email;
  final String? _designation;
  final bool? _isSuperAdmin;
  final bool? _isAdmin;
  final bool? _addPrivilege;
  final bool? _editPrivilege;
  final bool? _deletePrivilege;
  final bool? _viewPrivilege;
  final bool? _changedInitialPassword;
  final int? _userTypeId;
  final bool? _isActive;
  final String? _userId;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  StaffModelIdentifier get modelIdentifier {
      return StaffModelIdentifier(
        id: id
      );
  }
  
  String get firstName {
    try {
      return _firstName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get middleName {
    return _middleName;
  }
  
  String get lastName {
    try {
      return _lastName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get phone {
    try {
      return _phone!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get designation {
    return _designation;
  }
  
  bool? get isSuperAdmin {
    return _isSuperAdmin;
  }
  
  bool? get isAdmin {
    return _isAdmin;
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
  
  bool? get changedInitialPassword {
    return _changedInitialPassword;
  }
  
  int? get userTypeId {
    return _userTypeId;
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
  
  const Staff._internal({required this.id, required firstName, middleName, required lastName, required phone, required email, designation, isSuperAdmin, isAdmin, addPrivilege, editPrivilege, deletePrivilege, viewPrivilege, changedInitialPassword, userTypeId, isActive, userId, createdAt, updatedAt}): _firstName = firstName, _middleName = middleName, _lastName = lastName, _phone = phone, _email = email, _designation = designation, _isSuperAdmin = isSuperAdmin, _isAdmin = isAdmin, _addPrivilege = addPrivilege, _editPrivilege = editPrivilege, _deletePrivilege = deletePrivilege, _viewPrivilege = viewPrivilege, _changedInitialPassword = changedInitialPassword, _userTypeId = userTypeId, _isActive = isActive, _userId = userId, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Staff({String? id, required String firstName, String? middleName, required String lastName, required String phone, required String email, String? designation, bool? isSuperAdmin, bool? isAdmin, bool? addPrivilege, bool? editPrivilege, bool? deletePrivilege, bool? viewPrivilege, bool? changedInitialPassword, int? userTypeId, bool? isActive, String? userId}) {
    return Staff._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      phone: phone,
      email: email,
      designation: designation,
      isSuperAdmin: isSuperAdmin,
      isAdmin: isAdmin,
      addPrivilege: addPrivilege,
      editPrivilege: editPrivilege,
      deletePrivilege: deletePrivilege,
      viewPrivilege: viewPrivilege,
      changedInitialPassword: changedInitialPassword,
      userTypeId: userTypeId,
      isActive: isActive,
      userId: userId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Staff &&
      id == other.id &&
      _firstName == other._firstName &&
      _middleName == other._middleName &&
      _lastName == other._lastName &&
      _phone == other._phone &&
      _email == other._email &&
      _designation == other._designation &&
      _isSuperAdmin == other._isSuperAdmin &&
      _isAdmin == other._isAdmin &&
      _addPrivilege == other._addPrivilege &&
      _editPrivilege == other._editPrivilege &&
      _deletePrivilege == other._deletePrivilege &&
      _viewPrivilege == other._viewPrivilege &&
      _changedInitialPassword == other._changedInitialPassword &&
      _userTypeId == other._userTypeId &&
      _isActive == other._isActive &&
      _userId == other._userId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Staff {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("middleName=" + "$_middleName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("designation=" + "$_designation" + ", ");
    buffer.write("isSuperAdmin=" + (_isSuperAdmin != null ? _isSuperAdmin!.toString() : "null") + ", ");
    buffer.write("isAdmin=" + (_isAdmin != null ? _isAdmin!.toString() : "null") + ", ");
    buffer.write("addPrivilege=" + (_addPrivilege != null ? _addPrivilege!.toString() : "null") + ", ");
    buffer.write("editPrivilege=" + (_editPrivilege != null ? _editPrivilege!.toString() : "null") + ", ");
    buffer.write("deletePrivilege=" + (_deletePrivilege != null ? _deletePrivilege!.toString() : "null") + ", ");
    buffer.write("viewPrivilege=" + (_viewPrivilege != null ? _viewPrivilege!.toString() : "null") + ", ");
    buffer.write("changedInitialPassword=" + (_changedInitialPassword != null ? _changedInitialPassword!.toString() : "null") + ", ");
    buffer.write("userTypeId=" + (_userTypeId != null ? _userTypeId!.toString() : "null") + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Staff copyWith({String? firstName, String? middleName, String? lastName, String? phone, String? email, String? designation, bool? isSuperAdmin, bool? isAdmin, bool? addPrivilege, bool? editPrivilege, bool? deletePrivilege, bool? viewPrivilege, bool? changedInitialPassword, int? userTypeId, bool? isActive, String? userId}) {
    return Staff._internal(
      id: id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      designation: designation ?? this.designation,
      isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
      isAdmin: isAdmin ?? this.isAdmin,
      addPrivilege: addPrivilege ?? this.addPrivilege,
      editPrivilege: editPrivilege ?? this.editPrivilege,
      deletePrivilege: deletePrivilege ?? this.deletePrivilege,
      viewPrivilege: viewPrivilege ?? this.viewPrivilege,
      changedInitialPassword: changedInitialPassword ?? this.changedInitialPassword,
      userTypeId: userTypeId ?? this.userTypeId,
      isActive: isActive ?? this.isActive,
      userId: userId ?? this.userId);
  }
  
  Staff copyWithModelFieldValues({
    ModelFieldValue<String>? firstName,
    ModelFieldValue<String?>? middleName,
    ModelFieldValue<String>? lastName,
    ModelFieldValue<String>? phone,
    ModelFieldValue<String>? email,
    ModelFieldValue<String?>? designation,
    ModelFieldValue<bool?>? isSuperAdmin,
    ModelFieldValue<bool?>? isAdmin,
    ModelFieldValue<bool?>? addPrivilege,
    ModelFieldValue<bool?>? editPrivilege,
    ModelFieldValue<bool?>? deletePrivilege,
    ModelFieldValue<bool?>? viewPrivilege,
    ModelFieldValue<bool?>? changedInitialPassword,
    ModelFieldValue<int?>? userTypeId,
    ModelFieldValue<bool?>? isActive,
    ModelFieldValue<String?>? userId
  }) {
    return Staff._internal(
      id: id,
      firstName: firstName == null ? this.firstName : firstName.value,
      middleName: middleName == null ? this.middleName : middleName.value,
      lastName: lastName == null ? this.lastName : lastName.value,
      phone: phone == null ? this.phone : phone.value,
      email: email == null ? this.email : email.value,
      designation: designation == null ? this.designation : designation.value,
      isSuperAdmin: isSuperAdmin == null ? this.isSuperAdmin : isSuperAdmin.value,
      isAdmin: isAdmin == null ? this.isAdmin : isAdmin.value,
      addPrivilege: addPrivilege == null ? this.addPrivilege : addPrivilege.value,
      editPrivilege: editPrivilege == null ? this.editPrivilege : editPrivilege.value,
      deletePrivilege: deletePrivilege == null ? this.deletePrivilege : deletePrivilege.value,
      viewPrivilege: viewPrivilege == null ? this.viewPrivilege : viewPrivilege.value,
      changedInitialPassword: changedInitialPassword == null ? this.changedInitialPassword : changedInitialPassword.value,
      userTypeId: userTypeId == null ? this.userTypeId : userTypeId.value,
      isActive: isActive == null ? this.isActive : isActive.value,
      userId: userId == null ? this.userId : userId.value
    );
  }
  
  Staff.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _firstName = json['firstName'],
      _middleName = json['middleName'],
      _lastName = json['lastName'],
      _phone = json['phone'],
      _email = json['email'],
      _designation = json['designation'],
      _isSuperAdmin = json['isSuperAdmin'],
      _isAdmin = json['isAdmin'],
      _addPrivilege = json['addPrivilege'],
      _editPrivilege = json['editPrivilege'],
      _deletePrivilege = json['deletePrivilege'],
      _viewPrivilege = json['viewPrivilege'],
      _changedInitialPassword = json['changedInitialPassword'],
      _userTypeId = (json['userTypeId'] as num?)?.toInt(),
      _isActive = json['isActive'],
      _userId = json['userId'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'firstName': _firstName, 'middleName': _middleName, 'lastName': _lastName, 'phone': _phone, 'email': _email, 'designation': _designation, 'isSuperAdmin': _isSuperAdmin, 'isAdmin': _isAdmin, 'addPrivilege': _addPrivilege, 'editPrivilege': _editPrivilege, 'deletePrivilege': _deletePrivilege, 'viewPrivilege': _viewPrivilege, 'changedInitialPassword': _changedInitialPassword, 'userTypeId': _userTypeId, 'isActive': _isActive, 'userId': _userId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'firstName': _firstName,
    'middleName': _middleName,
    'lastName': _lastName,
    'phone': _phone,
    'email': _email,
    'designation': _designation,
    'isSuperAdmin': _isSuperAdmin,
    'isAdmin': _isAdmin,
    'addPrivilege': _addPrivilege,
    'editPrivilege': _editPrivilege,
    'deletePrivilege': _deletePrivilege,
    'viewPrivilege': _viewPrivilege,
    'changedInitialPassword': _changedInitialPassword,
    'userTypeId': _userTypeId,
    'isActive': _isActive,
    'userId': _userId,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<StaffModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<StaffModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FIRSTNAME = amplify_core.QueryField(fieldName: "firstName");
  static final MIDDLENAME = amplify_core.QueryField(fieldName: "middleName");
  static final LASTNAME = amplify_core.QueryField(fieldName: "lastName");
  static final PHONE = amplify_core.QueryField(fieldName: "phone");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final DESIGNATION = amplify_core.QueryField(fieldName: "designation");
  static final ISSUPERADMIN = amplify_core.QueryField(fieldName: "isSuperAdmin");
  static final ISADMIN = amplify_core.QueryField(fieldName: "isAdmin");
  static final ADDPRIVILEGE = amplify_core.QueryField(fieldName: "addPrivilege");
  static final EDITPRIVILEGE = amplify_core.QueryField(fieldName: "editPrivilege");
  static final DELETEPRIVILEGE = amplify_core.QueryField(fieldName: "deletePrivilege");
  static final VIEWPRIVILEGE = amplify_core.QueryField(fieldName: "viewPrivilege");
  static final CHANGEDINITIALPASSWORD = amplify_core.QueryField(fieldName: "changedInitialPassword");
  static final USERTYPEID = amplify_core.QueryField(fieldName: "userTypeId");
  static final ISACTIVE = amplify_core.QueryField(fieldName: "isActive");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Staff";
    modelSchemaDefinition.pluralName = "Staff";
    
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
      key: Staff.FIRSTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.MIDDLENAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.LASTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.PHONE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.DESIGNATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.ISSUPERADMIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.ISADMIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.ADDPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.EDITPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.DELETEPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.VIEWPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.CHANGEDINITIALPASSWORD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.USERTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.ISACTIVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Staff.USERID,
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

class _StaffModelType extends amplify_core.ModelType<Staff> {
  const _StaffModelType();
  
  @override
  Staff fromJson(Map<String, dynamic> jsonData) {
    return Staff.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Staff';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Staff] in your schema.
 */
class StaffModelIdentifier implements amplify_core.ModelIdentifier<Staff> {
  final String id;

  /** Create an instance of StaffModelIdentifier using [id] the primary key. */
  const StaffModelIdentifier({
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
  String toString() => 'StaffModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is StaffModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}