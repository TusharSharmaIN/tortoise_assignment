part of '../home_page.dart';

class InputBrand extends StatefulWidget {
  const InputBrand({super.key});

  @override
  State<InputBrand> createState() => _InputBrandState();
}

class _InputBrandState extends State<InputBrand> {
  late final TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (prev, curr) =>
          prev.selectedEnteredBrands != curr.selectedEnteredBrands,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: BaseColors.lightGrey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? BaseColors.black
                  : BaseColors.shadowGrey,
              width: 1.5,
            ),
          ),
          margin: const EdgeInsets.fromLTRB(8, 12, 24, 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                PhosphorIconsRegular.magnifyingGlass,
                size: 24,
                color: BaseColors.black,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _BrandChips(brands: state.selectedEnteredBrands),
                      _BrandInputField(
                        controller: _controller,
                        focusNode: _focusNode,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BrandChips extends StatelessWidget {
  const _BrandChips({required this.brands});
  final List<String> brands;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: brands
          .map(
            (brandStr) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text(
                  brandStr,
                  style: BaseTextStyles.textLargeSemiBold.copyWith(
                    color: BaseColors.black,
                  ),
                ),
                padding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide.none,
                deleteIcon: const Icon(
                  PhosphorIconsFill.xCircle,
                  size: 18,
                  color: Colors.black,
                ),
                onDeleted: () {
                  context.read<ProductBloc>().add(
                    ProductEvent.onBrandChipRemove(value: brandStr),
                  );
                },
              ),
            ),
          )
          .toList(),
    );
  }
}

class _BrandInputField extends StatelessWidget {
  const _BrandInputField({required this.controller, required this.focusNode});
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 60, maxWidth: 200),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: BaseColors.shadowGrey,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintStyle: BaseTextStyles.textLargeSemiBold.copyWith(
            color: BaseColors.shadowGrey,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onFieldSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            context.read<ProductBloc>().add(
              ProductEvent.onBrandSearchUpdate(value: value.trim()),
            );
            controller.clear();
          }
        },
        onChanged: (value) {
          if (value.endsWith('\n')) {
            context.read<ProductBloc>().add(
              ProductEvent.onBrandSearchUpdate(value: value.trim()),
            );
            controller.clear();
          }
        },
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
