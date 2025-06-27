import 'package:core/clinicas_core.dart';

abstract class AttendantDeskAssignmentRepository {
  Future<Either<RepositoryException, Unit>> startService({
    required int deskNumber,
  });
}
