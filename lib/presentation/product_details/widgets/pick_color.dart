part of '../product_details_page.dart';

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
