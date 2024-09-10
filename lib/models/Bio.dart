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


/** This is an auto generated class representing the Bio type in your schema. */
class Bio extends amplify_core.Model {
  static const classType = const _BioModelType();
  final String id;
  final String? _name;
  final String? _dob;
  final String? _email;
  final String? _altPhone;
  final String? _fullAddress;
  final String? _village;
  final String? _district;
  final String? _city;
  final String? _state;
  final String? _pin;
  final String? _profilePicUrl;
  final bool? _isComplete;
  final int? _version;
  final List<FamilyMemberBio>? _familymembers;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  BioModelIdentifier get modelIdentifier {
      return BioModelIdentifier(
        id: id
      );
  }
  
  String? get name {
    return _name;
  }
  
  String? get dob {
    return _dob;
  }
  
  String? get email {
    return _email;
  }
  
  String? get altPhone {
    return _altPhone;
  }
  
  String? get fullAddress {
    return _fullAddress;
  }
  
  String? get village {
    return _village;
  }
  
  String? get district {
    return _district;
  }
  
  String? get city {
    return _city;
  }
  
  String? get state {
    return _state;
  }
  
  String? get pin {
    return _pin;
  }
  
  String? get profilePicUrl {
    return _profilePicUrl;
  }
  
  bool get isComplete {
    try {
      return _isComplete!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get version {
    return _version;
  }
  
  List<FamilyMemberBio>? get familymembers {
    return _familymembers;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Bio._internal({required this.id, name, dob, email, altPhone, fullAddress, village, district, city, state, pin, profilePicUrl, required isComplete, version, familymembers, createdAt, updatedAt}): _name = name, _dob = dob, _email = email, _altPhone = altPhone, _fullAddress = fullAddress, _village = village, _district = district, _city = city, _state = state, _pin = pin, _profilePicUrl = profilePicUrl, _isComplete = isComplete, _version = version, _familymembers = familymembers, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Bio({String? id, String? name, String? dob, String? email, String? altPhone, String? fullAddress, String? village, String? district, String? city, String? state, String? pin, String? profilePicUrl, required bool isComplete, int? version, List<FamilyMemberBio>? familymembers}) {
    return Bio._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      dob: dob,
      email: email,
      altPhone: altPhone,
      fullAddress: fullAddress,
      village: village,
      district: district,
      city: city,
      state: state,
      pin: pin,
      profilePicUrl: profilePicUrl,
      isComplete: isComplete,
      version: version,
      familymembers: familymembers != null ? List<FamilyMemberBio>.unmodifiable(familymembers) : familymembers);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bio &&
      id == other.id &&
      _name == other._name &&
      _dob == other._dob &&
      _email == other._email &&
      _altPhone == other._altPhone &&
      _fullAddress == other._fullAddress &&
      _village == other._village &&
      _district == other._district &&
      _city == other._city &&
      _state == other._state &&
      _pin == other._pin &&
      _profilePicUrl == other._profilePicUrl &&
      _isComplete == other._isComplete &&
      _version == other._version &&
      DeepCollectionEquality().equals(_familymembers, other._familymembers);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Bio {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("dob=" + "$_dob" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("altPhone=" + "$_altPhone" + ", ");
    buffer.write("fullAddress=" + "$_fullAddress" + ", ");
    buffer.write("village=" + "$_village" + ", ");
    buffer.write("district=" + "$_district" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("pin=" + "$_pin" + ", ");
    buffer.write("profilePicUrl=" + "$_profilePicUrl" + ", ");
    buffer.write("isComplete=" + (_isComplete != null ? _isComplete!.toString() : "null") + ", ");
    buffer.write("version=" + (_version != null ? _version!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Bio copyWith({String? name, String? dob, String? email, String? altPhone, String? fullAddress, String? village, String? district, String? city, String? state, String? pin, String? profilePicUrl, bool? isComplete, int? version, List<FamilyMemberBio>? familymembers}) {
    return Bio._internal(
      id: id,
      name: name ?? this.name,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      altPhone: altPhone ?? this.altPhone,
      fullAddress: fullAddress ?? this.fullAddress,
      village: village ?? this.village,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
      pin: pin ?? this.pin,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      isComplete: isComplete ?? this.isComplete,
      version: version ?? this.version,
      familymembers: familymembers ?? this.familymembers);
  }
  
  Bio copyWithModelFieldValues({
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? dob,
    ModelFieldValue<String?>? email,
    ModelFieldValue<String?>? altPhone,
    ModelFieldValue<String?>? fullAddress,
    ModelFieldValue<String?>? village,
    ModelFieldValue<String?>? district,
    ModelFieldValue<String?>? city,
    ModelFieldValue<String?>? state,
    ModelFieldValue<String?>? pin,
    ModelFieldValue<String?>? profilePicUrl,
    ModelFieldValue<bool>? isComplete,
    ModelFieldValue<int?>? version,
    ModelFieldValue<List<FamilyMemberBio>?>? familymembers
  }) {
    return Bio._internal(
      id: id,
      name: name == null ? this.name : name.value,
      dob: dob == null ? this.dob : dob.value,
      email: email == null ? this.email : email.value,
      altPhone: altPhone == null ? this.altPhone : altPhone.value,
      fullAddress: fullAddress == null ? this.fullAddress : fullAddress.value,
      village: village == null ? this.village : village.value,
      district: district == null ? this.district : district.value,
      city: city == null ? this.city : city.value,
      state: state == null ? this.state : state.value,
      pin: pin == null ? this.pin : pin.value,
      profilePicUrl: profilePicUrl == null ? this.profilePicUrl : profilePicUrl.value,
      isComplete: isComplete == null ? this.isComplete : isComplete.value,
      version: version == null ? this.version : version.value,
      familymembers: familymembers == null ? this.familymembers : familymembers.value
    );
  }
  
  Bio.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _dob = json['dob'],
      _email = json['email'],
      _altPhone = json['altPhone'],
      _fullAddress = json['fullAddress'],
      _village = json['village'],
      _district = json['district'],
      _city = json['city'],
      _state = json['state'],
      _pin = json['pin'],
      _profilePicUrl = json['profilePicUrl'],
      _isComplete = json['isComplete'],
      _version = (json['version'] as num?)?.toInt(),
      _familymembers = json['familymembers']  is Map
        ? (json['familymembers']['items'] is List
          ? (json['familymembers']['items'] as List)
              .where((e) => e != null)
              .map((e) => FamilyMemberBio.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['familymembers'] is List
          ? (json['familymembers'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => FamilyMemberBio.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'dob': _dob, 'email': _email, 'altPhone': _altPhone, 'fullAddress': _fullAddress, 'village': _village, 'district': _district, 'city': _city, 'state': _state, 'pin': _pin, 'profilePicUrl': _profilePicUrl, 'isComplete': _isComplete, 'version': _version, 'familymembers': _familymembers?.map((FamilyMemberBio? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'dob': _dob,
    'email': _email,
    'altPhone': _altPhone,
    'fullAddress': _fullAddress,
    'village': _village,
    'district': _district,
    'city': _city,
    'state': _state,
    'pin': _pin,
    'profilePicUrl': _profilePicUrl,
    'isComplete': _isComplete,
    'version': _version,
    'familymembers': _familymembers,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<BioModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<BioModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final DOB = amplify_core.QueryField(fieldName: "dob");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final ALTPHONE = amplify_core.QueryField(fieldName: "altPhone");
  static final FULLADDRESS = amplify_core.QueryField(fieldName: "fullAddress");
  static final VILLAGE = amplify_core.QueryField(fieldName: "village");
  static final DISTRICT = amplify_core.QueryField(fieldName: "district");
  static final CITY = amplify_core.QueryField(fieldName: "city");
  static final STATE = amplify_core.QueryField(fieldName: "state");
  static final PIN = amplify_core.QueryField(fieldName: "pin");
  static final PROFILEPICURL = amplify_core.QueryField(fieldName: "profilePicUrl");
  static final ISCOMPLETE = amplify_core.QueryField(fieldName: "isComplete");
  static final VERSION = amplify_core.QueryField(fieldName: "version");
  static final FAMILYMEMBERS = amplify_core.QueryField(
    fieldName: "familymembers",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FamilyMemberBio'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Bio";
    modelSchemaDefinition.pluralName = "Bios";
    
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
      key: Bio.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.DOB,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.ALTPHONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.FULLADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.VILLAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.DISTRICT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.CITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.STATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.PIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.PROFILEPICURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.ISCOMPLETE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Bio.VERSION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Bio.FAMILYMEMBERS,
      isRequired: false,
      ofModelName: 'FamilyMemberBio',
      associatedKey: FamilyMemberBio.BIO
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

class _BioModelType extends amplify_core.ModelType<Bio> {
  const _BioModelType();
  
  @override
  Bio fromJson(Map<String, dynamic> jsonData) {
    return Bio.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Bio';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Bio] in your schema.
 */
class BioModelIdentifier implements amplify_core.ModelIdentifier<Bio> {
  final String id;

  /** Create an instance of BioModelIdentifier using [id] the primary key. */
  const BioModelIdentifier({
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
  String toString() => 'BioModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is BioModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}