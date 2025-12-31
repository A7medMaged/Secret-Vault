// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BiometricState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricState()';
}


}

/// @nodoc
class $BiometricStateCopyWith<$Res>  {
$BiometricStateCopyWith(BiometricState _, $Res Function(BiometricState) __);
}


/// Adds pattern-matching-related methods to [BiometricState].
extension BiometricStatePatterns on BiometricState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Checking value)?  checking,TResult Function( Available value)?  available,TResult Function( Authenticating value)?  authenticating,TResult Function( Authenticated value)?  authenticated,TResult Function( AuthenticationFailed value)?  authenticationFailed,TResult Function( NotAvailable value)?  notAvailable,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Checking() when checking != null:
return checking(_that);case Available() when available != null:
return available(_that);case Authenticating() when authenticating != null:
return authenticating(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case AuthenticationFailed() when authenticationFailed != null:
return authenticationFailed(_that);case NotAvailable() when notAvailable != null:
return notAvailable(_that);case Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Checking value)  checking,required TResult Function( Available value)  available,required TResult Function( Authenticating value)  authenticating,required TResult Function( Authenticated value)  authenticated,required TResult Function( AuthenticationFailed value)  authenticationFailed,required TResult Function( NotAvailable value)  notAvailable,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Checking():
return checking(_that);case Available():
return available(_that);case Authenticating():
return authenticating(_that);case Authenticated():
return authenticated(_that);case AuthenticationFailed():
return authenticationFailed(_that);case NotAvailable():
return notAvailable(_that);case Error():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Checking value)?  checking,TResult? Function( Available value)?  available,TResult? Function( Authenticating value)?  authenticating,TResult? Function( Authenticated value)?  authenticated,TResult? Function( AuthenticationFailed value)?  authenticationFailed,TResult? Function( NotAvailable value)?  notAvailable,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Checking() when checking != null:
return checking(_that);case Available() when available != null:
return available(_that);case Authenticating() when authenticating != null:
return authenticating(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case AuthenticationFailed() when authenticationFailed != null:
return authenticationFailed(_that);case NotAvailable() when notAvailable != null:
return notAvailable(_that);case Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  checking,TResult Function( bool isAvailable,  String biometricType)?  available,TResult Function()?  authenticating,TResult Function()?  authenticated,TResult Function( String reason)?  authenticationFailed,TResult Function()?  notAvailable,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Checking() when checking != null:
return checking();case Available() when available != null:
return available(_that.isAvailable,_that.biometricType);case Authenticating() when authenticating != null:
return authenticating();case Authenticated() when authenticated != null:
return authenticated();case AuthenticationFailed() when authenticationFailed != null:
return authenticationFailed(_that.reason);case NotAvailable() when notAvailable != null:
return notAvailable();case Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  checking,required TResult Function( bool isAvailable,  String biometricType)  available,required TResult Function()  authenticating,required TResult Function()  authenticated,required TResult Function( String reason)  authenticationFailed,required TResult Function()  notAvailable,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Checking():
return checking();case Available():
return available(_that.isAvailable,_that.biometricType);case Authenticating():
return authenticating();case Authenticated():
return authenticated();case AuthenticationFailed():
return authenticationFailed(_that.reason);case NotAvailable():
return notAvailable();case Error():
return error(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  checking,TResult? Function( bool isAvailable,  String biometricType)?  available,TResult? Function()?  authenticating,TResult? Function()?  authenticated,TResult? Function( String reason)?  authenticationFailed,TResult? Function()?  notAvailable,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Checking() when checking != null:
return checking();case Available() when available != null:
return available(_that.isAvailable,_that.biometricType);case Authenticating() when authenticating != null:
return authenticating();case Authenticated() when authenticated != null:
return authenticated();case AuthenticationFailed() when authenticationFailed != null:
return authenticationFailed(_that.reason);case NotAvailable() when notAvailable != null:
return notAvailable();case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements BiometricState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricState.initial()';
}


}




/// @nodoc


class Checking implements BiometricState {
  const Checking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Checking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricState.checking()';
}


}




/// @nodoc


class Available implements BiometricState {
  const Available({required this.isAvailable, required this.biometricType});
  

 final  bool isAvailable;
 final  String biometricType;

/// Create a copy of BiometricState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableCopyWith<Available> get copyWith => _$AvailableCopyWithImpl<Available>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Available&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.biometricType, biometricType) || other.biometricType == biometricType));
}


@override
int get hashCode => Object.hash(runtimeType,isAvailable,biometricType);

@override
String toString() {
  return 'BiometricState.available(isAvailable: $isAvailable, biometricType: $biometricType)';
}


}

/// @nodoc
abstract mixin class $AvailableCopyWith<$Res> implements $BiometricStateCopyWith<$Res> {
  factory $AvailableCopyWith(Available value, $Res Function(Available) _then) = _$AvailableCopyWithImpl;
@useResult
$Res call({
 bool isAvailable, String biometricType
});




}
/// @nodoc
class _$AvailableCopyWithImpl<$Res>
    implements $AvailableCopyWith<$Res> {
  _$AvailableCopyWithImpl(this._self, this._then);

  final Available _self;
  final $Res Function(Available) _then;

/// Create a copy of BiometricState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isAvailable = null,Object? biometricType = null,}) {
  return _then(Available(
isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,biometricType: null == biometricType ? _self.biometricType : biometricType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Authenticating implements BiometricState {
  const Authenticating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricState.authenticating()';
}


}




/// @nodoc


class Authenticated implements BiometricState {
  const Authenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricState.authenticated()';
}


}




/// @nodoc


class AuthenticationFailed implements BiometricState {
  const AuthenticationFailed({required this.reason});
  

 final  String reason;

/// Create a copy of BiometricState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationFailedCopyWith<AuthenticationFailed> get copyWith => _$AuthenticationFailedCopyWithImpl<AuthenticationFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationFailed&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'BiometricState.authenticationFailed(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $AuthenticationFailedCopyWith<$Res> implements $BiometricStateCopyWith<$Res> {
  factory $AuthenticationFailedCopyWith(AuthenticationFailed value, $Res Function(AuthenticationFailed) _then) = _$AuthenticationFailedCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$AuthenticationFailedCopyWithImpl<$Res>
    implements $AuthenticationFailedCopyWith<$Res> {
  _$AuthenticationFailedCopyWithImpl(this._self, this._then);

  final AuthenticationFailed _self;
  final $Res Function(AuthenticationFailed) _then;

/// Create a copy of BiometricState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(AuthenticationFailed(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NotAvailable implements BiometricState {
  const NotAvailable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotAvailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricState.notAvailable()';
}


}




/// @nodoc


class Error implements BiometricState {
  const Error({required this.message});
  

 final  String message;

/// Create a copy of BiometricState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BiometricState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $BiometricStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of BiometricState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
