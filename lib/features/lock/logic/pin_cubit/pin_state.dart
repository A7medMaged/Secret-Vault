part of 'pin_cubit.dart';

@freezed
class PinState with _$PinState {
  const factory PinState.pinInitial() = PinInitial;
  const factory PinState.pinEntering(List<int> pin) = PinEntering;
  const factory PinState.pinConfirming(List<int> pin) = PinConfirming;
  const factory PinState.pinLocked(int secondsLeft) = PinLocked;
  const factory PinState.pinSuccess() = PinSuccess;
  const factory PinState.pinError(String error) = PinError;
}
