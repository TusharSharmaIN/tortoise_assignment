import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tortoise_assignment/application/product/product_bloc.dart';
import 'package:tortoise_assignment/presentation/core/widgets/custom_app_bar.dart';
import 'package:tortoise_assignment/presentation/router/route.dart';
import 'package:tortoise_assignment/presentation/theme/base_colors.dart';
import 'package:tortoise_assignment/presentation/theme/base_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.backGroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar.widgetTitle(widgetTitle: const InputBrand()),
            const Expanded(child: HomePageWidget()),
          ],
        ),
      ),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Search from popular brands',
                style: BaseTextStyles.textLargeBold.copyWith(
                  color: BaseColors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const BrandsList(),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Available devices',
                style: BaseTextStyles.textLargeBold.copyWith(
                  color: BaseColors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const ProductsGrid(),
          ],
        ),
      ),
    );
  }
}

class InputBrand extends StatefulWidget {
  const InputBrand({super.key});

  @override
  State<InputBrand> createState() => _InputBrandState();
}

class _InputBrandState extends State<InputBrand> {
  late final TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (prev, curr) =>
          prev.selectedEnteredBrands != curr.selectedEnteredBrands,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 24, 12),
          child: Container(
            decoration: BoxDecoration(
              color: BaseColors.lightGrey,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _focusNode.hasFocus
                    ? BaseColors.black
                    : BaseColors.shadowGrey,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  PhosphorIcons.magnifyingGlass(),
                  size: 24,
                  color: BaseColors.black,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...state.selectedEnteredBrands.map(
                          (brandStr) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Chip(
                              label: Text(
                                brandStr,
                                style: BaseTextStyles.textLargeSemiBold
                                    .copyWith(color: BaseColors.black),
                              ),
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              deleteIcon: Icon(
                                PhosphorIcons.xCircle(PhosphorIconsStyle.fill),
                                size: 18,
                                color: Colors.black,
                              ),
                              onDeleted: () {
                                context.read<ProductBloc>().add(
                                  ProductEvent.onBrandChipRemove(
                                    value: brandStr,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 60,
                            maxWidth: 200,
                          ),
                          child: TextFormField(
                            controller: _controller,
                            focusNode: _focusNode,
                            cursorColor: BaseColors.shadowGrey,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: state.selectedBrands.isEmpty
                                  ? 'Enter brand'
                                  : '',
                              hintStyle: BaseTextStyles.textLargeSemiBold
                                  .copyWith(color: BaseColors.shadowGrey),
                              contentPadding: EdgeInsets.zero,
                            ),
                            onFieldSubmitted: (value) {
                              if (value.trim().isNotEmpty) {
                                context.read<ProductBloc>().add(
                                  ProductEvent.onBrandSearchUpdate(
                                    value: value.trim(),
                                  ),
                                );
                                _controller.clear();
                              }
                            },
                            onChanged: (value) {
                              if (value.endsWith('\n')) {
                                context.read<ProductBloc>().add(
                                  ProductEvent.onBrandSearchUpdate(
                                    value: value.trim(),
                                  ),
                                );
                                _controller.clear();
                              }
                            },
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BrandsList extends StatelessWidget {
  const BrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) =>
          previous.selectedBrand != current.selectedBrand,
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.brandsList.length,
            itemBuilder: (context, index) {
              final brand = state.brandsList[index];
              return GestureDetector(
                onTap: () {
                  if (state.selectedBrand == brand) return;
                  context.read<ProductBloc>().add(
                    ProductEvent.onBrandSelectionUpdate(value: brand),
                  );
                },
                child: Container(
                  width: 110,
                  height: 80,
                  padding: const EdgeInsets.only(right: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: state.selectedBrand == brand
                          ? const BorderSide(width: 2, color: BaseColors.black)
                          : BorderSide.none,
                    ),
                    color: BaseColors.cardBackground,
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        SvgPicture.asset(brand.iconPath, height: 24),
                        Text(
                          brand.name,
                          style: BaseTextStyles.textSmallSemiBold.copyWith(
                            color: BaseColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsList = context.read<ProductBloc>().state.productsList;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1.2,
      ),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        final product = productsList[index];
        return GestureDetector(
          onTap: () {
            context.push(AppRoutes.productDetails, extra: {'product': product});
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: BaseColors.white,
            shadowColor: BaseColors.shadowGrey.withValues(alpha: 0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  product.images.first,
                  fit: BoxFit.contain,
                  width: 100,
                  height: 80,
                ),
                const SizedBox(height: 16),
                Text(
                  product.name,
                  style: BaseTextStyles.textSmallSemiBold.copyWith(
                    color: BaseColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
