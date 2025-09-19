part of '../product_details_page.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) =>
          previous.isImageBannerExpanded != current.isImageBannerExpanded,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    axis: Axis.vertical,
                    child: child,
                  );
                },
                child: state.isImageBannerExpanded
                    ? Image.asset(Assets.iphone16Banner, fit: BoxFit.fill)
                    : Container(
                        height: 240,
                        width: double.infinity,
                        child: Image.asset(
                          Assets.iphone16Banner,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                splashColor: BaseColors.transparent,
                onTap: () {
                  context.read<ProductBloc>().add(
                    const ProductEvent.onExpandToggled(
                      type: ExpansionType.imageBanner,
                    ),
                  );
                },
                title: Text(
                  state.isImageBannerExpanded ? 'Show Less' : 'View More',
                  style: BaseTextStyles.textSemiMediumBold.copyWith(
                    color: BaseColors.primaryGreen,
                  ),
                ),
                trailing: ExpansionButton.caretCircle(
                  isExpanded: state.isImageBannerExpanded,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
