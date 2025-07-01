import 'package:clinicas_adm_desktop/src/models/patient_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_information_form_model.g.dart';

enum PatientInformationFormStatus {
  waiting('Waiting'),
  checkIn('Checked In'),
  beingAttendend('Being Attended');

  final String id;
  const PatientInformationFormStatus(this.id);
}

@JsonSerializable()
class PatientInformationFormModel {
  final String id;
  final PatientModel patientModel;
  @JsonKey(name: 'health_insurance_card')
  final String healthInsuranceCard;
  @JsonKey(name: 'medical_order')
  final List<String> medicalOrders;
  final String password;
  @JsonKey(name: 'date_created')
  final DateTime dateCreated;
  final String status;
  final PatientInformationFormStatus patientInformationFormStatus;

  factory PatientInformationFormModel.fromJson(Map<String, dynamic> json) =>
      _$PatientInformationFormModelFromJson(json);

  PatientInformationFormModel({
    required this.id,
    required this.patientModel,
    required this.healthInsuranceCard,
    required this.medicalOrders,
    required this.password,
    required this.dateCreated,
    required this.status,
    required this.patientInformationFormStatus,
  });

  Map<String, dynamic> toJson() => _$PatientInformationFormModelToJson(this);
}
