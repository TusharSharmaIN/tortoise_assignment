part of '../home_page.dart';

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
