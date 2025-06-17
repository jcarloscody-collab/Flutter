import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final class Messages {
  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message),
    );
  }

  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message),
    );
  }
}

//este Mixin ficará numa classe externa como controller p. ex.
mixin MessageStateMixin {
  final Signal<String?> _errorMessage = signal(null);
  String? get errorMessage => _errorMessage();

  final Signal<String?> _infoMessage = signal(null);
  String? get infoMessage => _infoMessage();

  final Signal<String?> _successMessage = signal(null);
  String? get successMessage => _successMessage();

  void clearError() => _errorMessage.value = null;
  void clearInfo() => _infoMessage.value = null;
  void clearSuccess() => _successMessage.value = null;

  void showError({required String message}) {
    untracked(() => clearError()); //altera o estado e nao notifica ninguem
    _errorMessage.value = message;
  }

  void showInfo({required String message}) {
    untracked(() => clearInfo()); //altera o estado e nao notifica ninguem
    _infoMessage.value = message;
  }

  void showSuccess({required String message}) {
    untracked(() => clearSuccess()); //altera o estado e nao notifica ninguem
    _successMessage.value = message;
  }

  void clearAll() {
    untracked(() {
      clearSuccess();
      clearError();
      clearInfo();
    }); //altera o estado e nao notifica ninguem
  }
}

//esta ficará numa classe de estado do widget
mixin MessageViewMixin<T extends StatefulWidget> on State<T> {
  late final VoidCallback disposeMessage;

  void messageListenerMessages({
    required MessageStateMixin stateMixin,
  }) =>
      disposeMessage = effect(
        () {
          switch (stateMixin) {
            case MessageStateMixin(:final errorMessage?):
              Messages.showError(errorMessage, context);
            case MessageStateMixin(:final infoMessage?):
              Messages.showError(infoMessage, context);
            case MessageStateMixin(:final successMessage?):
              Messages.showError(successMessage, context);
          }
        },
      );

  void disposeListener() => disposeMessage();
}
