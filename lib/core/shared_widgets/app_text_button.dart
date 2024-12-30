import '../_core_exports.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    this.onTapped,
    this.textStyle,
    this.textColor,
    this.textDecoration,
    this.decorationColor,
  });

  final String text;
  final VoidCallback? onTapped;
  final TextStyle? textStyle;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTapped,
      child: Text(
        text,
        style: textStyle ??
            AppTextStyles.body1Regular.copyWith(
              color: textColor ?? AppColors.main,
              decoration: textDecoration,
              decorationColor: decorationColor,
            ),
      ),
    );
  }
}
