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

part 'widgets/input_brand.dart';
part 'widgets/brands_list.dart';
part 'widgets/products_grid.dart';
part 'widgets/section_heading.dart';

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
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(heading: 'Search from popular brands'),
            SizedBox(height: 16),
            BrandsList(),
            SizedBox(height: 16),
            SectionHeading(heading: 'Available devices'),
            SizedBox(height: 16),
            ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
