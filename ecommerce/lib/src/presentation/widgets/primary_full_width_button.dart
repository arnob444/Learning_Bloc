import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class primaryFullWidthButton extends StatelessWidget {
  const primaryFullWidthButton({
    super.key,
    this.onTap,
    required this.backgroundColor,
    required this.textColor, required this.buttonText,
  });

  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.h,
        // width: MediaQuery.of(context).size.width,
        color:
            backgroundColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
        child: Center(
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: textColor ?? Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
