// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SampleDto {

 String get label;
/// Create a copy of SampleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SampleDtoCopyWith<SampleDto> get copyWith => _$SampleDtoCopyWithImpl<SampleDto>(this as SampleDto, _$identity);

  /// Serializes this SampleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SampleDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleDto&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SampleDto;
  return Object.hash(runtimeType,_this.label);
}

@override
String toString() {
  final _this = this as SampleDto;
  return 'SampleDto(label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $SampleDtoCopyWith<$Res>  {
  factory $SampleDtoCopyWith(SampleDto value, $Res Function(SampleDto) _then) = _$SampleDtoCopyWithImpl;
@useResult
$Res call({
 String label
});




}
/// @nodoc
class _$SampleDtoCopyWithImpl<$Res>
    implements $SampleDtoCopyWith<$Res> {
  _$SampleDtoCopyWithImpl(this._self, this._then);

  final SampleDto _self;
  final $Res Function(SampleDto) _then;

/// Create a copy of SampleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,}) {
  return _then(SampleDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SampleDto].
extension SampleDtoPatterns on SampleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SampleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SampleDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SampleDto value)  $default,){
final _that = this;
switch (_that) {
case _SampleDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SampleDto value)?  $default,){
final _that = this;
switch (_that) {
case _SampleDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SampleDto() when $default != null:
return $default(_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label)  $default,) {final _that = this;
switch (_that) {
case _SampleDto():
return $default(_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label)?  $default,) {final _that = this;
switch (_that) {
case _SampleDto() when $default != null:
return $default(_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SampleDto implements SampleDto {
  const _SampleDto({required this.label});
  factory _SampleDto.fromJson(Map<String, dynamic> json) => _$SampleDtoFromJson(json);

@override final  String label;

/// Create a copy of SampleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SampleDtoCopyWith<_SampleDto> get copyWith => __$SampleDtoCopyWithImpl<_SampleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SampleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SampleDto&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label);
}

@override
String toString() {
    return 'SampleDto(label: $label)';
}


}

/// @nodoc
abstract mixin class _$SampleDtoCopyWith<$Res> implements $SampleDtoCopyWith<$Res> {
  factory _$SampleDtoCopyWith(_SampleDto value, $Res Function(_SampleDto) _then) = __$SampleDtoCopyWithImpl;
@override @useResult
$Res call({
 String label
});




}
/// @nodoc
class __$SampleDtoCopyWithImpl<$Res>
    implements _$SampleDtoCopyWith<$Res> {
  __$SampleDtoCopyWithImpl(this._self, this._then);

  final _SampleDto _self;
  final $Res Function(_SampleDto) _then;

/// Create a copy of SampleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,}) {
  return _then(_SampleDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SampleEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SampleEvent()';
}


}

/// @nodoc
class $SampleEventCopyWith<$Res>  {
$SampleEventCopyWith(SampleEvent _, $Res Function(SampleEvent) __);
}


/// Adds pattern-matching-related methods to [SampleEvent].
extension SampleEventPatterns on SampleEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SampleRequested value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SampleRequested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SampleRequested value)  requested,}){
final _that = this;
switch (_that) {
case SampleRequested():
return requested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SampleRequested value)?  requested,}){
final _that = this;
switch (_that) {
case SampleRequested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SampleRequested() when requested != null:
return requested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requested,}) {final _that = this;
switch (_that) {
case SampleRequested():
return requested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requested,}) {final _that = this;
switch (_that) {
case SampleRequested() when requested != null:
return requested();case _:
  return null;

}
}

}

/// @nodoc


class SampleRequested implements SampleEvent {
  const SampleRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SampleEvent.requested()';
}


}




/// @nodoc
mixin _$SampleState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SampleState()';
}


}

/// @nodoc
class $SampleStateCopyWith<$Res>  {
$SampleStateCopyWith(SampleState _, $Res Function(SampleState) __);
}


/// Adds pattern-matching-related methods to [SampleState].
extension SampleStatePatterns on SampleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SampleLoading value)?  loading,TResult Function( SampleSuccess value)?  success,TResult Function( SampleError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SampleLoading() when loading != null:
return loading(_that);case SampleSuccess() when success != null:
return success(_that);case SampleError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SampleLoading value)  loading,required TResult Function( SampleSuccess value)  success,required TResult Function( SampleError value)  error,}){
final _that = this;
switch (_that) {
case SampleLoading():
return loading(_that);case SampleSuccess():
return success(_that);case SampleError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SampleLoading value)?  loading,TResult? Function( SampleSuccess value)?  success,TResult? Function( SampleError value)?  error,}){
final _that = this;
switch (_that) {
case SampleLoading() when loading != null:
return loading(_that);case SampleSuccess() when success != null:
return success(_that);case SampleError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( SampleDto value)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SampleLoading() when loading != null:
return loading();case SampleSuccess() when success != null:
return success(_that.value);case SampleError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( SampleDto value)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SampleLoading():
return loading();case SampleSuccess():
return success(_that.value);case SampleError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( SampleDto value)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SampleLoading() when loading != null:
return loading();case SampleSuccess() when success != null:
return success(_that.value);case SampleError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SampleLoading implements SampleState {
  const SampleLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SampleState.loading()';
}


}




/// @nodoc


class SampleSuccess implements SampleState {
  const SampleSuccess(this.value);
  

 final  SampleDto value;

/// Create a copy of SampleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SampleSuccessCopyWith<SampleSuccess> get copyWith => _$SampleSuccessCopyWithImpl<SampleSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleSuccess&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode {
    return Object.hash(runtimeType,value);
}

@override
String toString() {
    return 'SampleState.success(value: $value)';
}


}

/// @nodoc
abstract mixin class $SampleSuccessCopyWith<$Res> implements $SampleStateCopyWith<$Res> {
  factory $SampleSuccessCopyWith(SampleSuccess value, $Res Function(SampleSuccess) _then) = _$SampleSuccessCopyWithImpl;
@useResult
$Res call({
 SampleDto value
});


$SampleDtoCopyWith<$Res> get value;

}
/// @nodoc
class _$SampleSuccessCopyWithImpl<$Res>
    implements $SampleSuccessCopyWith<$Res> {
  _$SampleSuccessCopyWithImpl(this._self, this._then);

  final SampleSuccess _self;
  final $Res Function(SampleSuccess) _then;

/// Create a copy of SampleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(SampleSuccess(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as SampleDto,
  ));
}

/// Create a copy of SampleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SampleDtoCopyWith<$Res> get value {
  
  return $SampleDtoCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class SampleError implements SampleState {
  const SampleError(this.message);
  

 final  String message;

/// Create a copy of SampleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SampleErrorCopyWith<SampleError> get copyWith => _$SampleErrorCopyWithImpl<SampleError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SampleError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SampleState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SampleErrorCopyWith<$Res> implements $SampleStateCopyWith<$Res> {
  factory $SampleErrorCopyWith(SampleError value, $Res Function(SampleError) _then) = _$SampleErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SampleErrorCopyWithImpl<$Res>
    implements $SampleErrorCopyWith<$Res> {
  _$SampleErrorCopyWithImpl(this._self, this._then);

  final SampleError _self;
  final $Res Function(SampleError) _then;

/// Create a copy of SampleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SampleError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
