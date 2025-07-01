// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clinicas_adm_desktop/src/models/patient_address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  String id;
  String name;
  String email;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String document;
  PatientAddressModel patientAddressModel;
  @JsonKey(defaultValue: '')
  String guardian;
  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  String guardianIdentificationNumber;
  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.document,
    required this.patientAddressModel,
    required this.guardian,
    required this.guardianIdentificationNumber,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
