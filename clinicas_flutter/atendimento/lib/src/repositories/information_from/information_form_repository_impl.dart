import 'dart:developer';

import 'package:atendimento/src/model/patient_model.dart';
import 'package:atendimento/src/model/self_service_model.dart';
import 'package:core/clinicas_core.dart';

import './information_form_repository.dart';

class InformationFormRepositoryImpl implements InformationFormRepository {
  final RestClient restClient;

  InformationFormRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, Unit>> register(
      {required SelfServiceModel model}) async {
    try {
      final SelfServiceModel(
        :name!,
        :lastName!,
        patientModel: PatientModel(id: patientId)!,
        documents: {
          DocumentType.healthInsuranceCard: List(first: healthInsuranceCardDoc),
          DocumentType.medicalOrder: medicalOrderDocs,
        }!
      ) = model;

      restClient.auth.post(
        '/patientInformationForm',
        data: {
          'patient_id': patientId,
          'health_insurance_card': healthInsuranceCardDoc,
          'medical_order': medicalOrderDocs,
          'password': '$name $lastName',
          'date_created': DateTime.now().toIso8601String(),
          'status': 'Waiting',
          'tests': [],
        },
      );
      return Right(value: unit);
    } catch (e, s) {
      log(
        'Error ao finalizar formulário de auto atendimento',
        error: e,
        stackTrace: s,
      );

      return Left(value: RepositoryException());
    }
  }
}
