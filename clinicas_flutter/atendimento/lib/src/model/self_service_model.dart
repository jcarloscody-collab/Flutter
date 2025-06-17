import 'package:flutter/material.dart';

import 'patient_model.dart';

enum DocumentType { healthInsuranceCard, medicalOrder }

final class SelfServiceModel {
  final String? name;
  final String? lastName;
  final PatientModel? patientModel;
  final Map<DocumentType, List<String>>? documents;

  const SelfServiceModel({
    this.name,
    this.lastName,
    this.patientModel,
    this.documents,
  });

  SelfServiceModel clear() => copyWith(
        name: () => null,
        lastName: () => null,
        patientModel: () => null,
        documents: () => null,
      );

  SelfServiceModel copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? lastName,
    ValueGetter<PatientModel?>? patientModel,
    ValueGetter<Map<DocumentType, List<String>>?>? documents,
  }) {
    return SelfServiceModel(
      name: name != null ? name() : this.name,
      lastName: lastName != null ? lastName() : this.lastName,
      patientModel: patientModel != null ? patientModel() : this.patientModel,
      documents: documents != null ? documents() : this.documents,
    );
  }
}
