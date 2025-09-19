import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tortoise_assignment/presentation/core/utils/assets.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const Product._();

  const factory Product({
    required String name,
    required List<String> images,
    required List<Color> colorOptions,
    required List<String> storageOptions,
  }) = _Product;

  factory Product.empty() => const Product(
    name: '',
    images: <String>[],
    colorOptions: <Color>[],
    storageOptions: <String>[],
  );

  static List<Product> get dummyProducts => [
    const Product(
      name: 'iPhone 16',
      images: [
        Assets.iphone16,
        Assets.iphone16Plus,
        Assets.iphone16Pro,
        Assets.iphone16ProMax,
      ],
      colorOptions: [
        Color(0xFF464A4C), // Space Gray
        Color(0xFFD0DBCC), // Mint
        Color(0xFFEEE9CC), // Golden
        Color(0xFFEDD4D7), // Rose Gold
        Color(0xFFD6DDE0), // Silver
      ],
      storageOptions: ['128 GB', '256 GB', '512 GB', '1 TB'],
    ),
    const Product(
      name: 'iPhone 16 Plus',
      images: [
        Assets.iphone16Plus,
        Assets.iphone16,
        Assets.iphone16Pro,
        Assets.iphone16ProMax,
      ],
      colorOptions: [
        Color(0xFFD0DBCC), // Mint
        Color(0xFF464A4C), // Space Gray
        Color(0xFFEDD4D7), // Rose Gold
      ],
      storageOptions: ['128 GB', '256 GB', '512 GB'],
    ),
    const Product(
      name: 'iPhone 16 Pro',
      images: [
        Assets.iphone16Pro,
        Assets.iphone16,
        Assets.iphone16Plus,
        Assets.iphone16ProMax,
      ],
      colorOptions: [
        Color(0xFFEEE9CC), // Golden
        Color(0xFFD6DDE0), // Silver
        Color(0xFFD0DBCC), // Mint
        Color(0xFF464A4C), // Space Gray
      ],
      storageOptions: ['256 GB', '512 GB', '1 TB'],
    ),
    const Product(
      name: 'iPhone 16 Pro Max',
      images: [
        Assets.iphone16ProMax,
        Assets.iphone16Plus,
        Assets.iphone16,
        Assets.iphone16Pro,
      ],
      colorOptions: [
        Color(0xFFEDD4D7), // Rose Gold
        Color(0xFFD6DDE0), // Silver
      ],
      storageOptions: ['256 GB', '512 GB', '1 TB'],
    ),
    const Product(
      name: 'MacBook Pro',
      images: [Assets.macbookPro, Assets.macbookAir2024],
      colorOptions: [
        Color(0xFFD6DDE0), // Silver
        Color(0xFFD0DBCC), // Mint
      ],
      storageOptions: ['256 GB', '512 GB', '1 TB', '2 TB'],
    ),
    const Product(
      name: 'iPad Pro',
      images: [Assets.ipadPro, Assets.ipadPro5thGen],
      colorOptions: [
        Color(0xFF464A4C), // Space Gray
        Color(0xFFEEE9CC), // Golden
        Color(0xFFD0DBCC), // Mint
      ],
      storageOptions: ['128 GB', '256 GB', '512 GB'],
    ),
    const Product(
      name: 'iPhone 15',
      images: [Assets.iphone15, Assets.iphone15Plus],
      colorOptions: [
        Color(0xFFEDD4D7), // Rose Gold
        Color(0xFFD0DBCC), // Mint
        Color(0xFFEEE9CC), // Golden
        Color(0xFFD6DDE0), // Silver
      ],
      storageOptions: ['128 GB', '256 GB', '512 GB'],
    ),
    const Product(
      name: 'iPhone 15 Plus',
      images: [Assets.iphone15Plus, Assets.iphone15],
      colorOptions: [
        Color(0xFFD0DBCC), // Mint
        Color(0xFF464A4C), // Space Gray
      ],
      storageOptions: ['128 GB', '256 GB'],
    ),
    const Product(
      name: 'iPad Pro 5th Gen',
      images: [Assets.ipadPro5thGen, Assets.ipadPro],
      colorOptions: [
        Color(0xFFEEE9CC), // Golden
        Color(0xFFD6DDE0), // Silver
        Color(0xFFEDD4D7), // Rose Gold
      ],
      storageOptions: ['128 GB', '256 GB', '512 GB'],
    ),
    const Product(
      name: 'MacBook Air 2024',
      images: [Assets.macbookAir2024, Assets.macbookPro],
      colorOptions: [
        Color(0xFFD6DDE0), // Silver
        Color(0xFFD0DBCC), // Mint
        Color(0xFF464A4C), // Space Gray
      ],
      storageOptions: ['256 GB', '512 GB', '1 TB'],
    ),
  ];
}
