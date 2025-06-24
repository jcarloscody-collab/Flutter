// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asyncstate/asyncstate.dart';
import 'package:core/clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:atendimento/src/model/patient_model.dart';
import 'package:atendimento/src/model/self_service_model.dart';
import 'package:atendimento/src/repositories/information_from/information_form_repository.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);
  var _model = SelfServiceModel();
  final InformationFormRepository informationFormRepository;
  SelfServiceController({
    required this.informationFormRepository,
  });

  FormSteps get step => _step();
  SelfServiceModel get model => _model;
  var password = '';

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void setWhoIAmDataStepAndNext({
    required String name,
    required String lastName,
  }) {
    _model = _model.copyWith(
      name: () => name,
      lastName: () => lastName,
    );
    _step.forceUpdate(FormSteps.findPatient);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient({required PatientModel? patient}) {
    _model = _model.copyWith(
      patientModel: () => patient,
    );
    _step.forceUpdate(FormSteps.patient);
  }

  void restartProcess() {
    _step.forceUpdate(FormSteps.restart);
    clearForm();
  }

  void updatePatientAndGoDocument({PatientModel? patientModel}) {
    _model = _model.copyWith(
      patientModel: () => patientModel,
    );
    _step.forceUpdate(FormSteps.documents);
  }

  void registerDocument(DocumentType type, String filePath) {
    final documents = _model.documents ?? {};
    if (type == DocumentType.healthInsuranceCard) {
      documents[type]?.clear();
    }

    final values = documents[type] ?? [];
    values.add(filePath);
    documents[type] = values;
    _model = _model.copyWith(
      documents: () => documents,
    );
  }

  void clearDocuments() => _model.copyWith(
        documents: () => {},
      );

  Future<void> finalized() async {
    final result =
        await informationFormRepository.register(model: model).asyncLoader();
    switch (result) {
      case Left():
        showError(message: '${_model.name} ${_model.lastName}');
        break;
      case Right():
        password = '${_model.name} ${_model.lastName}';
        _step.forceUpdate(FormSteps.done);
        break;
    }
  }
}
