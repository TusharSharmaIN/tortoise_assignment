part of '../product_details_page.dart';

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
            'Storage'.toUpperCase(),
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
              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(storageOptions.length, (index) {
                  final isSelected = index == state.selectedStorageIndex;
                  return _StorageTile(
                    index: index,
                    isSelected: isSelected,
                    storageOptions: storageOptions,
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

class _StorageTile extends StatelessWidget {
  const _StorageTile({
    required this.index,
    required this.isSelected,
    required this.storageOptions,
  });

  final int index;
  final bool isSelected;
  final List<String> storageOptions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProductBloc>().add(
          ProductEvent.onStorageSelected(index: index),
        );
      },
      child: Container(
        width: 110,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? BaseColors.brightGreen : BaseColors.borderGrey,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: BaseColors.black.withValues(alpha: 0.05),
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioIcon(isSelected: isSelected),
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
    );
  }
}

class RadioIcon extends StatelessWidget {
  const RadioIcon({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? BaseColors.brightGreen : BaseColors.slateGrey,
          width: isSelected ? 4 : 1,
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
    );
  }
}
