// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      document: json['document'] as String,
      patientAddressModel: PatientAddressModel.fromJson(
          json['patientAddressModel'] as Map<String, dynamic>),
      guardian: json['guardian'] as String? ?? '',
      guardianIdentificationNumber:
          json['guardian_identification_number'] as String? ?? '',
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'document': instance.document,
      'patientAddressModel': instance.patientAddressModel,
      'guardian': instance.guardian,
      'guardian_identification_number': instance.guardianIdentificationNumber,
    };
