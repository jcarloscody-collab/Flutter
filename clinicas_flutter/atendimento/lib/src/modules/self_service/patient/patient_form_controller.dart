import 'package:atendimento/src/model/patient_model.dart';
import 'package:atendimento/src/modules/self_service/patient/patient_page.dart';
import 'package:flutter/material.dart';

import '../../../repositories/patients/patient_repository.dart';

mixin PatientFormController on State<PatientPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final documentEC = TextEditingController();
  final cepEC = TextEditingController();
  final streetEC = TextEditingController();
  final numEC = TextEditingController();
  final complEC = TextEditingController();
  final stateEC = TextEditingController();
  final cityEC = TextEditingController();
  final districtEC = TextEditingController();
  final guardianEC = TextEditingController();
  final guardianIdentificationNumberEC = TextEditingController();

  void disposeForm() {
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    documentEC.dispose();
    cepEC.dispose();
    streetEC.dispose();
    numEC.dispose();
    complEC.dispose();
    stateEC.dispose();
    cityEC.dispose();
    districtEC.dispose();
    guardianEC.dispose();
    guardianIdentificationNumberEC.dispose();
  }

  void initializeForm({final PatientModel? patiente}) {
    if (patiente != null) {
      nameEC.text = patiente.name;
      emailEC.text = patiente.email;
      phoneEC.text = patiente.phoneNumber;
      documentEC.text = patiente.document;
      cepEC.text = patiente.addressModel.cep;
      streetEC.text = patiente.addressModel.streetAddress;
      numEC.text = patiente.addressModel.numero;
      complEC.text = patiente.addressModel.comple;
      stateEC.text = patiente.addressModel.state;
      cityEC.text = patiente.addressModel.city;
      districtEC.text = patiente.addressModel.district;
      guardianEC.text = patiente.guardian;
      guardianIdentificationNumberEC.text =
          patiente.guardianIdentificationNumber;
    }
  }

  PatientModel updatePatient({required PatientModel patient}) {
    return patient.copyWith(
      id: nameEC.text,
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: numEC.text,
      document: documentEC.text,
      addressModel: patient.addressModel.copyWith(
        cep: cepEC.text,
        streetAddress: streetEC.text,
        state: stateEC.text,
        city: cityEC.text,
        district: districtEC.text,
        numero: numEC.text,
        comple: complEC.text,
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
    );
  }

  RegisterPatientsModel createPatientRegister() {
    return (
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: phoneEC.text,
      document: documentEC.text,
      address: (
        cep: cepEC.text,
        streetAddress: streetEC.text,
        number: numEC.text,
        addressComplement: complEC.text,
        state: stateEC.text,
        city: cityEC.text,
        district: districtEC.text,
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
    );
  }
}
