import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guest_profile_demo/global/constants/app_color.dart';
import 'package:guest_profile_demo/global/utils/dynamic_size/size_constant.dart';

class CommonTextField extends StatefulWidget {
  final String? title;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final String? validationMessage;
  final bool needValidation;
  final bool isEmailValidation;
  final double? topPadding;
  final double? bottomPadding;
  final TextEditingController? controller;
  final bool isPhoneValidation;
  final bool isPasswordValidation;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? maxLength;
  final double? borderRadius;
  final double? textSize;
  final double? height;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final Color? borderColor;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final List<BoxShadow>? boxShadowView;
  final bool isTransparentColorBorder;
  final bool isBigTitle;
  final bool autofocus;
  final bool isLabel;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final bool obscureText;
  final bool boxShadow;
  final Color? titleColor;
  final bool readOnly;
  final Color? bgColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titleMargin;
  final Color? textColor;
  final Color? courserColor;
  final bool enabled;

  const CommonTextField({
    super.key,
    this.title,
    this.initialValue,
    this.needValidation = false,
    this.isEmailValidation = false,
    this.isLabel = false,
    this.hintText,
    this.labelText,
    this.validationMessage,
    this.boxShadowView,
    this.topPadding,
    this.borderColor,
    this.bottomPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.boxShadow = true,
    this.readOnly = false,
    this.textSize,
    this.height,
    this.contentPadding,
    this.isPhoneValidation = false,
    this.textInputType,
    this.textAlign,
    this.borderRadius,
    this.inputFormatters,
    this.maxLine,
    this.maxLength,
    this.hintStyle,
    this.titleStyle,
    this.bgColor,
    this.isTransparentColorBorder = false,
    this.onTap,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.isBigTitle = false,
    this.prefixIcon,
    this.validator,
    this.titleColor,
    this.isPasswordValidation = false,
    this.obscureText = false,
    this.onChange,
    this.margin,
    this.titleMargin,
    this.textColor,
    this.courserColor,
    this.enabled = true,
  });

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late FocusNode _internalFocusNode;
  late TextStyle _dynamicLabelStyle;

  @override
  void initState() {
    super.initState();
    // Use provided focusNode or create a new one
    _internalFocusNode = widget.focusNode ?? FocusNode();
    // Initialize hint style
     widget.hintStyle ??
        TextStyle(
          color: AppColor.grey,
          fontSize: MySize.size13,
        );
    // Initialize label style
    _dynamicLabelStyle = TextStyle(
      color: AppColor.grey,
      fontSize: MySize.size14,
    );
    // Listen to focus changes
    _internalFocusNode.addListener(() {
      setState(() {
         widget.hintStyle?.copyWith(
              color:
                  _internalFocusNode.hasFocus ? AppColor.black : AppColor.grey,
            ) ??
            TextStyle(
              color:
                  _internalFocusNode.hasFocus ? AppColor.black : AppColor.grey,
              fontSize: MySize.size13,
            );
        _dynamicLabelStyle = TextStyle(
          color: _internalFocusNode.hasFocus ? AppColor.black : AppColor.grey,
          fontSize: MySize.size14,
        );
      });
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.topPadding ?? 0),
        if (widget.title != null)
          Container(
            margin: widget.titleMargin,
            child: Text(
              '${widget.title}',
              style: widget.isBigTitle
                  ? widget.titleStyle ??
                      TextStyle(
                        fontSize: MySize.size18,
                        fontWeight: FontWeight.w600,
                        color: widget.titleColor,
                      )
                  : widget.titleStyle ??
                      TextStyle(
                        fontSize: MySize.size15,
                        fontWeight: FontWeight.w600,
                        color: widget.titleColor,
                      ),
            ),
          ),
        if (widget.title != null) const SizedBox(height: 8),
        Container(
          margin: widget.margin,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? 10,
            ),
            boxShadow: widget.boxShadow == false
                ? kElevationToShadow[0]
                : widget.boxShadowView ??
                    [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 1,
                        color: Colors.black.withValues(alpha: 0.25),
                      ),
                    ],
          ),
          child: TextFormField(
            initialValue: widget.initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: widget.maxLine ?? 1,
            textAlign: widget.textAlign ?? TextAlign.start,
            onTap: widget.onTap,
            maxLength: widget.maxLength,
            cursorHeight: MySize.getScaledSizeHeight(23),
            cursorColor: widget.courserColor ?? AppColor.black,
            controller: widget.controller,
            onChanged: widget.onChange,
            obscureText: widget.obscureText,
            readOnly: widget.readOnly,
            onFieldSubmitted: widget.onFieldSubmitted,
            inputFormatters: widget.inputFormatters ?? [],
            focusNode: _internalFocusNode,
            autofocus: widget.autofocus,
            keyboardType: widget.textInputType ?? TextInputType.text,
            style: TextStyle(
              color: widget.textColor ?? AppColor.black,
              fontSize: widget.textSize ?? MySize.size15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                fontSize: MySize.size13,
              ),
              label: widget.isLabel == true
                  ? Text(
                      "${widget.labelText}",
                    )
                  : null,
              labelStyle: widget.isLabel == true ? _dynamicLabelStyle : null,
              fillColor: widget.bgColor ?? AppColor.white,
              contentPadding: kIsWeb
                  ? EdgeInsets.symmetric(
                      vertical: MySize.getScaledSizeHeight(13),
                      horizontal: MySize.getScaledSizeHeight(15),
                    )
                  : widget.contentPadding ??
                      EdgeInsets.symmetric(
                        vertical: MySize.getScaledSizeHeight(10),
                        horizontal: MySize.getScaledSizeHeight(15),
                      ),
              isDense: true,
              filled: true,
              counterText: "",
              hintText: widget.hintText ?? "",
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              hintStyle: widget.hintStyle ??
                  TextStyle(
                    color: AppColor.grey.withValues(alpha: 0.7),
                    fontSize: MySize.size13,
                  ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isTransparentColorBorder
                      ? AppColor.transparent
                      : (widget.borderColor ?? AppColor.grey.withValues(alpha: 0.7)),
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isTransparentColorBorder
                      ? AppColor.transparent
                      : (widget.borderColor ?? AppColor.grey),
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isTransparentColorBorder
                      ? AppColor.transparent
                      : (widget.borderColor ?? AppColor.grey.withValues(alpha: 0.7)),
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isTransparentColorBorder
                      ? AppColor.transparent
                      : AppColor.red,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
            ),
            enabled: widget.enabled,
          ),
        ),
        SizedBox(height: widget.bottomPadding ?? 16),
      ],
    );
  }
}
