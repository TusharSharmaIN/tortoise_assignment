part of '../product_details_page.dart';

class ShippingEstimate extends StatelessWidget {
  const ShippingEstimate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      alignment: Alignment.center,
      color: BaseColors.lightYellow,
      child: Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(
              child: Icon(
                PhosphorIconsRegular.truck,
                color: BaseColors.darkyellow,
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            const WidgetSpan(child: SizedBox(width: 12)),
            TextSpan(
              text: 'Shipping starts from 19th September onwards',
              style: BaseTextStyles.textSemiMediumSemiBold.copyWith(
                color: BaseColors.darkyellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
