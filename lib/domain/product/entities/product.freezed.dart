// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Product {

 String get name; List<String> get images; List<Color> get colorOptions; List<String> get storageOptions;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.colorOptions, colorOptions)&&const DeepCollectionEquality().equals(other.storageOptions, storageOptions));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(colorOptions),const DeepCollectionEquality().hash(storageOptions));

@override
String toString() {
  return 'Product(name: $name, images: $images, colorOptions: $colorOptions, storageOptions: $storageOptions)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String name, List<String> images, List<Color> colorOptions, List<String> storageOptions
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? images = null,Object? colorOptions = null,Object? storageOptions = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,colorOptions: null == colorOptions ? _self.colorOptions : colorOptions // ignore: cast_nullable_to_non_nullable
as List<Color>,storageOptions: null == storageOptions ? _self.storageOptions : storageOptions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> images,  List<Color> colorOptions,  List<String> storageOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.name,_that.images,_that.colorOptions,_that.storageOptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> images,  List<Color> colorOptions,  List<String> storageOptions)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.name,_that.images,_that.colorOptions,_that.storageOptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> images,  List<Color> colorOptions,  List<String> storageOptions)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.name,_that.images,_that.colorOptions,_that.storageOptions);case _:
  return null;

}
}

}

/// @nodoc


class _Product extends Product {
  const _Product({required this.name, required final  List<String> images, required final  List<Color> colorOptions, required final  List<String> storageOptions}): _images = images,_colorOptions = colorOptions,_storageOptions = storageOptions,super._();
  

@override final  String name;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<Color> _colorOptions;
@override List<Color> get colorOptions {
  if (_colorOptions is EqualUnmodifiableListView) return _colorOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colorOptions);
}

 final  List<String> _storageOptions;
@override List<String> get storageOptions {
  if (_storageOptions is EqualUnmodifiableListView) return _storageOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_storageOptions);
}


/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._colorOptions, _colorOptions)&&const DeepCollectionEquality().equals(other._storageOptions, _storageOptions));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_colorOptions),const DeepCollectionEquality().hash(_storageOptions));

@override
String toString() {
  return 'Product(name: $name, images: $images, colorOptions: $colorOptions, storageOptions: $storageOptions)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> images, List<Color> colorOptions, List<String> storageOptions
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? images = null,Object? colorOptions = null,Object? storageOptions = null,}) {
  return _then(_Product(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,colorOptions: null == colorOptions ? _self._colorOptions : colorOptions // ignore: cast_nullable_to_non_nullable
as List<Color>,storageOptions: null == storageOptions ? _self._storageOptions : storageOptions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
