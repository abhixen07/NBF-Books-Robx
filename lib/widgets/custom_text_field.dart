import 'package:flutter/material.dart';

import '../style/style.dart';

class CustomTextFormField extends StatefulWidget {
  final Color? fillColor;
  final String? label;
  final String hintText;
  final bool isRequired;
  final bool obscureText;
  final double? width;
  final double? height;
  final double fontSize;
  final Color? fontColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final FontWeight? labelFontWeight;
  final FontWeight? hintFontWeight;
  final FontWeight? inputFontWeight;
  final bool isRequiredHint;
  final String? isRequiredlabelText;
  final Color? isRequiredlabelColor;
  final double? isRequiredlabelFontSize;
  final Color? borderColor;
  final double borderWidth;
  final bool noBorder;
  final double borderRadius;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? enabledErrorBorderColor;
  final Color? focusedErrorBorderColor;
  final bool addShadow;
  final Color? shadowColor;
  final double? shadowBlurRadius;
  final double? shadowOffsetX;
  final double? shadowOffsetY;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    this.fillColor,
    this.label,
    this.hintText = '',
    this.isRequired = false,
    this.obscureText = false,
    this.width,
    this.height,
    this.fontSize = 15.0,
    this.fontColor,
    this.labelTextColor,
    this.hintTextColor,
    this.labelFontWeight,
    this.hintFontWeight,
    this.inputFontWeight,
    this.isRequiredHint = false,
    this.borderColor = greyColor,
    this.borderWidth = 1,
    this.noBorder = false,
    this.borderRadius = 12.0,
    this.focusedBorderColor = blackColor,
    this.enabledBorderColor,
    this.focusedErrorBorderColor,
    this.enabledErrorBorderColor,
    this.addShadow = false,
    this.shadowColor,
    this.shadowBlurRadius,
    this.shadowOffsetX,
    this.shadowOffsetY,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.currentFocusNode,
    this.nextFocusNode,
    this.isRequiredlabelText,
    this.isRequiredlabelColor,
    this.isRequiredlabelFontSize,
    this.onChanged,
    super.key,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.obscureText;
  }

  bool get _isFieldEmpty => widget.controller?.text.isEmpty ?? true;

  bool get _isFocused => widget.currentFocusNode?.hasFocus ?? false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            children: [
              Text(
                widget.label!,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: widget.labelFontWeight ?? FontWeight.w600,
                  color: widget.labelTextColor ?? blackColor,
                ),
              ),
              if (widget.isRequired)
                Text(
                  widget.isRequiredlabelText ?? " *",
                  style: TextStyle(
                    color: widget.isRequiredlabelColor ?? redColor,
                    fontSize: widget.isRequiredlabelFontSize ?? 16,
                  ),
                ),
            ],
          ),
        if (widget.label != null) const SizedBox(height: 4),
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: _isFieldEmpty
                ? whiteColor
                : (_isFocused ? whiteColor : whiteColor),
            boxShadow: widget.addShadow
                ? [
              BoxShadow(
                color: widget.shadowColor ?? greyColor.withOpacity(0.3),
                blurRadius: widget.shadowBlurRadius ?? 4.0,
                offset: Offset(
                  widget.shadowOffsetX ?? 0.0,
                  widget.shadowOffsetY ?? 4.0,
                ),
              ),
            ]
                : [],
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.currentFocusNode,
            obscureText: _obscureText,
            //for moving to next text field focus
            textInputAction: widget.nextFocusNode != null
                ? TextInputAction.next
                : TextInputAction.done,
            onEditingComplete: () {
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              } else {
                FocusScope.of(context).unfocus();
              }
            },
            cursorColor: blackColor,
            cursorErrorColor: red2Color,
            style: TextStyle(
              fontSize: widget.fontSize,
              color: blackColor,
              fontWeight: widget.inputFontWeight ?? FontWeight.normal,
            ),

            decoration: InputDecoration(
              fillColor:widget.fillColor?? Colors.transparent,
              filled: true,
              hintText: widget.isRequiredHint && widget.hintText.isNotEmpty
                  ? "${widget.hintText} "
                  : widget.hintText,
              hintStyle: TextStyle(
                color: widget.hintTextColor ?? customGreyColor,
                fontSize: widget.fontSize,
                fontWeight: widget.hintFontWeight ?? FontWeight.normal,
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              enabledBorder: widget.noBorder
                  ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: blackColor,
                  width: widget.borderWidth + 0.5,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              )
                  : OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                  _isFieldEmpty ? blackColor : blackColor,
                  width: widget.borderWidth,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedBorder: widget.noBorder
                  ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: blackColor,
                  width: widget.borderWidth + 0.5,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              )
                  : OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.focusedBorderColor ?? blackColor,
                  width: widget.borderWidth + 0.5,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              errorBorder: widget.noBorder
                  ? InputBorder.none
                  : OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.enabledErrorBorderColor ?? red2Color,
                  width: widget.borderWidth,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedErrorBorder: widget.noBorder
                  ? InputBorder.none
                  : OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.focusedErrorBorderColor ?? red2Color,
                  width: widget.borderWidth + 0.5,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: greyColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
                  : widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
            ),

            validator: widget.validator,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}