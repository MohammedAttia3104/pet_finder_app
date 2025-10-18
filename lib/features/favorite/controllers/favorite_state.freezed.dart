// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState()';
}


}

/// @nodoc
class $FavoriteStateCopyWith<$Res>  {
$FavoriteStateCopyWith(FavoriteState _, $Res Function(FavoriteState) __);
}


/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetFavoritesLoading value)?  getFavoritesLoading,TResult Function( GetFavoritesSuccess value)?  getFavoritesSuccess,TResult Function( GetFavoritesFailure value)?  getFavoritesFailure,TResult Function( AddFavoriteLoading value)?  addFavoriteLoading,TResult Function( AddFavoriteSuccess value)?  addFavoriteSuccess,TResult Function( AddFavoriteFailure value)?  addFavoriteFailure,TResult Function( DeleteFavoriteLoading value)?  deleteFavoriteLoading,TResult Function( DeleteFavoriteSuccess value)?  deleteFavoriteSuccess,TResult Function( DeleteFavoriteFailure value)?  deleteFavoriteFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetFavoritesLoading() when getFavoritesLoading != null:
return getFavoritesLoading(_that);case GetFavoritesSuccess() when getFavoritesSuccess != null:
return getFavoritesSuccess(_that);case GetFavoritesFailure() when getFavoritesFailure != null:
return getFavoritesFailure(_that);case AddFavoriteLoading() when addFavoriteLoading != null:
return addFavoriteLoading(_that);case AddFavoriteSuccess() when addFavoriteSuccess != null:
return addFavoriteSuccess(_that);case AddFavoriteFailure() when addFavoriteFailure != null:
return addFavoriteFailure(_that);case DeleteFavoriteLoading() when deleteFavoriteLoading != null:
return deleteFavoriteLoading(_that);case DeleteFavoriteSuccess() when deleteFavoriteSuccess != null:
return deleteFavoriteSuccess(_that);case DeleteFavoriteFailure() when deleteFavoriteFailure != null:
return deleteFavoriteFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetFavoritesLoading value)  getFavoritesLoading,required TResult Function( GetFavoritesSuccess value)  getFavoritesSuccess,required TResult Function( GetFavoritesFailure value)  getFavoritesFailure,required TResult Function( AddFavoriteLoading value)  addFavoriteLoading,required TResult Function( AddFavoriteSuccess value)  addFavoriteSuccess,required TResult Function( AddFavoriteFailure value)  addFavoriteFailure,required TResult Function( DeleteFavoriteLoading value)  deleteFavoriteLoading,required TResult Function( DeleteFavoriteSuccess value)  deleteFavoriteSuccess,required TResult Function( DeleteFavoriteFailure value)  deleteFavoriteFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetFavoritesLoading():
return getFavoritesLoading(_that);case GetFavoritesSuccess():
return getFavoritesSuccess(_that);case GetFavoritesFailure():
return getFavoritesFailure(_that);case AddFavoriteLoading():
return addFavoriteLoading(_that);case AddFavoriteSuccess():
return addFavoriteSuccess(_that);case AddFavoriteFailure():
return addFavoriteFailure(_that);case DeleteFavoriteLoading():
return deleteFavoriteLoading(_that);case DeleteFavoriteSuccess():
return deleteFavoriteSuccess(_that);case DeleteFavoriteFailure():
return deleteFavoriteFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetFavoritesLoading value)?  getFavoritesLoading,TResult? Function( GetFavoritesSuccess value)?  getFavoritesSuccess,TResult? Function( GetFavoritesFailure value)?  getFavoritesFailure,TResult? Function( AddFavoriteLoading value)?  addFavoriteLoading,TResult? Function( AddFavoriteSuccess value)?  addFavoriteSuccess,TResult? Function( AddFavoriteFailure value)?  addFavoriteFailure,TResult? Function( DeleteFavoriteLoading value)?  deleteFavoriteLoading,TResult? Function( DeleteFavoriteSuccess value)?  deleteFavoriteSuccess,TResult? Function( DeleteFavoriteFailure value)?  deleteFavoriteFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetFavoritesLoading() when getFavoritesLoading != null:
return getFavoritesLoading(_that);case GetFavoritesSuccess() when getFavoritesSuccess != null:
return getFavoritesSuccess(_that);case GetFavoritesFailure() when getFavoritesFailure != null:
return getFavoritesFailure(_that);case AddFavoriteLoading() when addFavoriteLoading != null:
return addFavoriteLoading(_that);case AddFavoriteSuccess() when addFavoriteSuccess != null:
return addFavoriteSuccess(_that);case AddFavoriteFailure() when addFavoriteFailure != null:
return addFavoriteFailure(_that);case DeleteFavoriteLoading() when deleteFavoriteLoading != null:
return deleteFavoriteLoading(_that);case DeleteFavoriteSuccess() when deleteFavoriteSuccess != null:
return deleteFavoriteSuccess(_that);case DeleteFavoriteFailure() when deleteFavoriteFailure != null:
return deleteFavoriteFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getFavoritesLoading,TResult Function( List<FavoriteBreed> favorites)?  getFavoritesSuccess,TResult Function( String error)?  getFavoritesFailure,TResult Function()?  addFavoriteLoading,TResult Function( String message)?  addFavoriteSuccess,TResult Function( String error)?  addFavoriteFailure,TResult Function()?  deleteFavoriteLoading,TResult Function( String message)?  deleteFavoriteSuccess,TResult Function( String error)?  deleteFavoriteFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetFavoritesLoading() when getFavoritesLoading != null:
return getFavoritesLoading();case GetFavoritesSuccess() when getFavoritesSuccess != null:
return getFavoritesSuccess(_that.favorites);case GetFavoritesFailure() when getFavoritesFailure != null:
return getFavoritesFailure(_that.error);case AddFavoriteLoading() when addFavoriteLoading != null:
return addFavoriteLoading();case AddFavoriteSuccess() when addFavoriteSuccess != null:
return addFavoriteSuccess(_that.message);case AddFavoriteFailure() when addFavoriteFailure != null:
return addFavoriteFailure(_that.error);case DeleteFavoriteLoading() when deleteFavoriteLoading != null:
return deleteFavoriteLoading();case DeleteFavoriteSuccess() when deleteFavoriteSuccess != null:
return deleteFavoriteSuccess(_that.message);case DeleteFavoriteFailure() when deleteFavoriteFailure != null:
return deleteFavoriteFailure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getFavoritesLoading,required TResult Function( List<FavoriteBreed> favorites)  getFavoritesSuccess,required TResult Function( String error)  getFavoritesFailure,required TResult Function()  addFavoriteLoading,required TResult Function( String message)  addFavoriteSuccess,required TResult Function( String error)  addFavoriteFailure,required TResult Function()  deleteFavoriteLoading,required TResult Function( String message)  deleteFavoriteSuccess,required TResult Function( String error)  deleteFavoriteFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetFavoritesLoading():
return getFavoritesLoading();case GetFavoritesSuccess():
return getFavoritesSuccess(_that.favorites);case GetFavoritesFailure():
return getFavoritesFailure(_that.error);case AddFavoriteLoading():
return addFavoriteLoading();case AddFavoriteSuccess():
return addFavoriteSuccess(_that.message);case AddFavoriteFailure():
return addFavoriteFailure(_that.error);case DeleteFavoriteLoading():
return deleteFavoriteLoading();case DeleteFavoriteSuccess():
return deleteFavoriteSuccess(_that.message);case DeleteFavoriteFailure():
return deleteFavoriteFailure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getFavoritesLoading,TResult? Function( List<FavoriteBreed> favorites)?  getFavoritesSuccess,TResult? Function( String error)?  getFavoritesFailure,TResult? Function()?  addFavoriteLoading,TResult? Function( String message)?  addFavoriteSuccess,TResult? Function( String error)?  addFavoriteFailure,TResult? Function()?  deleteFavoriteLoading,TResult? Function( String message)?  deleteFavoriteSuccess,TResult? Function( String error)?  deleteFavoriteFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetFavoritesLoading() when getFavoritesLoading != null:
return getFavoritesLoading();case GetFavoritesSuccess() when getFavoritesSuccess != null:
return getFavoritesSuccess(_that.favorites);case GetFavoritesFailure() when getFavoritesFailure != null:
return getFavoritesFailure(_that.error);case AddFavoriteLoading() when addFavoriteLoading != null:
return addFavoriteLoading();case AddFavoriteSuccess() when addFavoriteSuccess != null:
return addFavoriteSuccess(_that.message);case AddFavoriteFailure() when addFavoriteFailure != null:
return addFavoriteFailure(_that.error);case DeleteFavoriteLoading() when deleteFavoriteLoading != null:
return deleteFavoriteLoading();case DeleteFavoriteSuccess() when deleteFavoriteSuccess != null:
return deleteFavoriteSuccess(_that.message);case DeleteFavoriteFailure() when deleteFavoriteFailure != null:
return deleteFavoriteFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FavoriteState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.initial()';
}


}




/// @nodoc


class GetFavoritesLoading implements FavoriteState {
  const GetFavoritesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetFavoritesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.getFavoritesLoading()';
}


}




/// @nodoc


class GetFavoritesSuccess implements FavoriteState {
  const GetFavoritesSuccess(final  List<FavoriteBreed> favorites): _favorites = favorites;
  

 final  List<FavoriteBreed> _favorites;
 List<FavoriteBreed> get favorites {
  if (_favorites is EqualUnmodifiableListView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favorites);
}


/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetFavoritesSuccessCopyWith<GetFavoritesSuccess> get copyWith => _$GetFavoritesSuccessCopyWithImpl<GetFavoritesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetFavoritesSuccess&&const DeepCollectionEquality().equals(other._favorites, _favorites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favorites));

@override
String toString() {
  return 'FavoriteState.getFavoritesSuccess(favorites: $favorites)';
}


}

/// @nodoc
abstract mixin class $GetFavoritesSuccessCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $GetFavoritesSuccessCopyWith(GetFavoritesSuccess value, $Res Function(GetFavoritesSuccess) _then) = _$GetFavoritesSuccessCopyWithImpl;
@useResult
$Res call({
 List<FavoriteBreed> favorites
});




}
/// @nodoc
class _$GetFavoritesSuccessCopyWithImpl<$Res>
    implements $GetFavoritesSuccessCopyWith<$Res> {
  _$GetFavoritesSuccessCopyWithImpl(this._self, this._then);

  final GetFavoritesSuccess _self;
  final $Res Function(GetFavoritesSuccess) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? favorites = null,}) {
  return _then(GetFavoritesSuccess(
null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<FavoriteBreed>,
  ));
}


}

/// @nodoc


class GetFavoritesFailure implements FavoriteState {
  const GetFavoritesFailure({required this.error});
  

 final  String error;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetFavoritesFailureCopyWith<GetFavoritesFailure> get copyWith => _$GetFavoritesFailureCopyWithImpl<GetFavoritesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetFavoritesFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FavoriteState.getFavoritesFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class $GetFavoritesFailureCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $GetFavoritesFailureCopyWith(GetFavoritesFailure value, $Res Function(GetFavoritesFailure) _then) = _$GetFavoritesFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$GetFavoritesFailureCopyWithImpl<$Res>
    implements $GetFavoritesFailureCopyWith<$Res> {
  _$GetFavoritesFailureCopyWithImpl(this._self, this._then);

  final GetFavoritesFailure _self;
  final $Res Function(GetFavoritesFailure) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(GetFavoritesFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddFavoriteLoading implements FavoriteState {
  const AddFavoriteLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFavoriteLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.addFavoriteLoading()';
}


}




/// @nodoc


class AddFavoriteSuccess implements FavoriteState {
  const AddFavoriteSuccess({required this.message});
  

 final  String message;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddFavoriteSuccessCopyWith<AddFavoriteSuccess> get copyWith => _$AddFavoriteSuccessCopyWithImpl<AddFavoriteSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFavoriteSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FavoriteState.addFavoriteSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddFavoriteSuccessCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $AddFavoriteSuccessCopyWith(AddFavoriteSuccess value, $Res Function(AddFavoriteSuccess) _then) = _$AddFavoriteSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddFavoriteSuccessCopyWithImpl<$Res>
    implements $AddFavoriteSuccessCopyWith<$Res> {
  _$AddFavoriteSuccessCopyWithImpl(this._self, this._then);

  final AddFavoriteSuccess _self;
  final $Res Function(AddFavoriteSuccess) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddFavoriteSuccess(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddFavoriteFailure implements FavoriteState {
  const AddFavoriteFailure({required this.error});
  

 final  String error;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddFavoriteFailureCopyWith<AddFavoriteFailure> get copyWith => _$AddFavoriteFailureCopyWithImpl<AddFavoriteFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFavoriteFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FavoriteState.addFavoriteFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class $AddFavoriteFailureCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $AddFavoriteFailureCopyWith(AddFavoriteFailure value, $Res Function(AddFavoriteFailure) _then) = _$AddFavoriteFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AddFavoriteFailureCopyWithImpl<$Res>
    implements $AddFavoriteFailureCopyWith<$Res> {
  _$AddFavoriteFailureCopyWithImpl(this._self, this._then);

  final AddFavoriteFailure _self;
  final $Res Function(AddFavoriteFailure) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AddFavoriteFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteFavoriteLoading implements FavoriteState {
  const DeleteFavoriteLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteFavoriteLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.deleteFavoriteLoading()';
}


}




/// @nodoc


class DeleteFavoriteSuccess implements FavoriteState {
  const DeleteFavoriteSuccess({required this.message});
  

 final  String message;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteFavoriteSuccessCopyWith<DeleteFavoriteSuccess> get copyWith => _$DeleteFavoriteSuccessCopyWithImpl<DeleteFavoriteSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteFavoriteSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FavoriteState.deleteFavoriteSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeleteFavoriteSuccessCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $DeleteFavoriteSuccessCopyWith(DeleteFavoriteSuccess value, $Res Function(DeleteFavoriteSuccess) _then) = _$DeleteFavoriteSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeleteFavoriteSuccessCopyWithImpl<$Res>
    implements $DeleteFavoriteSuccessCopyWith<$Res> {
  _$DeleteFavoriteSuccessCopyWithImpl(this._self, this._then);

  final DeleteFavoriteSuccess _self;
  final $Res Function(DeleteFavoriteSuccess) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeleteFavoriteSuccess(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteFavoriteFailure implements FavoriteState {
  const DeleteFavoriteFailure({required this.error});
  

 final  String error;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteFavoriteFailureCopyWith<DeleteFavoriteFailure> get copyWith => _$DeleteFavoriteFailureCopyWithImpl<DeleteFavoriteFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteFavoriteFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FavoriteState.deleteFavoriteFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class $DeleteFavoriteFailureCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $DeleteFavoriteFailureCopyWith(DeleteFavoriteFailure value, $Res Function(DeleteFavoriteFailure) _then) = _$DeleteFavoriteFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$DeleteFavoriteFailureCopyWithImpl<$Res>
    implements $DeleteFavoriteFailureCopyWith<$Res> {
  _$DeleteFavoriteFailureCopyWithImpl(this._self, this._then);

  final DeleteFavoriteFailure _self;
  final $Res Function(DeleteFavoriteFailure) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DeleteFavoriteFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
