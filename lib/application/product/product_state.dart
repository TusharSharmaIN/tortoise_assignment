part of 'product_bloc.dart';

@freezed
abstract class ProductState with _$ProductState {
  const ProductState._();

  const factory ProductState({
    required Brand selectedBrand,
    required List<String> selectedEnteredBrands,
    required List<Brand> selectedBrands,
    required int currentProductImageIndex,
    required int selectedColorIndex,
    required int selectedStorageIndex,
  }) = _ProductState;

  factory ProductState.initial() => ProductState(
    selectedBrand: Brand.empty(),
    selectedEnteredBrands: <String>[],
    selectedBrands: <Brand>[],
    currentProductImageIndex: 0,
    selectedColorIndex: 0,
    selectedStorageIndex: 0,
  );

  List<Brand> get brandsList => Brand.dummyBrands;

  List<Product> get productsList => Product.dummyProducts;
}
