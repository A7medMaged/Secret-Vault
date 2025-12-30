// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PinState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinState()';
}


}

/// @nodoc
class $PinStateCopyWith<$Res>  {
$PinStateCopyWith(PinState _, $Res Function(PinState) __);
}


/// Adds pattern-matching-related methods to [PinState].
extension PinStatePatterns on PinState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PinInitial value)?  pinInitial,TResult Function( PinEntering value)?  pinEntering,TResult Function( PinConfirming value)?  pinConfirming,TResult Function( PinLocked value)?  pinLocked,TResult Function( PinSuccess value)?  pinSuccess,TResult Function( PinError value)?  pinError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PinInitial() when pinInitial != null:
return pinInitial(_that);case PinEntering() when pinEntering != null:
return pinEntering(_that);case PinConfirming() when pinConfirming != null:
return pinConfirming(_that);case PinLocked() when pinLocked != null:
return pinLocked(_that);case PinSuccess() when pinSuccess != null:
return pinSuccess(_that);case PinError() when pinError != null:
return pinError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PinInitial value)  pinInitial,required TResult Function( PinEntering value)  pinEntering,required TResult Function( PinConfirming value)  pinConfirming,required TResult Function( PinLocked value)  pinLocked,required TResult Function( PinSuccess value)  pinSuccess,required TResult Function( PinError value)  pinError,}){
final _that = this;
switch (_that) {
case PinInitial():
return pinInitial(_that);case PinEntering():
return pinEntering(_that);case PinConfirming():
return pinConfirming(_that);case PinLocked():
return pinLocked(_that);case PinSuccess():
return pinSuccess(_that);case PinError():
return pinError(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PinInitial value)?  pinInitial,TResult? Function( PinEntering value)?  pinEntering,TResult? Function( PinConfirming value)?  pinConfirming,TResult? Function( PinLocked value)?  pinLocked,TResult? Function( PinSuccess value)?  pinSuccess,TResult? Function( PinError value)?  pinError,}){
final _that = this;
switch (_that) {
case PinInitial() when pinInitial != null:
return pinInitial(_that);case PinEntering() when pinEntering != null:
return pinEntering(_that);case PinConfirming() when pinConfirming != null:
return pinConfirming(_that);case PinLocked() when pinLocked != null:
return pinLocked(_that);case PinSuccess() when pinSuccess != null:
return pinSuccess(_that);case PinError() when pinError != null:
return pinError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pinInitial,TResult Function( List<int> pin)?  pinEntering,TResult Function( List<int> pin)?  pinConfirming,TResult Function( int secondsLeft)?  pinLocked,TResult Function()?  pinSuccess,TResult Function( String error)?  pinError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PinInitial() when pinInitial != null:
return pinInitial();case PinEntering() when pinEntering != null:
return pinEntering(_that.pin);case PinConfirming() when pinConfirming != null:
return pinConfirming(_that.pin);case PinLocked() when pinLocked != null:
return pinLocked(_that.secondsLeft);case PinSuccess() when pinSuccess != null:
return pinSuccess();case PinError() when pinError != null:
return pinError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pinInitial,required TResult Function( List<int> pin)  pinEntering,required TResult Function( List<int> pin)  pinConfirming,required TResult Function( int secondsLeft)  pinLocked,required TResult Function()  pinSuccess,required TResult Function( String error)  pinError,}) {final _that = this;
switch (_that) {
case PinInitial():
return pinInitial();case PinEntering():
return pinEntering(_that.pin);case PinConfirming():
return pinConfirming(_that.pin);case PinLocked():
return pinLocked(_that.secondsLeft);case PinSuccess():
return pinSuccess();case PinError():
return pinError(_that.error);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pinInitial,TResult? Function( List<int> pin)?  pinEntering,TResult? Function( List<int> pin)?  pinConfirming,TResult? Function( int secondsLeft)?  pinLocked,TResult? Function()?  pinSuccess,TResult? Function( String error)?  pinError,}) {final _that = this;
switch (_that) {
case PinInitial() when pinInitial != null:
return pinInitial();case PinEntering() when pinEntering != null:
return pinEntering(_that.pin);case PinConfirming() when pinConfirming != null:
return pinConfirming(_that.pin);case PinLocked() when pinLocked != null:
return pinLocked(_that.secondsLeft);case PinSuccess() when pinSuccess != null:
return pinSuccess();case PinError() when pinError != null:
return pinError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PinInitial implements PinState {
  const PinInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinState.pinInitial()';
}


}




/// @nodoc


class PinEntering implements PinState {
  const PinEntering(final  List<int> pin): _pin = pin;
  

 final  List<int> _pin;
 List<int> get pin {
  if (_pin is EqualUnmodifiableListView) return _pin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pin);
}


/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinEnteringCopyWith<PinEntering> get copyWith => _$PinEnteringCopyWithImpl<PinEntering>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinEntering&&const DeepCollectionEquality().equals(other._pin, _pin));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pin));

@override
String toString() {
  return 'PinState.pinEntering(pin: $pin)';
}


}

/// @nodoc
abstract mixin class $PinEnteringCopyWith<$Res> implements $PinStateCopyWith<$Res> {
  factory $PinEnteringCopyWith(PinEntering value, $Res Function(PinEntering) _then) = _$PinEnteringCopyWithImpl;
@useResult
$Res call({
 List<int> pin
});




}
/// @nodoc
class _$PinEnteringCopyWithImpl<$Res>
    implements $PinEnteringCopyWith<$Res> {
  _$PinEnteringCopyWithImpl(this._self, this._then);

  final PinEntering _self;
  final $Res Function(PinEntering) _then;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pin = null,}) {
  return _then(PinEntering(
null == pin ? _self._pin : pin // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc


class PinConfirming implements PinState {
  const PinConfirming(final  List<int> pin): _pin = pin;
  

 final  List<int> _pin;
 List<int> get pin {
  if (_pin is EqualUnmodifiableListView) return _pin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pin);
}


/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinConfirmingCopyWith<PinConfirming> get copyWith => _$PinConfirmingCopyWithImpl<PinConfirming>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinConfirming&&const DeepCollectionEquality().equals(other._pin, _pin));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pin));

@override
String toString() {
  return 'PinState.pinConfirming(pin: $pin)';
}


}

/// @nodoc
abstract mixin class $PinConfirmingCopyWith<$Res> implements $PinStateCopyWith<$Res> {
  factory $PinConfirmingCopyWith(PinConfirming value, $Res Function(PinConfirming) _then) = _$PinConfirmingCopyWithImpl;
@useResult
$Res call({
 List<int> pin
});




}
/// @nodoc
class _$PinConfirmingCopyWithImpl<$Res>
    implements $PinConfirmingCopyWith<$Res> {
  _$PinConfirmingCopyWithImpl(this._self, this._then);

  final PinConfirming _self;
  final $Res Function(PinConfirming) _then;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pin = null,}) {
  return _then(PinConfirming(
null == pin ? _self._pin : pin // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc


class PinLocked implements PinState {
  const PinLocked(this.secondsLeft);
  

 final  int secondsLeft;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinLockedCopyWith<PinLocked> get copyWith => _$PinLockedCopyWithImpl<PinLocked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinLocked&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft));
}


@override
int get hashCode => Object.hash(runtimeType,secondsLeft);

@override
String toString() {
  return 'PinState.pinLocked(secondsLeft: $secondsLeft)';
}


}

/// @nodoc
abstract mixin class $PinLockedCopyWith<$Res> implements $PinStateCopyWith<$Res> {
  factory $PinLockedCopyWith(PinLocked value, $Res Function(PinLocked) _then) = _$PinLockedCopyWithImpl;
@useResult
$Res call({
 int secondsLeft
});




}
/// @nodoc
class _$PinLockedCopyWithImpl<$Res>
    implements $PinLockedCopyWith<$Res> {
  _$PinLockedCopyWithImpl(this._self, this._then);

  final PinLocked _self;
  final $Res Function(PinLocked) _then;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? secondsLeft = null,}) {
  return _then(PinLocked(
null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PinSuccess implements PinState {
  const PinSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinState.pinSuccess()';
}


}




/// @nodoc


class PinError implements PinState {
  const PinError(this.error);
  

 final  String error;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinErrorCopyWith<PinError> get copyWith => _$PinErrorCopyWithImpl<PinError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PinState.pinError(error: $error)';
}


}

/// @nodoc
abstract mixin class $PinErrorCopyWith<$Res> implements $PinStateCopyWith<$Res> {
  factory $PinErrorCopyWith(PinError value, $Res Function(PinError) _then) = _$PinErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PinErrorCopyWithImpl<$Res>
    implements $PinErrorCopyWith<$Res> {
  _$PinErrorCopyWithImpl(this._self, this._then);

  final PinError _self;
  final $Res Function(PinError) _then;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PinError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
