// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:atendimento/src/model/patient_model.dart';
import 'package:atendimento/src/repositories/patients/patient_repository.dart';
import 'package:core/clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  final PatientRepository repository;
  PatientModel? patientModel;
  PatientController({
    required this.repository,
  });
  final nextStep = signal<bool>(false);

  void goNextStep() {
    nextStep.value = true;
  }

  Future<void> updateAndNext({required PatientModel model}) async {
    final updateResult = await repository.update(patient: model);
    switch (updateResult) {
      case Left():
        showError(
            message: 'Erro ao update os dados do paciente, chame o atendente');
        break;
      case Right():
        showInfo(message: 'Paciente atualizado');
        patientModel = model;
        goNextStep();
        break;
    }
  }

  Future<void> saveAndNext({required RegisterPatientsModel register}) async {
    final resul = await repository.register(register: register);
    switch (resul) {
      case Left():
        showError(message: 'Error ao cadastrar');
        break;
      case Right(value: final patient):
        showInfo(message: 'Paciente cadastrado com sucesso');
        patientModel = patient;
        goNextStep();
        break;
    }
  }
}
