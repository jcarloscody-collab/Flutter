import 'dart:developer';

import 'package:clinicas_adm_desktop/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:core/clinicas_core.dart';
import 'package:dio/dio.dart';

class AttendantDeskAssignmentRepositoryImpl
    implements AttendantDeskAssignmentRepository {
  final RestClient restClient;

  AttendantDeskAssignmentRepositoryImpl({required this.restClient});

  @override
  VoidRepo startService({required int deskNumber}) async {
    final result = await _clearDeskByUser();

    switch (result) {
      case Left(value: final exception):
        return Left(value: exception);

      case Right():
        await restClient.auth.post('/attendantDeskAssignment', data: {
          'user_id': '#userAuthRef',
          'desk_number': deskNumber,
          'date_created': DateTime.now().toIso8601String(),
          'status': 'Available',
        });
        return Right(value: unit);
    }
  }

  VoidRepo _clearDeskByUser() async {
    try {
      final desk = await _getDeskByUser();
      if (desk != null) {
        await restClient.auth.delete('/attendanteDeskAssignment/${desk.id}');
      }
      return Right(value: unit);
    } catch (e, s) {
      log('Error ao deletar numero do guiche', error: e, stackTrace: s);
      return Left(value: RepositoryException());
    }
  }

  Future<({String id, int deskNumber})?> _getDeskByUser() async {
    final Response(:List data) = await restClient.get(
        '/attendantDeskAssignment',
        queryParameters: {'user_id': '#userAuthRef'});

    if (data
        case List(
          isNotEmpty: true,
          first: {
            'id': String id,
            'desk_number': int deskNum,
          },
        )) {
      return (id: id, deskNumber: deskNum);
    }
    return null;
  }
}

typedef VoidRepo = Future<Either<RepositoryException, Unit>>;
