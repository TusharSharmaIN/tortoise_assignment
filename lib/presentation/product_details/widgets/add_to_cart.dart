part of '../product_details_page.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
      decoration: BoxDecoration(
        color: BaseColors.backGroundWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        spacing: 12,
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  tileColor: BaseColors.backGroundWhite,
                  title: Text(
                    'Device Price'.toUpperCase(),
                    style: BaseTextStyles.textSmallBold.copyWith(
                      color: BaseColors.primaryBlack,
                    ),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹ 1,38,963',
                        style: BaseTextStyles.textExtraLargeBold.copyWith(
                          color: BaseColors.primaryBlack,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Monthly deduction ₹18,900',
                          style: BaseTextStyles.textSmallSemiBold.copyWith(
                            color: BaseColors.textGrey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {
                    EffectivePriceSheet.show(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: BaseColors.brightGreen,
                      width: 1,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Effective Price'.toUpperCase(),
                          style: BaseTextStyles.textSmallBold.copyWith(
                            color: BaseColors.primaryBlack,
                          ),
                        ),
                      ),
                      Icon(
                        PhosphorIcons.caretCircleRight(PhosphorIconsStyle.fill),
                        color: BaseColors.primaryGreen,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹ 92,483',
                        style: BaseTextStyles.textExtraLargeBold.copyWith(
                          color: BaseColors.primaryGreen,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'See impact in net-salary',
                          style: BaseTextStyles.textSmallSemiBold.copyWith(
                            color: BaseColors.primaryGreen,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add to Cart',
                style: BaseTextStyles.textLargeBold.copyWith(
                  color: BaseColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
