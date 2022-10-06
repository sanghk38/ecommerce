import 'package:ecommerce/core/constants/app_constant.dart';
import 'package:ecommerce/core/resuource/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFromField extends StatefulWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final String? label;
  final String? hint;
  final int? maxLength;
  final List<TextInputFormatter>? formatters;
  final bool enabled;
  final InputBorder border;
  final bool obscureText;
  final Widget? suffix;
  final VoidCallback? onTap;
  final bool suffixChangeByValidate;
  final bool isRequired;
  final Widget? prefixIcon;
  final double? radius;

  const AppTextFromField(
      {Key? key,
      this.keyboardType,
      this.controller,
      this.label,
      this.hint,
      this.maxLength,
      this.formatters,
      this.enabled = true,
      this.border = InputBorder.none,
      this.obscureText = false,
      this.suffix,
      this.onTap,
      this.suffixChangeByValidate = false,
      this.isRequired = false,
      this.prefixIcon,
      this.radius,
      this.validate})
      : super(key: key);

  @override
  State<AppTextFromField> createState() => _AppTextFromFieldState();
}

class _AppTextFromFieldState extends State<AppTextFromField> {
  bool _obscureText = false;
  bool? _validate;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (widget.label?.isNotEmpty ?? false) ...[
        //   Text(
        //     (widget.label ?? '') +
        //         (widget.isRequired ? AppConstant.requiredField : ''),
        //     style: TextStyle(
        //       fontSize: 15.sp,
        //       fontWeight: FontWeight.w500,
        //       color: Color(0xFF383838),
        //     ),
        //   ),
        //   6.verticalSpace
        // ],
        GestureDetector(
          onTap: widget.onTap,
          child: TextFormField(
            obscureText: _obscureText,
            controller: widget.controller,
            maxLength: widget.maxLength,
            inputFormatters: widget.formatters,
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
                borderSide: BorderSide(
                  color: Color(0xFFD9D9D9),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
                borderSide: BorderSide(
                  color: Color(0xFF6EA847),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
                borderSide: BorderSide(
                  color: Theme.of(context).errorColor,
                ),
              ),
              isDense: true,
              contentPadding: REdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 16,
                right: widget.suffix != null || widget.obscureText ? 0 : 16,
              ),
              errorMaxLines: 2,
              counterText: '',
              suffixIcon: _buildSunffix(),
              prefixIcon: widget.prefixIcon,
              labelText: widget.label,
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontSize: 15.sp,
                color: Color(0xFF848484),
              ),
            ),
            validator: (value) {
              final result = widget.validate?.call(value);
              final isValid = result == null;
              final isChanged = _validate != isValid;
              _validate = isValid;
              if (isChanged && widget.suffixChangeByValidate) {
                setState(() {});
              }
              return result;
            },
          ),
        )
      ],
    );
  }

  Widget? _buildSunffix() {
    return widget.suffixChangeByValidate && _validate != null
        ? _buildSunffixByValidate()
        : widget.suffix ?? (widget.obscureText ? _buildObscure() : null);
  }

  Widget _buildSunffixByValidate() {
    return SizedBox(
      height: 46.r,
      width: 46.r,
      child: Center(
        child: SvgPicture.asset(
          _validate ?? false ? AppImages.tick : AppImages.error,
          width: 13.r,
          height: 13.r,
        ),
      ),
    );
  }

  Widget _buildObscure() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: SizedBox(
        height: 46.r,
        width: 46.r,
        child: Center(
          child: SvgPicture.asset(
            !_obscureText
                ? AppImages.passwordInvisible
                : AppImages.passwordVisible,
            width: 20.r,
            height: 20.r,
          ),
        ),
      ),
    );
  }
}
