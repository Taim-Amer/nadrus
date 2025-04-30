import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nadros/core/utils/app_functions.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabeledTextFeild extends StatefulWidget {
  const LabeledTextFeild({
    super.key,
    required this.label,
    this.hint = '',
    required this.controller,
    this.isPassword = false,
    this.isNumber = false,
    this.textAlign = TextAlign.start,
    this.isCentered = false,
    this.textDirection,
    this.primaryColor,
    this.textNextToLabel,
    this.validator,
    this.keyboardType,
    this.svgSize,
    this.suffixIcon,
    this.maxLength = 40,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.prefix,
  });

  final Widget? prefix;
  final bool isPassword;
  final bool isNumber;
  final String label;
  final String hint;
  final double? svgSize;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool isCentered;
  final TextEditingController controller;
  final Color? primaryColor;
  final Widget? suffixIcon;
  final String? textNextToLabel;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLength;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  @override
  State<LabeledTextFeild> createState() => _LabeledTextFeildState();
}

class _LabeledTextFeildState extends State<LabeledTextFeild> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: widget.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (widget.textNextToLabel != null) ...[
              8.horizontalSpace,
              Text(widget.textNextToLabel!,
                  style: const TextStyle(color: TColors.grey)),
            ],
          ],
        ),
        9.verticalSpace,
        TextFormField(
          controller: widget.controller,
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: (value) {
            if (widget.textInputAction == TextInputAction.next) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            }
            widget.onFieldSubmitted?.call(value);
          },
          maxLength: widget.maxLength,
          textAlign: widget.isCentered ? TextAlign.center : widget.textAlign,
          textDirection: widget.textDirection,
          validator: widget.validator,
          keyboardType: widget.keyboardType ??
              (widget.isNumber ? TextInputType.number : null),
          inputFormatters: [
            if (widget.isNumber)
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: widget.prefix,
              ),
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 20 + 16),
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: TColors.grey),
              hintTextDirection: widget.textDirection,
              filled: true,
              fillColor: dark ? TColors.darkerGrey : TColors.white,
              hintText: widget.hint,
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: const BorderSide(
                    color: TColors.primary), // Customize if needed
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide:
                    const BorderSide(color: Colors.red), // Keeps the radius
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide:
                    const BorderSide(color: Colors.red), // Keeps the radius
              ),
              suffixIcon: widget.suffixIcon ??
                  (widget.isPassword
                      ? IconButton(
                          onPressed: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          icon: isVisible
                              ? SvgPicture.asset(SvgAssets.eye)
                              : SvgPicture.asset(SvgAssets.eyeSlash))
                      : null)),
          obscureText: widget.isPassword && !isVisible,
        ),
      ],
    );
  }
}
