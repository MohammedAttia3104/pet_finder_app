// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( BreedsLoading value)?  getBreedsLoading,TResult Function( BreedsSuccess value)?  getBreedsSuccess,TResult Function( BreedsError value)?  getBreedsError,TResult Function( PaginationLoading value)?  paginationLoading,TResult Function( PaginationFailure value)?  paginationFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case BreedsLoading() when getBreedsLoading != null:
return getBreedsLoading(_that);case BreedsSuccess() when getBreedsSuccess != null:
return getBreedsSuccess(_that);case BreedsError() when getBreedsError != null:
return getBreedsError(_that);case PaginationLoading() when paginationLoading != null:
return paginationLoading(_that);case PaginationFailure() when paginationFailure != null:
return paginationFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( BreedsLoading value)  getBreedsLoading,required TResult Function( BreedsSuccess value)  getBreedsSuccess,required TResult Function( BreedsError value)  getBreedsError,required TResult Function( PaginationLoading value)  paginationLoading,required TResult Function( PaginationFailure value)  paginationFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case BreedsLoading():
return getBreedsLoading(_that);case BreedsSuccess():
return getBreedsSuccess(_that);case BreedsError():
return getBreedsError(_that);case PaginationLoading():
return paginationLoading(_that);case PaginationFailure():
return paginationFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( BreedsLoading value)?  getBreedsLoading,TResult? Function( BreedsSuccess value)?  getBreedsSuccess,TResult? Function( BreedsError value)?  getBreedsError,TResult? Function( PaginationLoading value)?  paginationLoading,TResult? Function( PaginationFailure value)?  paginationFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case BreedsLoading() when getBreedsLoading != null:
return getBreedsLoading(_that);case BreedsSuccess() when getBreedsSuccess != null:
return getBreedsSuccess(_that);case BreedsError() when getBreedsError != null:
return getBreedsError(_that);case PaginationLoading() when paginationLoading != null:
return paginationLoading(_that);case PaginationFailure() when paginationFailure != null:
return paginationFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getBreedsLoading,TResult Function( List<BreedModel> breeds)?  getBreedsSuccess,TResult Function( String message)?  getBreedsError,TResult Function()?  paginationLoading,TResult Function( String errorMessage)?  paginationFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case BreedsLoading() when getBreedsLoading != null:
return getBreedsLoading();case BreedsSuccess() when getBreedsSuccess != null:
return getBreedsSuccess(_that.breeds);case BreedsError() when getBreedsError != null:
return getBreedsError(_that.message);case PaginationLoading() when paginationLoading != null:
return paginationLoading();case PaginationFailure() when paginationFailure != null:
return paginationFailure(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getBreedsLoading,required TResult Function( List<BreedModel> breeds)  getBreedsSuccess,required TResult Function( String message)  getBreedsError,required TResult Function()  paginationLoading,required TResult Function( String errorMessage)  paginationFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case BreedsLoading():
return getBreedsLoading();case BreedsSuccess():
return getBreedsSuccess(_that.breeds);case BreedsError():
return getBreedsError(_that.message);case PaginationLoading():
return paginationLoading();case PaginationFailure():
return paginationFailure(_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getBreedsLoading,TResult? Function( List<BreedModel> breeds)?  getBreedsSuccess,TResult? Function( String message)?  getBreedsError,TResult? Function()?  paginationLoading,TResult? Function( String errorMessage)?  paginationFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case BreedsLoading() when getBreedsLoading != null:
return getBreedsLoading();case BreedsSuccess() when getBreedsSuccess != null:
return getBreedsSuccess(_that.breeds);case BreedsError() when getBreedsError != null:
return getBreedsError(_that.message);case PaginationLoading() when paginationLoading != null:
return paginationLoading();case PaginationFailure() when paginationFailure != null:
return paginationFailure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class BreedsLoading implements HomeState {
  const BreedsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.getBreedsLoading()';
}


}




/// @nodoc


class BreedsSuccess implements HomeState {
  const BreedsSuccess(final  List<BreedModel> breeds): _breeds = breeds;
  

 final  List<BreedModel> _breeds;
 List<BreedModel> get breeds {
  if (_breeds is EqualUnmodifiableListView) return _breeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breeds);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreedsSuccessCopyWith<BreedsSuccess> get copyWith => _$BreedsSuccessCopyWithImpl<BreedsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedsSuccess&&const DeepCollectionEquality().equals(other._breeds, _breeds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_breeds));

@override
String toString() {
  return 'HomeState.getBreedsSuccess(breeds: $breeds)';
}


}

/// @nodoc
abstract mixin class $BreedsSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $BreedsSuccessCopyWith(BreedsSuccess value, $Res Function(BreedsSuccess) _then) = _$BreedsSuccessCopyWithImpl;
@useResult
$Res call({
 List<BreedModel> breeds
});




}
/// @nodoc
class _$BreedsSuccessCopyWithImpl<$Res>
    implements $BreedsSuccessCopyWith<$Res> {
  _$BreedsSuccessCopyWithImpl(this._self, this._then);

  final BreedsSuccess _self;
  final $Res Function(BreedsSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? breeds = null,}) {
  return _then(BreedsSuccess(
null == breeds ? _self._breeds : breeds // ignore: cast_nullable_to_non_nullable
as List<BreedModel>,
  ));
}


}

/// @nodoc


class BreedsError implements HomeState {
  const BreedsError(this.message);
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreedsErrorCopyWith<BreedsError> get copyWith => _$BreedsErrorCopyWithImpl<BreedsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.getBreedsError(message: $message)';
}


}

/// @nodoc
abstract mixin class $BreedsErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $BreedsErrorCopyWith(BreedsError value, $Res Function(BreedsError) _then) = _$BreedsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BreedsErrorCopyWithImpl<$Res>
    implements $BreedsErrorCopyWith<$Res> {
  _$BreedsErrorCopyWithImpl(this._self, this._then);

  final BreedsError _self;
  final $Res Function(BreedsError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BreedsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PaginationLoading implements HomeState {
  const PaginationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.paginationLoading()';
}


}




/// @nodoc


class PaginationFailure implements HomeState {
  const PaginationFailure({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationFailureCopyWith<PaginationFailure> get copyWith => _$PaginationFailureCopyWithImpl<PaginationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'HomeState.paginationFailure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaginationFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $PaginationFailureCopyWith(PaginationFailure value, $Res Function(PaginationFailure) _then) = _$PaginationFailureCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$PaginationFailureCopyWithImpl<$Res>
    implements $PaginationFailureCopyWith<$Res> {
  _$PaginationFailureCopyWithImpl(this._self, this._then);

  final PaginationFailure _self;
  final $Res Function(PaginationFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(PaginationFailure(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
