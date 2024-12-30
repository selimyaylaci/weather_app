import '../_core_exports.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final double width;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final int? minLines;
  final int maxLines;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final Function()? onTap;
  final bool obscureText;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final bool isFilled;
  final Color? fillColor;
  final String? labelText;
  final Color? labelTextColor;
  final TextStyle? textStyle;
  final InputBorder? inputBorder;
  final String? initialValue;
  final BoxConstraints? prefixIconConstraints;
  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.width = double.infinity,
    this.onSubmitted,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.focusNode,
    this.autoFocus = false,
    this.textInputAction = TextInputAction.search,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.onTap,
    this.obscureText = false,
    this.contentPadding,
    this.inputFormatters,
    this.isFilled = false,
    this.fillColor,
    this.labelText,
    this.labelTextColor,
    this.textStyle,
    this.inputBorder,
    this.initialValue,
    this.prefixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.body1Regular.copyWith(
            color: AppColors.sub,
          ),
          labelText: labelText,
          labelStyle: AppTextStyles.body1Medium.copyWith(
            color: AppColors.sub,
          ),
          floatingLabelStyle: AppTextStyles.body2Medium.copyWith(
            color: AppColors.sub,
          ),
          contentPadding: contentPadding,
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(
            maxWidth: 100.width,
            maxHeight: 24.height,
          ),
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            maxWidth: 100.width,
            maxHeight: 24.height,
          ),
          focusedBorder: inputBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.height),
                borderSide: const BorderSide(
                  color: AppColors.sub,
                ),
              ),
          enabledBorder: inputBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.height),
                borderSide: const BorderSide(
                  color: AppColors.sub10,
                ),
              ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.height),
            borderSide: const BorderSide(
              color: AppColors.supportRed,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.height),
            borderSide: const BorderSide(
              color: AppColors.supportRed,
            ),
          ),
          filled: isFilled,
          fillColor: fillColor,
        ),
        style: textStyle ?? AppTextStyles.body1Medium,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
        focusNode: focusNode,
        autofocus: autoFocus,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        readOnly: readOnly,
        onTap: onTap,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        onTapOutside: (final PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
