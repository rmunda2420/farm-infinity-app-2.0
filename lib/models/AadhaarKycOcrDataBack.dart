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


/** This is an auto generated class representing the AadhaarKycOcrDataBack type in your schema. */
class AadhaarKycOcrDataBack extends amplify_core.Model {
  static const classType = const _AadhaarKycOcrDataBackModelType();
  final String id;
  final String? _documentType;
  final String? _subType;
  final String? _number;
  final String? _addressFull;
  final String? _pin;
  final String? _building;
  final String? _city;
  final String? _district;
  final String? _floor;
  final String? _house;
  final String? _locality;
  final String? _state;
  final String? _street;
  final String? _complex;
  final String? _landmark;
  final String? _relation;
  final String? _name;
  final String? _numberCS;
  final String? _addressCS;
  final String? _pinCS;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AadhaarKycOcrDataBackModelIdentifier get modelIdentifier {
      return AadhaarKycOcrDataBackModelIdentifier(
        id: id
      );
  }
  
  String? get documentType {
    return _documentType;
  }
  
  String? get subType {
    return _subType;
  }
  
  String? get number {
    return _number;
  }
  
  String? get addressFull {
    return _addressFull;
  }
  
  String? get pin {
    return _pin;
  }
  
  String? get building {
    return _building;
  }
  
  String? get city {
    return _city;
  }
  
  String? get district {
    return _district;
  }
  
  String? get floor {
    return _floor;
  }
  
  String? get house {
    return _house;
  }
  
  String? get locality {
    return _locality;
  }
  
  String? get state {
    return _state;
  }
  
  String? get street {
    return _street;
  }
  
  String? get complex {
    return _complex;
  }
  
  String? get landmark {
    return _landmark;
  }
  
  String? get relation {
    return _relation;
  }
  
  String? get name {
    return _name;
  }
  
  String? get numberCS {
    return _numberCS;
  }
  
  String? get addressCS {
    return _addressCS;
  }
  
  String? get pinCS {
    return _pinCS;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const AadhaarKycOcrDataBack._internal({required this.id, documentType, subType, number, addressFull, pin, building, city, district, floor, house, locality, state, street, complex, landmark, relation, name, numberCS, addressCS, pinCS, createdAt, updatedAt}): _documentType = documentType, _subType = subType, _number = number, _addressFull = addressFull, _pin = pin, _building = building, _city = city, _district = district, _floor = floor, _house = house, _locality = locality, _state = state, _street = street, _complex = complex, _landmark = landmark, _relation = relation, _name = name, _numberCS = numberCS, _addressCS = addressCS, _pinCS = pinCS, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory AadhaarKycOcrDataBack({String? id, String? documentType, String? subType, String? number, String? addressFull, String? pin, String? building, String? city, String? district, String? floor, String? house, String? locality, String? state, String? street, String? complex, String? landmark, String? relation, String? name, String? numberCS, String? addressCS, String? pinCS}) {
    return AadhaarKycOcrDataBack._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      documentType: documentType,
      subType: subType,
      number: number,
      addressFull: addressFull,
      pin: pin,
      building: building,
      city: city,
      district: district,
      floor: floor,
      house: house,
      locality: locality,
      state: state,
      street: street,
      complex: complex,
      landmark: landmark,
      relation: relation,
      name: name,
      numberCS: numberCS,
      addressCS: addressCS,
      pinCS: pinCS);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AadhaarKycOcrDataBack &&
      id == other.id &&
      _documentType == other._documentType &&
      _subType == other._subType &&
      _number == other._number &&
      _addressFull == other._addressFull &&
      _pin == other._pin &&
      _building == other._building &&
      _city == other._city &&
      _district == other._district &&
      _floor == other._floor &&
      _house == other._house &&
      _locality == other._locality &&
      _state == other._state &&
      _street == other._street &&
      _complex == other._complex &&
      _landmark == other._landmark &&
      _relation == other._relation &&
      _name == other._name &&
      _numberCS == other._numberCS &&
      _addressCS == other._addressCS &&
      _pinCS == other._pinCS;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AadhaarKycOcrDataBack {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("documentType=" + "$_documentType" + ", ");
    buffer.write("subType=" + "$_subType" + ", ");
    buffer.write("number=" + "$_number" + ", ");
    buffer.write("addressFull=" + "$_addressFull" + ", ");
    buffer.write("pin=" + "$_pin" + ", ");
    buffer.write("building=" + "$_building" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("district=" + "$_district" + ", ");
    buffer.write("floor=" + "$_floor" + ", ");
    buffer.write("house=" + "$_house" + ", ");
    buffer.write("locality=" + "$_locality" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("street=" + "$_street" + ", ");
    buffer.write("complex=" + "$_complex" + ", ");
    buffer.write("landmark=" + "$_landmark" + ", ");
    buffer.write("relation=" + "$_relation" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("numberCS=" + "$_numberCS" + ", ");
    buffer.write("addressCS=" + "$_addressCS" + ", ");
    buffer.write("pinCS=" + "$_pinCS" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AadhaarKycOcrDataBack copyWith({String? documentType, String? subType, String? number, String? addressFull, String? pin, String? building, String? city, String? district, String? floor, String? house, String? locality, String? state, String? street, String? complex, String? landmark, String? relation, String? name, String? numberCS, String? addressCS, String? pinCS}) {
    return AadhaarKycOcrDataBack._internal(
      id: id,
      documentType: documentType ?? this.documentType,
      subType: subType ?? this.subType,
      number: number ?? this.number,
      addressFull: addressFull ?? this.addressFull,
      pin: pin ?? this.pin,
      building: building ?? this.building,
      city: city ?? this.city,
      district: district ?? this.district,
      floor: floor ?? this.floor,
      house: house ?? this.house,
      locality: locality ?? this.locality,
      state: state ?? this.state,
      street: street ?? this.street,
      complex: complex ?? this.complex,
      landmark: landmark ?? this.landmark,
      relation: relation ?? this.relation,
      name: name ?? this.name,
      numberCS: numberCS ?? this.numberCS,
      addressCS: addressCS ?? this.addressCS,
      pinCS: pinCS ?? this.pinCS);
  }
  
  AadhaarKycOcrDataBack copyWithModelFieldValues({
    ModelFieldValue<String?>? documentType,
    ModelFieldValue<String?>? subType,
    ModelFieldValue<String?>? number,
    ModelFieldValue<String?>? addressFull,
    ModelFieldValue<String?>? pin,
    ModelFieldValue<String?>? building,
    ModelFieldValue<String?>? city,
    ModelFieldValue<String?>? district,
    ModelFieldValue<String?>? floor,
    ModelFieldValue<String?>? house,
    ModelFieldValue<String?>? locality,
    ModelFieldValue<String?>? state,
    ModelFieldValue<String?>? street,
    ModelFieldValue<String?>? complex,
    ModelFieldValue<String?>? landmark,
    ModelFieldValue<String?>? relation,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? numberCS,
    ModelFieldValue<String?>? addressCS,
    ModelFieldValue<String?>? pinCS
  }) {
    return AadhaarKycOcrDataBack._internal(
      id: id,
      documentType: documentType == null ? this.documentType : documentType.value,
      subType: subType == null ? this.subType : subType.value,
      number: number == null ? this.number : number.value,
      addressFull: addressFull == null ? this.addressFull : addressFull.value,
      pin: pin == null ? this.pin : pin.value,
      building: building == null ? this.building : building.value,
      city: city == null ? this.city : city.value,
      district: district == null ? this.district : district.value,
      floor: floor == null ? this.floor : floor.value,
      house: house == null ? this.house : house.value,
      locality: locality == null ? this.locality : locality.value,
      state: state == null ? this.state : state.value,
      street: street == null ? this.street : street.value,
      complex: complex == null ? this.complex : complex.value,
      landmark: landmark == null ? this.landmark : landmark.value,
      relation: relation == null ? this.relation : relation.value,
      name: name == null ? this.name : name.value,
      numberCS: numberCS == null ? this.numberCS : numberCS.value,
      addressCS: addressCS == null ? this.addressCS : addressCS.value,
      pinCS: pinCS == null ? this.pinCS : pinCS.value
    );
  }
  
  AadhaarKycOcrDataBack.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _documentType = json['documentType'],
      _subType = json['subType'],
      _number = json['number'],
      _addressFull = json['addressFull'],
      _pin = json['pin'],
      _building = json['building'],
      _city = json['city'],
      _district = json['district'],
      _floor = json['floor'],
      _house = json['house'],
      _locality = json['locality'],
      _state = json['state'],
      _street = json['street'],
      _complex = json['complex'],
      _landmark = json['landmark'],
      _relation = json['relation'],
      _name = json['name'],
      _numberCS = json['numberCS'],
      _addressCS = json['addressCS'],
      _pinCS = json['pinCS'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'documentType': _documentType, 'subType': _subType, 'number': _number, 'addressFull': _addressFull, 'pin': _pin, 'building': _building, 'city': _city, 'district': _district, 'floor': _floor, 'house': _house, 'locality': _locality, 'state': _state, 'street': _street, 'complex': _complex, 'landmark': _landmark, 'relation': _relation, 'name': _name, 'numberCS': _numberCS, 'addressCS': _addressCS, 'pinCS': _pinCS, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'documentType': _documentType,
    'subType': _subType,
    'number': _number,
    'addressFull': _addressFull,
    'pin': _pin,
    'building': _building,
    'city': _city,
    'district': _district,
    'floor': _floor,
    'house': _house,
    'locality': _locality,
    'state': _state,
    'street': _street,
    'complex': _complex,
    'landmark': _landmark,
    'relation': _relation,
    'name': _name,
    'numberCS': _numberCS,
    'addressCS': _addressCS,
    'pinCS': _pinCS,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AadhaarKycOcrDataBackModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AadhaarKycOcrDataBackModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DOCUMENTTYPE = amplify_core.QueryField(fieldName: "documentType");
  static final SUBTYPE = amplify_core.QueryField(fieldName: "subType");
  static final NUMBER = amplify_core.QueryField(fieldName: "number");
  static final ADDRESSFULL = amplify_core.QueryField(fieldName: "addressFull");
  static final PIN = amplify_core.QueryField(fieldName: "pin");
  static final BUILDING = amplify_core.QueryField(fieldName: "building");
  static final CITY = amplify_core.QueryField(fieldName: "city");
  static final DISTRICT = amplify_core.QueryField(fieldName: "district");
  static final FLOOR = amplify_core.QueryField(fieldName: "floor");
  static final HOUSE = amplify_core.QueryField(fieldName: "house");
  static final LOCALITY = amplify_core.QueryField(fieldName: "locality");
  static final STATE = amplify_core.QueryField(fieldName: "state");
  static final STREET = amplify_core.QueryField(fieldName: "street");
  static final COMPLEX = amplify_core.QueryField(fieldName: "complex");
  static final LANDMARK = amplify_core.QueryField(fieldName: "landmark");
  static final RELATION = amplify_core.QueryField(fieldName: "relation");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final NUMBERCS = amplify_core.QueryField(fieldName: "numberCS");
  static final ADDRESSCS = amplify_core.QueryField(fieldName: "addressCS");
  static final PINCS = amplify_core.QueryField(fieldName: "pinCS");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AadhaarKycOcrDataBack";
    modelSchemaDefinition.pluralName = "AadhaarKycOcrDataBacks";
    
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
      key: AadhaarKycOcrDataBack.DOCUMENTTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.SUBTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.NUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.ADDRESSFULL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.PIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.BUILDING,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.CITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.DISTRICT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.FLOOR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.HOUSE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.LOCALITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.STATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.STREET,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.COMPLEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.LANDMARK,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.RELATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.NUMBERCS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.ADDRESSCS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataBack.PINCS,
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

class _AadhaarKycOcrDataBackModelType extends amplify_core.ModelType<AadhaarKycOcrDataBack> {
  const _AadhaarKycOcrDataBackModelType();
  
  @override
  AadhaarKycOcrDataBack fromJson(Map<String, dynamic> jsonData) {
    return AadhaarKycOcrDataBack.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'AadhaarKycOcrDataBack';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [AadhaarKycOcrDataBack] in your schema.
 */
class AadhaarKycOcrDataBackModelIdentifier implements amplify_core.ModelIdentifier<AadhaarKycOcrDataBack> {
  final String id;

  /** Create an instance of AadhaarKycOcrDataBackModelIdentifier using [id] the primary key. */
  const AadhaarKycOcrDataBackModelIdentifier({
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
  String toString() => 'AadhaarKycOcrDataBackModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AadhaarKycOcrDataBackModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}