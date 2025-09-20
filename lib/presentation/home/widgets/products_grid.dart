part of '../home_page.dart';

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
        return _ProductTile(product: product);
      },
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails, extra: {'product': product});
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
  }
}
