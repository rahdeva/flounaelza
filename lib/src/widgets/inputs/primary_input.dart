import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class PrimaryInput extends StatefulWidget {
  const PrimaryInput({
    super.key,
    required this.controller,
    this.fontSize = 14,
    this.label,
    this.hintText,
    this.prefixText,
    this.errorText,
    this.obscured = false,
    this.clearable = false,
    this.disabled = false,
    this.required = false,
    this.optional = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.validator,
    this.onChanged,
    this.focusNode,
    this.onTapOutside,
    this.onClearButtonPressed,
    this.isTextArea = false,
  });

  final TextEditingController controller;
  final double fontSize;
  final String? label;
  final String? hintText;
  final String? prefixText;
  final String? errorText;
  final bool obscured;
  final bool clearable;
  final bool disabled;
  final bool required;
  final bool optional;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onClearButtonPressed;
  final bool isTextArea;

  @override
  State<PrimaryInput> createState() => _PrimaryInputState();
}

class _PrimaryInputState extends State<PrimaryInput> {
  String _validatedErrorText = '';
  bool _obscureText = true;

  _getEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        color: AppColors.neutral300,
        width: 1.0,
      ),
    );
  }

  _getFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        color: AppColors.neutral700,
        width: 1.0,
      ),
    );
  }

  _getErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        color: AppColors.errorColor,
        width: 1.0,
      ),
    );
  }

  _getDisabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(
        color: AppColors.neutral300,
        width: 1.0,
      ),
    );
  }

  _getVisibilityIcon() {
    return _obscureText
        ? SvgPicture.asset(
            SvgAssetConstant.eyeIcon,
            colorFilter: const ColorFilter.mode(
              AppColors.neutral700,
              BlendMode.srcIn,
            ),
            width: 20.0,
            height: 20.0,
          )
        : SvgPicture.asset(
            SvgAssetConstant.eyeSlashIcon,
            colorFilter: const ColorFilter.mode(
              AppColors.neutral700,
              BlendMode.srcIn,
            ),
            width: 20.0,
            height: 20.0,
          );
  }

  String? _validate(String? text) {
    if (widget.validator != null) {
      String? validatedErrorText = widget.validator!(text);
      if (validatedErrorText != null) {
        setState(() {
          _validatedErrorText = widget.validator!(text) ?? '';
        });
        return validatedErrorText;
      }
    }
    setState(() {
      _validatedErrorText = '';
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Row(
            children: [
              DefaultText(
                text: widget.label!,
                color: AppColors.neutral700,
                type: DefaultTextType.textSM,
                weight: DefaultTextWeight.semiBold,
                textAlign: TextAlign.left,
              ),
              if (widget.required) ...[
                const SizedBox(width: 4.0),
                const DefaultText(
                  text: '*',
                  color: AppColors.errorColor,
                  type: DefaultTextType.textSM,
                  textAlign: TextAlign.left,
                ),
              ],
              if (widget.optional) ...[
                const SizedBox(width: 4.0),
                const DefaultText(
                  text: '(optional)',
                  color: AppColors.neutral400,
                  type: DefaultTextType.textSM,
                  textAlign: TextAlign.left,
                ),
              ],
            ],
          ),
          const SizedBox(height: 6.0),
        ],
        Row(
          children: [
            Expanded(
              child: TextFormField(
                onTapOutside: widget.onTapOutside,
                focusNode: widget.focusNode,
                controller: widget.controller,
                obscuringCharacter: '*',
                obscureText: widget.obscured ? _obscureText : false,
                readOnly: widget.disabled,
                enabled: !widget.disabled,
                validator: _validate,
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
                style: GoogleFonts.georama(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.neutral700,
                ),
                maxLines: widget.isTextArea ? 4 : 1,
                maxLength: widget.isTextArea ? 200 : null,
                decoration: InputDecoration(
                  counter: const SizedBox(),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: widget.disabled
                      ? AppColors.neutral200
                      : AppColors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 10.0,
                  ),
                  enabledBorder: widget.errorText == null
                      ? _getEnabledBorder()
                      : _getErrorBorder(),
                  focusedBorder: widget.errorText == null
                      ? _getFocusedBorder()
                      : _getErrorBorder(),
                  errorBorder: _getErrorBorder(),
                  errorStyle: const TextStyle(
                    fontSize: 0,
                  ),
                  focusedErrorBorder: _getErrorBorder(),
                  disabledBorder: _getDisabledBorder(),
                  hintText: widget.hintText,
                  hintStyle: GoogleFonts.georama(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutral400,
                  ),
                  prefixText: widget.prefixText,
                  labelText: widget.prefixText,
                  prefixStyle: GoogleFonts.georama(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutral700,
                  ),
                  labelStyle: GoogleFonts.georama(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutral700,
                  ),
                  suffixIconConstraints: const BoxConstraints(),
                  suffixIcon: widget.clearable
                      ? Pressable(
                          onPressed: widget.onClearButtonPressed,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 12.0,
                            ),
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: SvgPicture.asset(
                                SvgAssetConstant.closeCircleIcon,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        )
                      : widget.obscured
                          ? Pressable(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 12.0,
                                ),
                                child: _getVisibilityIcon(),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            )
                          : null,
                ),
                onChanged: widget.onChanged,
              ),
            ),
          ],
        ),
        if (widget.errorText != null || _validatedErrorText.isNotEmpty) ...[
          const SizedBox(height: 6.0),
          DefaultText(
            text: widget.errorText ?? _validatedErrorText,
            color: AppColors.errorColor,
            type: DefaultTextType.textSM,
            textAlign: TextAlign.left,
          ),
        ],
      ],
    );
  }
}
