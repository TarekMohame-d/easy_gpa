import 'package:flutter/material.dart';

class KTextButton extends StatelessWidget {
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final OutlinedBorder? shape;
  final Size? fixedSize;
  final Color? overlayColor;
  final Widget? child;
  const KTextButton({
    super.key,
    this.backgroundColor,
    this.buttonText,
    this.textStyle,
    required this.onPressed,
    this.child,
    this.padding,
    this.shape,
    this.fixedSize,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: shape,
        backgroundColor: backgroundColor,
        padding: padding,
        fixedSize: fixedSize,
        overlayColor: overlayColor,
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            buttonText ?? 'No Text',
            style: textStyle,
          ),
    );
  }
}
