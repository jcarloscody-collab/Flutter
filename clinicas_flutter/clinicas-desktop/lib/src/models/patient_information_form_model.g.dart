// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_information_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientInformationFormModel _$PatientInformationFormModelFromJson(
        Map<String, dynamic> json) =>
    PatientInformationFormModel(
      id: json['id'] as String,
      patientModel:
          PatientModel.fromJson(json['patientModel'] as Map<String, dynamic>),
      healthInsuranceCard: json['health_insurance_card'] as String,
      medicalOrders: (json['medical_order'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      password: json['password'] as String,
      dateCreated: DateTime.parse(json['date_created'] as String),
      status: json['status'] as String,
      patientInformationFormStatus: $enumDecode(
          _$PatientInformationFormStatusEnumMap,
          json['patientInformationFormStatus']),
    );

Map<String, dynamic> _$PatientInformationFormModelToJson(
        PatientInformationFormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientModel': instance.patientModel,
      'health_insurance_card': instance.healthInsuranceCard,
      'medical_order': instance.medicalOrders,
      'password': instance.password,
      'date_created': instance.dateCreated.toIso8601String(),
      'status': instance.status,
      'patientInformationFormStatus': _$PatientInformationFormStatusEnumMap[
          instance.patientInformationFormStatus]!,
    };

const _$PatientInformationFormStatusEnumMap = {
  PatientInformationFormStatus.waiting: 'waiting',
  PatientInformationFormStatus.checkIn: 'checkIn',
  PatientInformationFormStatus.beingAttendend: 'beingAttendend',
};
