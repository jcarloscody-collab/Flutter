import 'dart:developer';

import 'package:atendimento/src/model/patient_model.dart';
import 'package:atendimento/src/repositories/patients/patient_repository.dart';
import 'package:core/clinicas_core.dart';
import 'package:dio/dio.dart';

class PatientRepositoryImpl implements PatientRepository {
  final RestClient restClient;

  PatientRepositoryImpl({required this.restClient});
  @override
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
      {required String document}) async {
    try {
      final Response(:List data) = await restClient.auth
          .get('/patients', queryParameters: {'document': document});

      if (data.isEmpty) {
        Right(value: null);
      }
      return Right(value: data.first);
    } on DioException catch (e, s) {
      log('Erro ao buscar paciente por cpf', error: e, stackTrace: s);
      return Left(value: RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, Unit?>> update(
      {required PatientModel patient}) async {
    try {
      await restClient.auth
          .put('/patients/${patient.id}', data: patient.toJson());
      return Right(value: unit);
    } on DioException catch (e, s) {
      log('Erro no update do paciente ', error: e, stackTrace: s);
      return Left(value: RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, PatientModel>> register(
      {required RegisterPatientsModel register}) async {
    try {
      final Response(:data) = await restClient.auth.post('/patients', data: {
        'name': register.name,
        'email': register.email,
        'phoneNumber': register.phoneNumber,
        'document': register.document,
        'guardian': register.guardian,
        'guardianIdentificationNumber': register.guardianIdentificationNumber,
        'address': {
          'cep': register.address.cep,
          'streetAddress': register.address.streetAddress,
          'number': register.address.number,
          'addressComplement': register.address.addressComplement,
          'state': register.address.state,
          'city': register.address.city,
          'district': register.address.district,
        },
      });
      return Right(value: PatientModel.fromJson(data));
    } on DioException catch (e, s) {
      log('Erro update o paciente', error: e, stackTrace: s);
      return Left(value: RepositoryException());
    }
  }
}
