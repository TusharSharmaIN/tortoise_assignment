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
              return _BrandTile(
                brand: brand,
                isSelectedAndCurrentBranchSame: state.selectedBrand == brand,
              );
            },
          ),
        );
      },
    );
  }
}

class _BrandTile extends StatelessWidget {
  const _BrandTile({
    required this.brand,
    required this.isSelectedAndCurrentBranchSame,
  });

  final Brand brand;
  final bool isSelectedAndCurrentBranchSame;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelectedAndCurrentBranchSame) return;
        context.read<ProductBloc>().add(
          ProductEvent.onBrandSelectionUpdate(value: brand),
        );
      },
      child: Container(
        width: 110,
        height: 80,
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: BaseColors.cardBackground,
            border: isSelectedAndCurrentBranchSame
                ? Border.all(color: BaseColors.black, width: 2)
                : Border.all(color: BaseColors.slateGrey, width: 0.5),
          ),
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
  }
}
