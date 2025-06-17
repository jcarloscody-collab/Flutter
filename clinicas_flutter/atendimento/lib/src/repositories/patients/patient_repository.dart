import 'package:atendimento/src/model/patient_model.dart';
import 'package:core/clinicas_core.dart';

typedef RegisterPatientAddressModel = ({
  String cep,
  String streetAddress,
  String number,
  String addressComplement,
  String state,
  String city,
  String district,
});

typedef RegisterPatientsModel = ({
  String name,
  String email,
  String phoneNumber,
  String document,
  RegisterPatientAddressModel address,
  String guardian,
  String guardianIdentificationNumber,
});

abstract interface class PatientRepository {
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
      {required String document});
  Future<Either<RepositoryException, Unit?>> update(
      {required PatientModel patient});
  Future<Either<RepositoryException, PatientModel>> register(
      {required RegisterPatientsModel register});
}
