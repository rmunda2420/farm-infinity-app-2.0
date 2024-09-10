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


/** This is an auto generated class representing the AadhaarKycOcrDataFront type in your schema. */
class AadhaarKycOcrDataFront extends amplify_core.Model {
  static const classType = const _AadhaarKycOcrDataFrontModelType();
  final String id;
  final String? _number;
  final String? _name;
  final String? _documentType;
  final String? _subType;
  final String? _dob;
  final String? _father;
  final String? _gender;
  final String? _husband;
  final String? _mother;
  final String? _yob;
  final String? _numberCS;
  final String? _nameCS;
  final String? _dobCS;
  final String? _fatherCS;
  final String? _genderCS;
  final String? _husbandCS;
  final String? _motherCS;
  final String? _yobCS;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AadhaarKycOcrDataFrontModelIdentifier get modelIdentifier {
      return AadhaarKycOcrDataFrontModelIdentifier(
        id: id
      );
  }
  
  String get number {
    try {
      return _number!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get name {
    return _name;
  }
  
  String? get documentType {
    return _documentType;
  }
  
  String? get subType {
    return _subType;
  }
  
  String? get dob {
    return _dob;
  }
  
  String? get father {
    return _father;
  }
  
  String? get gender {
    return _gender;
  }
  
  String? get husband {
    return _husband;
  }
  
  String? get mother {
    return _mother;
  }
  
  String? get yob {
    return _yob;
  }
  
  String? get numberCS {
    return _numberCS;
  }
  
  String? get nameCS {
    return _nameCS;
  }
  
  String? get dobCS {
    return _dobCS;
  }
  
  String? get fatherCS {
    return _fatherCS;
  }
  
  String? get genderCS {
    return _genderCS;
  }
  
  String? get husbandCS {
    return _husbandCS;
  }
  
  String? get motherCS {
    return _motherCS;
  }
  
  String? get yobCS {
    return _yobCS;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const AadhaarKycOcrDataFront._internal({required this.id, required number, name, documentType, subType, dob, father, gender, husband, mother, yob, numberCS, nameCS, dobCS, fatherCS, genderCS, husbandCS, motherCS, yobCS, createdAt, updatedAt}): _number = number, _name = name, _documentType = documentType, _subType = subType, _dob = dob, _father = father, _gender = gender, _husband = husband, _mother = mother, _yob = yob, _numberCS = numberCS, _nameCS = nameCS, _dobCS = dobCS, _fatherCS = fatherCS, _genderCS = genderCS, _husbandCS = husbandCS, _motherCS = motherCS, _yobCS = yobCS, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory AadhaarKycOcrDataFront({String? id, required String number, String? name, String? documentType, String? subType, String? dob, String? father, String? gender, String? husband, String? mother, String? yob, String? numberCS, String? nameCS, String? dobCS, String? fatherCS, String? genderCS, String? husbandCS, String? motherCS, String? yobCS}) {
    return AadhaarKycOcrDataFront._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      number: number,
      name: name,
      documentType: documentType,
      subType: subType,
      dob: dob,
      father: father,
      gender: gender,
      husband: husband,
      mother: mother,
      yob: yob,
      numberCS: numberCS,
      nameCS: nameCS,
      dobCS: dobCS,
      fatherCS: fatherCS,
      genderCS: genderCS,
      husbandCS: husbandCS,
      motherCS: motherCS,
      yobCS: yobCS);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AadhaarKycOcrDataFront &&
      id == other.id &&
      _number == other._number &&
      _name == other._name &&
      _documentType == other._documentType &&
      _subType == other._subType &&
      _dob == other._dob &&
      _father == other._father &&
      _gender == other._gender &&
      _husband == other._husband &&
      _mother == other._mother &&
      _yob == other._yob &&
      _numberCS == other._numberCS &&
      _nameCS == other._nameCS &&
      _dobCS == other._dobCS &&
      _fatherCS == other._fatherCS &&
      _genderCS == other._genderCS &&
      _husbandCS == other._husbandCS &&
      _motherCS == other._motherCS &&
      _yobCS == other._yobCS;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AadhaarKycOcrDataFront {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("number=" + "$_number" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("documentType=" + "$_documentType" + ", ");
    buffer.write("subType=" + "$_subType" + ", ");
    buffer.write("dob=" + "$_dob" + ", ");
    buffer.write("father=" + "$_father" + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("husband=" + "$_husband" + ", ");
    buffer.write("mother=" + "$_mother" + ", ");
    buffer.write("yob=" + "$_yob" + ", ");
    buffer.write("numberCS=" + "$_numberCS" + ", ");
    buffer.write("nameCS=" + "$_nameCS" + ", ");
    buffer.write("dobCS=" + "$_dobCS" + ", ");
    buffer.write("fatherCS=" + "$_fatherCS" + ", ");
    buffer.write("genderCS=" + "$_genderCS" + ", ");
    buffer.write("husbandCS=" + "$_husbandCS" + ", ");
    buffer.write("motherCS=" + "$_motherCS" + ", ");
    buffer.write("yobCS=" + "$_yobCS" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AadhaarKycOcrDataFront copyWith({String? number, String? name, String? documentType, String? subType, String? dob, String? father, String? gender, String? husband, String? mother, String? yob, String? numberCS, String? nameCS, String? dobCS, String? fatherCS, String? genderCS, String? husbandCS, String? motherCS, String? yobCS}) {
    return AadhaarKycOcrDataFront._internal(
      id: id,
      number: number ?? this.number,
      name: name ?? this.name,
      documentType: documentType ?? this.documentType,
      subType: subType ?? this.subType,
      dob: dob ?? this.dob,
      father: father ?? this.father,
      gender: gender ?? this.gender,
      husband: husband ?? this.husband,
      mother: mother ?? this.mother,
      yob: yob ?? this.yob,
      numberCS: numberCS ?? this.numberCS,
      nameCS: nameCS ?? this.nameCS,
      dobCS: dobCS ?? this.dobCS,
      fatherCS: fatherCS ?? this.fatherCS,
      genderCS: genderCS ?? this.genderCS,
      husbandCS: husbandCS ?? this.husbandCS,
      motherCS: motherCS ?? this.motherCS,
      yobCS: yobCS ?? this.yobCS);
  }
  
  AadhaarKycOcrDataFront copyWithModelFieldValues({
    ModelFieldValue<String>? number,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? documentType,
    ModelFieldValue<String?>? subType,
    ModelFieldValue<String?>? dob,
    ModelFieldValue<String?>? father,
    ModelFieldValue<String?>? gender,
    ModelFieldValue<String?>? husband,
    ModelFieldValue<String?>? mother,
    ModelFieldValue<String?>? yob,
    ModelFieldValue<String?>? numberCS,
    ModelFieldValue<String?>? nameCS,
    ModelFieldValue<String?>? dobCS,
    ModelFieldValue<String?>? fatherCS,
    ModelFieldValue<String?>? genderCS,
    ModelFieldValue<String?>? husbandCS,
    ModelFieldValue<String?>? motherCS,
    ModelFieldValue<String?>? yobCS
  }) {
    return AadhaarKycOcrDataFront._internal(
      id: id,
      number: number == null ? this.number : number.value,
      name: name == null ? this.name : name.value,
      documentType: documentType == null ? this.documentType : documentType.value,
      subType: subType == null ? this.subType : subType.value,
      dob: dob == null ? this.dob : dob.value,
      father: father == null ? this.father : father.value,
      gender: gender == null ? this.gender : gender.value,
      husband: husband == null ? this.husband : husband.value,
      mother: mother == null ? this.mother : mother.value,
      yob: yob == null ? this.yob : yob.value,
      numberCS: numberCS == null ? this.numberCS : numberCS.value,
      nameCS: nameCS == null ? this.nameCS : nameCS.value,
      dobCS: dobCS == null ? this.dobCS : dobCS.value,
      fatherCS: fatherCS == null ? this.fatherCS : fatherCS.value,
      genderCS: genderCS == null ? this.genderCS : genderCS.value,
      husbandCS: husbandCS == null ? this.husbandCS : husbandCS.value,
      motherCS: motherCS == null ? this.motherCS : motherCS.value,
      yobCS: yobCS == null ? this.yobCS : yobCS.value
    );
  }
  
  AadhaarKycOcrDataFront.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _number = json['number'],
      _name = json['name'],
      _documentType = json['documentType'],
      _subType = json['subType'],
      _dob = json['dob'],
      _father = json['father'],
      _gender = json['gender'],
      _husband = json['husband'],
      _mother = json['mother'],
      _yob = json['yob'],
      _numberCS = json['numberCS'],
      _nameCS = json['nameCS'],
      _dobCS = json['dobCS'],
      _fatherCS = json['fatherCS'],
      _genderCS = json['genderCS'],
      _husbandCS = json['husbandCS'],
      _motherCS = json['motherCS'],
      _yobCS = json['yobCS'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'number': _number, 'name': _name, 'documentType': _documentType, 'subType': _subType, 'dob': _dob, 'father': _father, 'gender': _gender, 'husband': _husband, 'mother': _mother, 'yob': _yob, 'numberCS': _numberCS, 'nameCS': _nameCS, 'dobCS': _dobCS, 'fatherCS': _fatherCS, 'genderCS': _genderCS, 'husbandCS': _husbandCS, 'motherCS': _motherCS, 'yobCS': _yobCS, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'number': _number,
    'name': _name,
    'documentType': _documentType,
    'subType': _subType,
    'dob': _dob,
    'father': _father,
    'gender': _gender,
    'husband': _husband,
    'mother': _mother,
    'yob': _yob,
    'numberCS': _numberCS,
    'nameCS': _nameCS,
    'dobCS': _dobCS,
    'fatherCS': _fatherCS,
    'genderCS': _genderCS,
    'husbandCS': _husbandCS,
    'motherCS': _motherCS,
    'yobCS': _yobCS,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AadhaarKycOcrDataFrontModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AadhaarKycOcrDataFrontModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NUMBER = amplify_core.QueryField(fieldName: "number");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final DOCUMENTTYPE = amplify_core.QueryField(fieldName: "documentType");
  static final SUBTYPE = amplify_core.QueryField(fieldName: "subType");
  static final DOB = amplify_core.QueryField(fieldName: "dob");
  static final FATHER = amplify_core.QueryField(fieldName: "father");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final HUSBAND = amplify_core.QueryField(fieldName: "husband");
  static final MOTHER = amplify_core.QueryField(fieldName: "mother");
  static final YOB = amplify_core.QueryField(fieldName: "yob");
  static final NUMBERCS = amplify_core.QueryField(fieldName: "numberCS");
  static final NAMECS = amplify_core.QueryField(fieldName: "nameCS");
  static final DOBCS = amplify_core.QueryField(fieldName: "dobCS");
  static final FATHERCS = amplify_core.QueryField(fieldName: "fatherCS");
  static final GENDERCS = amplify_core.QueryField(fieldName: "genderCS");
  static final HUSBANDCS = amplify_core.QueryField(fieldName: "husbandCS");
  static final MOTHERCS = amplify_core.QueryField(fieldName: "motherCS");
  static final YOBCS = amplify_core.QueryField(fieldName: "yobCS");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AadhaarKycOcrDataFront";
    modelSchemaDefinition.pluralName = "AadhaarKycOcrDataFronts";
    
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
      key: AadhaarKycOcrDataFront.NUMBER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.DOCUMENTTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.SUBTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.DOB,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.FATHER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.GENDER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.HUSBAND,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.MOTHER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.YOB,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.NUMBERCS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.NAMECS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.DOBCS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.FATHERCS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.GENDERCS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.HUSBANDCS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.MOTHERCS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AadhaarKycOcrDataFront.YOBCS,
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

class _AadhaarKycOcrDataFrontModelType extends amplify_core.ModelType<AadhaarKycOcrDataFront> {
  const _AadhaarKycOcrDataFrontModelType();
  
  @override
  AadhaarKycOcrDataFront fromJson(Map<String, dynamic> jsonData) {
    return AadhaarKycOcrDataFront.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'AadhaarKycOcrDataFront';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [AadhaarKycOcrDataFront] in your schema.
 */
class AadhaarKycOcrDataFrontModelIdentifier implements amplify_core.ModelIdentifier<AadhaarKycOcrDataFront> {
  final String id;

  /** Create an instance of AadhaarKycOcrDataFrontModelIdentifier using [id] the primary key. */
  const AadhaarKycOcrDataFrontModelIdentifier({
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
  String toString() => 'AadhaarKycOcrDataFrontModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AadhaarKycOcrDataFrontModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}