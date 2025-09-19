part of '../product_details_page.dart';

class SpecificationsView extends StatelessWidget {
  const SpecificationsView({super.key, required this.specifications});
  final List<Specifications> specifications;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocBuilder<ProductBloc, ProductState>(
        buildWhen: (previous, current) =>
            previous.isSpecificationExpanded != current.isSpecificationExpanded,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Specifications'.toUpperCase(),
                style: BaseTextStyles.textSmallBold.copyWith(
                  color: BaseColors.slateGrey,
                ),
              ),
              const SizedBox(height: 12),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    axis: Axis.vertical,
                    child: child,
                  );
                },
                child: state.isSpecificationExpanded
                    ? ShowSpecifications(specifications: specifications)
                    : ShowSpecifications(
                        specifications: specifications,
                        limit: 2,
                      ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                splashColor: BaseColors.transparent,
                onTap: () {
                  context.read<ProductBloc>().add(
                    const ProductEvent.onExpandToggled(
                      type: ExpansionType.specifications,
                    ),
                  );
                },
                title: Text(
                  state.isSpecificationExpanded ? 'Show Less' : 'View More',
                  style: BaseTextStyles.textSemiMediumBold.copyWith(
                    color: BaseColors.primaryGreen,
                  ),
                ),
                trailing: ExpansionButton.caretCircle(
                  isExpanded: state.isSpecificationExpanded,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ShowSpecifications extends StatelessWidget {
  const ShowSpecifications({
    super.key,
    required this.specifications,
    this.limit = -1,
  });
  final List<Specifications> specifications;
  final int limit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: BaseColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: BaseColors.borderGrey, width: 1),
      ),
      child: ListView.builder(
        itemCount: specifications.length > limit && limit != -1
            ? limit
            : specifications.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final spec = specifications[index];
          return SpecsListTile(
            title: spec.type,
            subTitle: spec.value,
            leadingIcon: spec.iconData,
          );
        },
      ),
    );
  }
}

class SpecsListTile extends StatelessWidget {
  const SpecsListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.leadingIcon,
  });
  final String title;
  final String subTitle;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 8),
      dense: true,
      leading: Icon(leadingIcon, size: 24),
      title: Text(
        title,
        style: BaseTextStyles.textMediumBold.copyWith(
          color: BaseColors.textGrey,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: BaseTextStyles.textSmallSemiBold.copyWith(
          color: BaseColors.textGrey,
        ),
      ),
    );
  }
}
