import 'package:go_router/go_router.dart';
import 'package:tortoise_assignment/domain/product/entities/product.dart';
import 'package:tortoise_assignment/presentation/home/home_page.dart';
import 'package:tortoise_assignment/presentation/product_details/product_details_page.dart';

final goRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      builder: (context, state) {
        final extra = state.extra as Map<String, Product>;
        final product = extra['product'] ?? Product.empty();
        return ProductDetailsPage(product: product);
      },
    ),
  ],
);

class AppRoutes {
  static const String home = '/home';
  static const String productDetails = '/product_details';
}
