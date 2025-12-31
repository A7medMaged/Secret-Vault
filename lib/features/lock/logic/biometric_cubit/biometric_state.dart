part of 'biometric_cubit.dart';

@freezed
sealed class BiometricState with _$BiometricState {
  const factory BiometricState.initial() = Initial;
  const factory BiometricState.checking() = Checking;
  const factory BiometricState.available({
    required bool isAvailable,
    required String biometricType,
  }) = Available;
  const factory BiometricState.authenticating() = Authenticating;

  const factory BiometricState.authenticated() = Authenticated;

  const factory BiometricState.authenticationFailed({
    required String reason,
  }) = AuthenticationFailed;

  const factory BiometricState.notAvailable() = NotAvailable;

  const factory BiometricState.error({
    required String message,
  }) = Error;
}
