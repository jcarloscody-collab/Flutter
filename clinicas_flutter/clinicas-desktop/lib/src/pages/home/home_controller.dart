import 'package:clinicas_adm_desktop/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:core/clinicas_core.dart';
import 'package:asyncstate/asyncstate.dart' as asyncstate;

class HomeController with MessageStateMixin {
  HomeController({required AttendantDeskAssignmentRepository assignment})
      : _assignment = assignment;

  final AttendantDeskAssignmentRepository _assignment;

  Future<void> startService({required int deskNum}) async {
    asyncstate.AsyncState.show();
    final result = await _assignment.startService(deskNumber: deskNum);

    switch (result) {
      case Left():
        asyncstate.AsyncState.hide();
        showError(message: 'Erro ao iniciar guiche');
        break;
      case Right(value: _):
        asyncstate.AsyncState.hide();
        showInfo(message: 'Registrou');
    }
  }
}
