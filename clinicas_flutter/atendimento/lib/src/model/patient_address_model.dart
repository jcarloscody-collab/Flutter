// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'patient_address_model.g.dart';

@JsonSerializable()
class PatientAddressModel {
  PatientAddressModel({
    required this.cep,
    required this.streetAddress,
    required this.state,
    required this.city,
    required this.district,
    required this.numero,
    required this.comple,
  });

  final String cep;
  @JsonKey(name: 'street_address')
  final String streetAddress;
  final String state;
  final String city;
  final String district;
  final String numero;
  @JsonKey(name: 'address_complement', defaultValue: '')
  final String comple;

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);

  PatientAddressModel copyWith({
    String? cep,
    String? streetAddress,
    String? state,
    String? city,
    String? district,
    String? numero,
    String? comple,
  }) {
    return PatientAddressModel(
      cep: cep ?? this.cep,
      streetAddress: streetAddress ?? this.streetAddress,
      state: state ?? this.state,
      city: city ?? this.city,
      district: district ?? this.district,
      numero: numero ?? this.numero,
      comple: comple ?? this.comple,
    );
  }
}
