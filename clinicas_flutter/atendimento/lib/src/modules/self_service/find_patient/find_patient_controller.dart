import 'package:atendimento/src/model/patient_model.dart';
import 'package:atendimento/src/repositories/patients/patient_repository.dart';
import 'package:core/clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  final PatientRepository _patientRepository;
  FindPatientController({
    required PatientRepository patientRepository,
  }) : _patientRepository = patientRepository;

  final _patientNotFound = ValueSignal<bool?>(null);
  final _patient = ValueSignal<PatientModel?>(null);

  bool? get patientNotFound => _patientNotFound();
  PatientModel? get patient => _patient();

  Future<void> findPatientByDocument({required String document}) async {
    final patientResult =
        await _patientRepository.findPatientByDocument(document: document);

    bool? patientNotFound;
    PatientModel? patient;

    switch (patientResult) {
      case Right(value: PatientModel model?):
        patientNotFound = false;
        patient = model;
        break;
      case Right(value: _):
        patientNotFound = true;
        patient = null;
      case Left():
        showError(message: 'Erro ao buscar paciente');
    }

    batch(
      () {
        _patient.value = patient;
        _patientNotFound.forceUpdate(patientNotFound);
      },
    );
  }

  void continueWithoutDocument() {
    batch(
      () {
        _patient.value = null;
        _patientNotFound.forceUpdate(true);
      },
    );
  }
}
