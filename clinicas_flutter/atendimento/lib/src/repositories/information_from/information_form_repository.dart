import 'package:atendimento/src/model/self_service_model.dart';
import 'package:core/clinicas_core.dart';

abstract interface class InformationFormRepository {
  Future<Either<RepositoryException, Unit>> register(
      {required SelfServiceModel model});
}
