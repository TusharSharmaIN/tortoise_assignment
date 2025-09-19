import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tortoise_assignment/presentation/theme/base_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.widgetTitle, this.textTitle});
  final Widget? widgetTitle;
  final Widget? textTitle;

  factory CustomAppBar.widgetTitle({required Widget widgetTitle}) =>
      CustomAppBar(widgetTitle: widgetTitle);

  factory CustomAppBar.textTitle({required Widget textTitle}) =>
      CustomAppBar(textTitle: textTitle);

  @override
  Widget build(BuildContext context) {
    if (textTitle != null) {
      return Container(
        height: 80,
        color: BaseColors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: AppBackButton(),
            ),
            Center(child: textTitle),
          ],
        ),
      );
    }
    if (widgetTitle != null) {
      return Container(
        height: 80,
        color: BaseColors.white,
        child: Row(
          children: [
            const AppBackButton(),
            Expanded(child: widgetTitle!),
          ],
        ),
      );
    }
    return const Align(alignment: Alignment.centerLeft, child: AppBackButton());
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
    this.onPressed,
  });
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  void _onPressed(BuildContext context) {
    if (onPressed != null) {
      onPressed!();
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton.filled(
        style: IconButton.styleFrom(
          backgroundColor: BaseColors.grey2,
          foregroundColor: BaseColors.white,
        ),
        onPressed: () => _onPressed(context),
        icon: Icon(PhosphorIcons.caretLeft()),
      ),
    );
  }
}
