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

// --- Restored missing widgets ---
class ShippingEstimate extends StatelessWidget {
  const ShippingEstimate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      alignment: Alignment.center,
      color: BaseColors.lightYellow,
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: Icon(PhosphorIcons.truck(), color: BaseColors.darkyellow),
              alignment: PlaceholderAlignment.middle,
            ),
            const WidgetSpan(child: SizedBox(width: 12)),
            TextSpan(
              text: 'Shipping starts from 19th September onwards',
              style: BaseTextStyles.textSemiMediumSemiBold.copyWith(
                color: BaseColors.darkyellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImageCarousel extends StatelessWidget {
  const ProductImageCarousel({super.key, required this.imageUrls});
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return _ProductImageCarouselWithIndicator(imageUrls: imageUrls);
  }
}

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

class PickStorage extends StatelessWidget {
  const PickStorage({super.key, required this.storageOptions});
  final List<String> storageOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Storage',
            style: BaseTextStyles.textSmallBold.copyWith(
              color: BaseColors.slateGrey,
            ),
          ),
          Text(
            'How much space do you need',
            style: BaseTextStyles.textLargeSemiBold.copyWith(
              color: BaseColors.black,
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<ProductBloc, ProductState>(
            buildWhen: (previous, current) =>
                previous.selectedStorageIndex != current.selectedStorageIndex,
            builder: (context, state) {
              final rows = <Widget>[];
              for (var i = 0; i < storageOptions.length; i += 3) {
                final itemsInRow = (i + 3 <= storageOptions.length)
                    ? 3
                    : storageOptions.length - i;
                final rowItems = List.generate(itemsInRow, (j) {
                  final index = i + j;
                  final isSelected = index == state.selectedStorageIndex;
                  // Only add right padding if not the last item in the row
                  final isLast = j == itemsInRow - 1;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 12,
                        right: isLast ? 0 : 12,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          context.read<ProductBloc>().add(
                            ProductEvent.onStorageSelected(index: index),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: BaseColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? BaseColors.brightGreen
                                  : BaseColors.borderGrey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? BaseColors.brightGreen
                                        : BaseColors.borderGrey,
                                    width: 2,
                                  ),
                                ),
                                child: isSelected
                                    ? Center(
                                        child: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            color: BaseColors.white,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  storageOptions[index],
                                  style: BaseTextStyles.textMediumBold.copyWith(
                                    color: BaseColors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
                rows.add(
                  Row(mainAxisSize: MainAxisSize.max, children: rowItems),
                );
              }
              return Column(children: rows);
            },
          ),
        ],
      ),
    );
  }
}

class _ProductImageCarouselWithIndicator extends StatelessWidget {
  _ProductImageCarouselWithIndicator({Key? key, required this.imageUrls})
    : super(key: key);
  final List<String> imageUrls;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          color: BaseColors.white,
          child: PageView.builder(
            controller: _controller,
            itemCount: imageUrls.length,
            onPageChanged: (index) {
              context.read<ProductBloc>().add(
                ProductEvent.onProductImageSlide(index: index),
              );
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(imageUrls[index], fit: BoxFit.contain),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _ImageIndicator(count: imageUrls.length),
          ),
        ),
      ],
    );
  }
}

class _ImageIndicator extends StatelessWidget {
  final int count;
  const _ImageIndicator({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) =>
          previous.currentProductImageIndex != current.currentProductImageIndex,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            color: BaseColors.darkGrey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(count, (index) {
              final isSelected = index == state.currentProductImageIndex;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: isSelected
                      ? BoxDecoration(
                          color: BaseColors.white,
                          borderRadius: BorderRadius.circular(8),
                        )
                      : const BoxDecoration(
                          color: BaseColors.slateGrey,
                          shape: BoxShape.circle,
                        ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class ProtectedWithTortoise extends StatelessWidget {
  const ProtectedWithTortoise({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      alignment: Alignment.center,
      color: BaseColors.darkGreen,
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: SvgPicture.asset(Assets.protectedShield),
              alignment: PlaceholderAlignment.middle,
            ),
            const WidgetSpan(child: SizedBox(width: 12)),
            TextSpan(
              text: 'Protected with Tortoise Corporate Care',
              style: BaseTextStyles.textMediumSemiBold.copyWith(
                color: BaseColors.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PickColor extends StatelessWidget {
  const PickColor({super.key, required this.colorOptions});
  final List<Color> colorOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Finish',
            style: BaseTextStyles.textSmallBold.copyWith(
              color: BaseColors.slateGrey,
            ),
          ),
          Text(
            'Pick Color',
            style: BaseTextStyles.textLargeSemiBold.copyWith(
              color: BaseColors.black,
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<ProductBloc, ProductState>(
            buildWhen: (previous, current) =>
                previous.selectedColorIndex != current.selectedColorIndex,
            builder: (context, state) {
              return Row(
                children: List.generate(colorOptions.length, (index) {
                  final color = colorOptions[index];
                  final isSelected = index == state.selectedColorIndex;
                  return GestureDetector(
                    onTap: () {
                      context.read<ProductBloc>().add(
                        ProductEvent.onColorSelected(index: index),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      decoration: isSelected
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: BaseColors.brightGreen,
                                width: 4,
                              ),
                            )
                          : null,
                      child: CircleAvatar(radius: 18, backgroundColor: color),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
