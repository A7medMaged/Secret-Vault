import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_vault/core/helpers/constants.dart';
import 'package:secret_vault/core/helpers/secure_storage_helper.dart';

part 'pin_state.dart';
part 'pin_cubit.freezed.dart';

class PinCubit extends Cubit<PinState> {
  static const int pinLength = 4;
  List<int>? firstPin;
  PinCubit() : super(const PinState.pinInitial());

  void onNumberPressed(
    int number, {
    required bool creating,
  }) {
    state.maybeWhen(
      pinEntering: (pin) => addDigit(pin, number, creating),
      pinConfirming: (pin) => addDigit(pin, number, creating),
      pinInitial: () => addDigit([], number, creating),
      orElse: () {},
    );
  }

  void addDigit(List<int> current, int number, bool creating) {
    if (current.length >= pinLength) return;

    final updated = [...current, number];

    state.maybeWhen(
      pinConfirming: (_) {
        emit(PinState.pinConfirming(updated));
      },
      orElse: () {
        emit(PinState.pinEntering(updated));
      },
    );

    if (updated.length == pinLength) {
      creating ? handleCreate(updated) : handleValidate(updated);
    }
  }

  void onDeletePressed() {
    state.maybeWhen(
      pinEntering: (pin) {
        if (pin.isEmpty) return;
        emit(PinState.pinEntering(pin.sublist(0, pin.length - 1)));
      },
      pinConfirming: (pin) {
        if (pin.isEmpty) return;
        emit(PinState.pinConfirming(pin.sublist(0, pin.length - 1)));
      },
      orElse: () {},
    );
  }

  void handleCreate(List<int> pin) async {
    if (firstPin == null) {
      firstPin = pin;
      emit(const PinState.pinConfirming([]));
      return;
    }

    if (firstPin!.join() == pin.join()) {
      await SecureStorageHelper.setSecuredString(
        SecureStorageKeys.pinKey,
        pin.join(),
      );
      emit(const PinState.pinSuccess());
    } else {
      firstPin = null;
      emit(const PinState.pinError('PINs do not match'));
      emit(const PinState.pinInitial());
    }
  }

  Future<void> handleValidate(List<int> pin) async {
    final savedPin = await SecureStorageHelper.getSecuredString(
      SecureStorageKeys.pinKey,
    );

    if (savedPin == pin.join()) {
      emit(const PinState.pinSuccess());
    } else {
      emit(const PinState.pinError('Incorrect PIN'));
      emit(const PinState.pinInitial());
    }
  }
}
