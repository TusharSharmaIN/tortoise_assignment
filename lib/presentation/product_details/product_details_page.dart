import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tortoise_assignment/application/product/product_bloc.dart';
import 'package:tortoise_assignment/domain/product/entities/product.dart';
import 'package:tortoise_assignment/presentation/core/utils/assets.dart';
import 'package:tortoise_assignment/presentation/core/widgets/custom_app_bar.dart';
import 'package:tortoise_assignment/presentation/theme/base_colors.dart';
import 'package:tortoise_assignment/presentation/theme/base_text_styles.dart';

part 'widgets/shipping_estimates.dart';
part 'widgets/product_image_carousel.dart';
part 'widgets/protected_with_tortoise.dart';
part 'widgets/pick_color.dart';
part 'widgets/pick_storage.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(
      const ProductEvent.onProductImageSlide(index: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.backGroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar.textTitle(
              textTitle: Text(
                widget.product.name,
                style: BaseTextStyles.textHugeBold.copyWith(
                  color: BaseColors.black,
                ),
              ),
            ),
            ProductDetailsPageWidget(product: widget.product),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPageWidget extends StatelessWidget {
  const ProductDetailsPageWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShippingEstimate(),
            ProductImageCarousel(imageUrls: product.images),
            const SizedBox(height: 16),
            const ProtectedWithTortoise(),
            const SizedBox(height: 16),
            PickColor(colorOptions: product.colorOptions),
            const SizedBox(height: 16),
            PickStorage(storageOptions: product.storageOptions),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
