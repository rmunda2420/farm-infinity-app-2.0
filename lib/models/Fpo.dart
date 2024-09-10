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


/** This is an auto generated class representing the Fpo type in your schema. */
class Fpo extends amplify_core.Model {
  static const classType = const _FpoModelType();
  final String id;
  final List<FpoGrownCrop>? _FpoToFpoGrownCrops;
  final String? _constitution;
  final String? _entityName;
  final int? _noOfFarmers;
  final String? _address;
  final String? _state;
  final String? _district;
  final double? _areaOfOperation;
  final String? _establishmentYear;
  final double? _previousYearTurnover;
  final String? _contactPersonName;
  final String? _contactPersonPhone;
  final bool? _isPanCollected;
  final String? _panNumber;
  final String? _panImage;
  final bool? _isIncorporationDocCollected;
  final String? _incorporationDocImage;
  final bool? _isRegistrationNoCollected;
  final String? _registrationNoImage;
  final bool? _isDirectorShareHolderListCollected;
  final String? _directorShareHolderListImage;
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
  
  FpoModelIdentifier get modelIdentifier {
      return FpoModelIdentifier(
        id: id
      );
  }
  
  List<FpoGrownCrop>? get FpoToFpoGrownCrops {
    return _FpoToFpoGrownCrops;
  }
  
  String? get constitution {
    return _constitution;
  }
  
  String? get entityName {
    return _entityName;
  }
  
  int? get noOfFarmers {
    return _noOfFarmers;
  }
  
  String? get address {
    return _address;
  }
  
  String? get state {
    return _state;
  }
  
  String? get district {
    return _district;
  }
  
  double? get areaOfOperation {
    return _areaOfOperation;
  }
  
  String? get establishmentYear {
    return _establishmentYear;
  }
  
  double? get previousYearTurnover {
    return _previousYearTurnover;
  }
  
  String? get contactPersonName {
    return _contactPersonName;
  }
  
  String? get contactPersonPhone {
    return _contactPersonPhone;
  }
  
  bool? get isPanCollected {
    return _isPanCollected;
  }
  
  String? get panNumber {
    return _panNumber;
  }
  
  String? get panImage {
    return _panImage;
  }
  
  bool? get isIncorporationDocCollected {
    return _isIncorporationDocCollected;
  }
  
  String? get incorporationDocImage {
    return _incorporationDocImage;
  }
  
  bool? get isRegistrationNoCollected {
    return _isRegistrationNoCollected;
  }
  
  String? get registrationNoImage {
    return _registrationNoImage;
  }
  
  bool? get isDirectorShareHolderListCollected {
    return _isDirectorShareHolderListCollected;
  }
  
  String? get directorShareHolderListImage {
    return _directorShareHolderListImage;
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
  
  const Fpo._internal({required this.id, FpoToFpoGrownCrops, constitution, entityName, noOfFarmers, address, state, district, areaOfOperation, establishmentYear, previousYearTurnover, contactPersonName, contactPersonPhone, isPanCollected, panNumber, panImage, isIncorporationDocCollected, incorporationDocImage, isRegistrationNoCollected, registrationNoImage, isDirectorShareHolderListCollected, directorShareHolderListImage, changedInitialPassword, userTypeId, addPrivilege, editPrivilege, deletePrivilege, viewPrivilege, isActive, userId, createdAt, updatedAt}): _FpoToFpoGrownCrops = FpoToFpoGrownCrops, _constitution = constitution, _entityName = entityName, _noOfFarmers = noOfFarmers, _address = address, _state = state, _district = district, _areaOfOperation = areaOfOperation, _establishmentYear = establishmentYear, _previousYearTurnover = previousYearTurnover, _contactPersonName = contactPersonName, _contactPersonPhone = contactPersonPhone, _isPanCollected = isPanCollected, _panNumber = panNumber, _panImage = panImage, _isIncorporationDocCollected = isIncorporationDocCollected, _incorporationDocImage = incorporationDocImage, _isRegistrationNoCollected = isRegistrationNoCollected, _registrationNoImage = registrationNoImage, _isDirectorShareHolderListCollected = isDirectorShareHolderListCollected, _directorShareHolderListImage = directorShareHolderListImage, _changedInitialPassword = changedInitialPassword, _userTypeId = userTypeId, _addPrivilege = addPrivilege, _editPrivilege = editPrivilege, _deletePrivilege = deletePrivilege, _viewPrivilege = viewPrivilege, _isActive = isActive, _userId = userId, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Fpo({String? id, List<FpoGrownCrop>? FpoToFpoGrownCrops, String? constitution, String? entityName, int? noOfFarmers, String? address, String? state, String? district, double? areaOfOperation, String? establishmentYear, double? previousYearTurnover, String? contactPersonName, String? contactPersonPhone, bool? isPanCollected, String? panNumber, String? panImage, bool? isIncorporationDocCollected, String? incorporationDocImage, bool? isRegistrationNoCollected, String? registrationNoImage, bool? isDirectorShareHolderListCollected, String? directorShareHolderListImage, bool? changedInitialPassword, int? userTypeId, bool? addPrivilege, bool? editPrivilege, bool? deletePrivilege, bool? viewPrivilege, bool? isActive, String? userId}) {
    return Fpo._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      FpoToFpoGrownCrops: FpoToFpoGrownCrops != null ? List<FpoGrownCrop>.unmodifiable(FpoToFpoGrownCrops) : FpoToFpoGrownCrops,
      constitution: constitution,
      entityName: entityName,
      noOfFarmers: noOfFarmers,
      address: address,
      state: state,
      district: district,
      areaOfOperation: areaOfOperation,
      establishmentYear: establishmentYear,
      previousYearTurnover: previousYearTurnover,
      contactPersonName: contactPersonName,
      contactPersonPhone: contactPersonPhone,
      isPanCollected: isPanCollected,
      panNumber: panNumber,
      panImage: panImage,
      isIncorporationDocCollected: isIncorporationDocCollected,
      incorporationDocImage: incorporationDocImage,
      isRegistrationNoCollected: isRegistrationNoCollected,
      registrationNoImage: registrationNoImage,
      isDirectorShareHolderListCollected: isDirectorShareHolderListCollected,
      directorShareHolderListImage: directorShareHolderListImage,
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
    return other is Fpo &&
      id == other.id &&
      DeepCollectionEquality().equals(_FpoToFpoGrownCrops, other._FpoToFpoGrownCrops) &&
      _constitution == other._constitution &&
      _entityName == other._entityName &&
      _noOfFarmers == other._noOfFarmers &&
      _address == other._address &&
      _state == other._state &&
      _district == other._district &&
      _areaOfOperation == other._areaOfOperation &&
      _establishmentYear == other._establishmentYear &&
      _previousYearTurnover == other._previousYearTurnover &&
      _contactPersonName == other._contactPersonName &&
      _contactPersonPhone == other._contactPersonPhone &&
      _isPanCollected == other._isPanCollected &&
      _panNumber == other._panNumber &&
      _panImage == other._panImage &&
      _isIncorporationDocCollected == other._isIncorporationDocCollected &&
      _incorporationDocImage == other._incorporationDocImage &&
      _isRegistrationNoCollected == other._isRegistrationNoCollected &&
      _registrationNoImage == other._registrationNoImage &&
      _isDirectorShareHolderListCollected == other._isDirectorShareHolderListCollected &&
      _directorShareHolderListImage == other._directorShareHolderListImage &&
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
    
    buffer.write("Fpo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("constitution=" + "$_constitution" + ", ");
    buffer.write("entityName=" + "$_entityName" + ", ");
    buffer.write("noOfFarmers=" + (_noOfFarmers != null ? _noOfFarmers!.toString() : "null") + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("district=" + "$_district" + ", ");
    buffer.write("areaOfOperation=" + (_areaOfOperation != null ? _areaOfOperation!.toString() : "null") + ", ");
    buffer.write("establishmentYear=" + "$_establishmentYear" + ", ");
    buffer.write("previousYearTurnover=" + (_previousYearTurnover != null ? _previousYearTurnover!.toString() : "null") + ", ");
    buffer.write("contactPersonName=" + "$_contactPersonName" + ", ");
    buffer.write("contactPersonPhone=" + "$_contactPersonPhone" + ", ");
    buffer.write("isPanCollected=" + (_isPanCollected != null ? _isPanCollected!.toString() : "null") + ", ");
    buffer.write("panNumber=" + "$_panNumber" + ", ");
    buffer.write("panImage=" + "$_panImage" + ", ");
    buffer.write("isIncorporationDocCollected=" + (_isIncorporationDocCollected != null ? _isIncorporationDocCollected!.toString() : "null") + ", ");
    buffer.write("incorporationDocImage=" + "$_incorporationDocImage" + ", ");
    buffer.write("isRegistrationNoCollected=" + (_isRegistrationNoCollected != null ? _isRegistrationNoCollected!.toString() : "null") + ", ");
    buffer.write("registrationNoImage=" + "$_registrationNoImage" + ", ");
    buffer.write("isDirectorShareHolderListCollected=" + (_isDirectorShareHolderListCollected != null ? _isDirectorShareHolderListCollected!.toString() : "null") + ", ");
    buffer.write("directorShareHolderListImage=" + "$_directorShareHolderListImage" + ", ");
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
  
  Fpo copyWith({List<FpoGrownCrop>? FpoToFpoGrownCrops, String? constitution, String? entityName, int? noOfFarmers, String? address, String? state, String? district, double? areaOfOperation, String? establishmentYear, double? previousYearTurnover, String? contactPersonName, String? contactPersonPhone, bool? isPanCollected, String? panNumber, String? panImage, bool? isIncorporationDocCollected, String? incorporationDocImage, bool? isRegistrationNoCollected, String? registrationNoImage, bool? isDirectorShareHolderListCollected, String? directorShareHolderListImage, bool? changedInitialPassword, int? userTypeId, bool? addPrivilege, bool? editPrivilege, bool? deletePrivilege, bool? viewPrivilege, bool? isActive, String? userId}) {
    return Fpo._internal(
      id: id,
      FpoToFpoGrownCrops: FpoToFpoGrownCrops ?? this.FpoToFpoGrownCrops,
      constitution: constitution ?? this.constitution,
      entityName: entityName ?? this.entityName,
      noOfFarmers: noOfFarmers ?? this.noOfFarmers,
      address: address ?? this.address,
      state: state ?? this.state,
      district: district ?? this.district,
      areaOfOperation: areaOfOperation ?? this.areaOfOperation,
      establishmentYear: establishmentYear ?? this.establishmentYear,
      previousYearTurnover: previousYearTurnover ?? this.previousYearTurnover,
      contactPersonName: contactPersonName ?? this.contactPersonName,
      contactPersonPhone: contactPersonPhone ?? this.contactPersonPhone,
      isPanCollected: isPanCollected ?? this.isPanCollected,
      panNumber: panNumber ?? this.panNumber,
      panImage: panImage ?? this.panImage,
      isIncorporationDocCollected: isIncorporationDocCollected ?? this.isIncorporationDocCollected,
      incorporationDocImage: incorporationDocImage ?? this.incorporationDocImage,
      isRegistrationNoCollected: isRegistrationNoCollected ?? this.isRegistrationNoCollected,
      registrationNoImage: registrationNoImage ?? this.registrationNoImage,
      isDirectorShareHolderListCollected: isDirectorShareHolderListCollected ?? this.isDirectorShareHolderListCollected,
      directorShareHolderListImage: directorShareHolderListImage ?? this.directorShareHolderListImage,
      changedInitialPassword: changedInitialPassword ?? this.changedInitialPassword,
      userTypeId: userTypeId ?? this.userTypeId,
      addPrivilege: addPrivilege ?? this.addPrivilege,
      editPrivilege: editPrivilege ?? this.editPrivilege,
      deletePrivilege: deletePrivilege ?? this.deletePrivilege,
      viewPrivilege: viewPrivilege ?? this.viewPrivilege,
      isActive: isActive ?? this.isActive,
      userId: userId ?? this.userId);
  }
  
  Fpo copyWithModelFieldValues({
    ModelFieldValue<List<FpoGrownCrop>?>? FpoToFpoGrownCrops,
    ModelFieldValue<String?>? constitution,
    ModelFieldValue<String?>? entityName,
    ModelFieldValue<int?>? noOfFarmers,
    ModelFieldValue<String?>? address,
    ModelFieldValue<String?>? state,
    ModelFieldValue<String?>? district,
    ModelFieldValue<double?>? areaOfOperation,
    ModelFieldValue<String?>? establishmentYear,
    ModelFieldValue<double?>? previousYearTurnover,
    ModelFieldValue<String?>? contactPersonName,
    ModelFieldValue<String?>? contactPersonPhone,
    ModelFieldValue<bool?>? isPanCollected,
    ModelFieldValue<String?>? panNumber,
    ModelFieldValue<String?>? panImage,
    ModelFieldValue<bool?>? isIncorporationDocCollected,
    ModelFieldValue<String?>? incorporationDocImage,
    ModelFieldValue<bool?>? isRegistrationNoCollected,
    ModelFieldValue<String?>? registrationNoImage,
    ModelFieldValue<bool?>? isDirectorShareHolderListCollected,
    ModelFieldValue<String?>? directorShareHolderListImage,
    ModelFieldValue<bool?>? changedInitialPassword,
    ModelFieldValue<int?>? userTypeId,
    ModelFieldValue<bool?>? addPrivilege,
    ModelFieldValue<bool?>? editPrivilege,
    ModelFieldValue<bool?>? deletePrivilege,
    ModelFieldValue<bool?>? viewPrivilege,
    ModelFieldValue<bool?>? isActive,
    ModelFieldValue<String?>? userId
  }) {
    return Fpo._internal(
      id: id,
      FpoToFpoGrownCrops: FpoToFpoGrownCrops == null ? this.FpoToFpoGrownCrops : FpoToFpoGrownCrops.value,
      constitution: constitution == null ? this.constitution : constitution.value,
      entityName: entityName == null ? this.entityName : entityName.value,
      noOfFarmers: noOfFarmers == null ? this.noOfFarmers : noOfFarmers.value,
      address: address == null ? this.address : address.value,
      state: state == null ? this.state : state.value,
      district: district == null ? this.district : district.value,
      areaOfOperation: areaOfOperation == null ? this.areaOfOperation : areaOfOperation.value,
      establishmentYear: establishmentYear == null ? this.establishmentYear : establishmentYear.value,
      previousYearTurnover: previousYearTurnover == null ? this.previousYearTurnover : previousYearTurnover.value,
      contactPersonName: contactPersonName == null ? this.contactPersonName : contactPersonName.value,
      contactPersonPhone: contactPersonPhone == null ? this.contactPersonPhone : contactPersonPhone.value,
      isPanCollected: isPanCollected == null ? this.isPanCollected : isPanCollected.value,
      panNumber: panNumber == null ? this.panNumber : panNumber.value,
      panImage: panImage == null ? this.panImage : panImage.value,
      isIncorporationDocCollected: isIncorporationDocCollected == null ? this.isIncorporationDocCollected : isIncorporationDocCollected.value,
      incorporationDocImage: incorporationDocImage == null ? this.incorporationDocImage : incorporationDocImage.value,
      isRegistrationNoCollected: isRegistrationNoCollected == null ? this.isRegistrationNoCollected : isRegistrationNoCollected.value,
      registrationNoImage: registrationNoImage == null ? this.registrationNoImage : registrationNoImage.value,
      isDirectorShareHolderListCollected: isDirectorShareHolderListCollected == null ? this.isDirectorShareHolderListCollected : isDirectorShareHolderListCollected.value,
      directorShareHolderListImage: directorShareHolderListImage == null ? this.directorShareHolderListImage : directorShareHolderListImage.value,
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
  
  Fpo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _FpoToFpoGrownCrops = json['FpoToFpoGrownCrops']  is Map
        ? (json['FpoToFpoGrownCrops']['items'] is List
          ? (json['FpoToFpoGrownCrops']['items'] as List)
              .where((e) => e != null)
              .map((e) => FpoGrownCrop.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['FpoToFpoGrownCrops'] is List
          ? (json['FpoToFpoGrownCrops'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => FpoGrownCrop.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _constitution = json['constitution'],
      _entityName = json['entityName'],
      _noOfFarmers = (json['noOfFarmers'] as num?)?.toInt(),
      _address = json['address'],
      _state = json['state'],
      _district = json['district'],
      _areaOfOperation = (json['areaOfOperation'] as num?)?.toDouble(),
      _establishmentYear = json['establishmentYear'],
      _previousYearTurnover = (json['previousYearTurnover'] as num?)?.toDouble(),
      _contactPersonName = json['contactPersonName'],
      _contactPersonPhone = json['contactPersonPhone'],
      _isPanCollected = json['isPanCollected'],
      _panNumber = json['panNumber'],
      _panImage = json['panImage'],
      _isIncorporationDocCollected = json['isIncorporationDocCollected'],
      _incorporationDocImage = json['incorporationDocImage'],
      _isRegistrationNoCollected = json['isRegistrationNoCollected'],
      _registrationNoImage = json['registrationNoImage'],
      _isDirectorShareHolderListCollected = json['isDirectorShareHolderListCollected'],
      _directorShareHolderListImage = json['directorShareHolderListImage'],
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
    'id': id, 'FpoToFpoGrownCrops': _FpoToFpoGrownCrops?.map((FpoGrownCrop? e) => e?.toJson()).toList(), 'constitution': _constitution, 'entityName': _entityName, 'noOfFarmers': _noOfFarmers, 'address': _address, 'state': _state, 'district': _district, 'areaOfOperation': _areaOfOperation, 'establishmentYear': _establishmentYear, 'previousYearTurnover': _previousYearTurnover, 'contactPersonName': _contactPersonName, 'contactPersonPhone': _contactPersonPhone, 'isPanCollected': _isPanCollected, 'panNumber': _panNumber, 'panImage': _panImage, 'isIncorporationDocCollected': _isIncorporationDocCollected, 'incorporationDocImage': _incorporationDocImage, 'isRegistrationNoCollected': _isRegistrationNoCollected, 'registrationNoImage': _registrationNoImage, 'isDirectorShareHolderListCollected': _isDirectorShareHolderListCollected, 'directorShareHolderListImage': _directorShareHolderListImage, 'changedInitialPassword': _changedInitialPassword, 'userTypeId': _userTypeId, 'addPrivilege': _addPrivilege, 'editPrivilege': _editPrivilege, 'deletePrivilege': _deletePrivilege, 'viewPrivilege': _viewPrivilege, 'isActive': _isActive, 'userId': _userId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'FpoToFpoGrownCrops': _FpoToFpoGrownCrops,
    'constitution': _constitution,
    'entityName': _entityName,
    'noOfFarmers': _noOfFarmers,
    'address': _address,
    'state': _state,
    'district': _district,
    'areaOfOperation': _areaOfOperation,
    'establishmentYear': _establishmentYear,
    'previousYearTurnover': _previousYearTurnover,
    'contactPersonName': _contactPersonName,
    'contactPersonPhone': _contactPersonPhone,
    'isPanCollected': _isPanCollected,
    'panNumber': _panNumber,
    'panImage': _panImage,
    'isIncorporationDocCollected': _isIncorporationDocCollected,
    'incorporationDocImage': _incorporationDocImage,
    'isRegistrationNoCollected': _isRegistrationNoCollected,
    'registrationNoImage': _registrationNoImage,
    'isDirectorShareHolderListCollected': _isDirectorShareHolderListCollected,
    'directorShareHolderListImage': _directorShareHolderListImage,
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

  static final amplify_core.QueryModelIdentifier<FpoModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FpoModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FPOTOFPOGROWNCROPS = amplify_core.QueryField(
    fieldName: "FpoToFpoGrownCrops",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FpoGrownCrop'));
  static final CONSTITUTION = amplify_core.QueryField(fieldName: "constitution");
  static final ENTITYNAME = amplify_core.QueryField(fieldName: "entityName");
  static final NOOFFARMERS = amplify_core.QueryField(fieldName: "noOfFarmers");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final STATE = amplify_core.QueryField(fieldName: "state");
  static final DISTRICT = amplify_core.QueryField(fieldName: "district");
  static final AREAOFOPERATION = amplify_core.QueryField(fieldName: "areaOfOperation");
  static final ESTABLISHMENTYEAR = amplify_core.QueryField(fieldName: "establishmentYear");
  static final PREVIOUSYEARTURNOVER = amplify_core.QueryField(fieldName: "previousYearTurnover");
  static final CONTACTPERSONNAME = amplify_core.QueryField(fieldName: "contactPersonName");
  static final CONTACTPERSONPHONE = amplify_core.QueryField(fieldName: "contactPersonPhone");
  static final ISPANCOLLECTED = amplify_core.QueryField(fieldName: "isPanCollected");
  static final PANNUMBER = amplify_core.QueryField(fieldName: "panNumber");
  static final PANIMAGE = amplify_core.QueryField(fieldName: "panImage");
  static final ISINCORPORATIONDOCCOLLECTED = amplify_core.QueryField(fieldName: "isIncorporationDocCollected");
  static final INCORPORATIONDOCIMAGE = amplify_core.QueryField(fieldName: "incorporationDocImage");
  static final ISREGISTRATIONNOCOLLECTED = amplify_core.QueryField(fieldName: "isRegistrationNoCollected");
  static final REGISTRATIONNOIMAGE = amplify_core.QueryField(fieldName: "registrationNoImage");
  static final ISDIRECTORSHAREHOLDERLISTCOLLECTED = amplify_core.QueryField(fieldName: "isDirectorShareHolderListCollected");
  static final DIRECTORSHAREHOLDERLISTIMAGE = amplify_core.QueryField(fieldName: "directorShareHolderListImage");
  static final CHANGEDINITIALPASSWORD = amplify_core.QueryField(fieldName: "changedInitialPassword");
  static final USERTYPEID = amplify_core.QueryField(fieldName: "userTypeId");
  static final ADDPRIVILEGE = amplify_core.QueryField(fieldName: "addPrivilege");
  static final EDITPRIVILEGE = amplify_core.QueryField(fieldName: "editPrivilege");
  static final DELETEPRIVILEGE = amplify_core.QueryField(fieldName: "deletePrivilege");
  static final VIEWPRIVILEGE = amplify_core.QueryField(fieldName: "viewPrivilege");
  static final ISACTIVE = amplify_core.QueryField(fieldName: "isActive");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Fpo";
    modelSchemaDefinition.pluralName = "Fpos";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Fpo.FPOTOFPOGROWNCROPS,
      isRequired: false,
      ofModelName: 'FpoGrownCrop',
      associatedKey: FpoGrownCrop.FPOID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.CONSTITUTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ENTITYNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.NOOFFARMERS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.STATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.DISTRICT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.AREAOFOPERATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ESTABLISHMENTYEAR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.PREVIOUSYEARTURNOVER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.CONTACTPERSONNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.CONTACTPERSONPHONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ISPANCOLLECTED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.PANNUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.PANIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ISINCORPORATIONDOCCOLLECTED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.INCORPORATIONDOCIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ISREGISTRATIONNOCOLLECTED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.REGISTRATIONNOIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ISDIRECTORSHAREHOLDERLISTCOLLECTED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.DIRECTORSHAREHOLDERLISTIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.CHANGEDINITIALPASSWORD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.USERTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ADDPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.EDITPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.DELETEPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.VIEWPRIVILEGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.ISACTIVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Fpo.USERID,
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

class _FpoModelType extends amplify_core.ModelType<Fpo> {
  const _FpoModelType();
  
  @override
  Fpo fromJson(Map<String, dynamic> jsonData) {
    return Fpo.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Fpo';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Fpo] in your schema.
 */
class FpoModelIdentifier implements amplify_core.ModelIdentifier<Fpo> {
  final String id;

  /** Create an instance of FpoModelIdentifier using [id] the primary key. */
  const FpoModelIdentifier({
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
  String toString() => 'FpoModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FpoModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}