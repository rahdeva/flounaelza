import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class DropdownInput<T> extends StatefulWidget {
  const DropdownInput({
    super.key,
    required this.items,
    required this.onChanged,
    this.label,
    this.hintText,
    this.errorText,
    this.disabled = false,
    this.required = false,
    this.selectedItem,
    this.focusNode,
    this.validator,
  });

  final List<T> items;
  final Function(T?) onChanged;
  final String? label;
  final String? hintText;
  final String? errorText;
  final bool disabled;
  final bool required;
  final T? selectedItem;
  final FocusNode? focusNode;
  final String? Function(T?)? validator;

  @override
  State<DropdownInput<T>> createState() => _DropdownInputState<T>();
}

class _DropdownInputState<T> extends State<DropdownInput<T>> {
  String _validatedErrorText = '';

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

  String? _validate(T? selectedItem) {
    if (widget.validator != null) {
      String? validatedErrorText = widget.validator!(selectedItem);
      if (validatedErrorText != null) {
        setState(() {
          _validatedErrorText = validatedErrorText;
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
            ],
          ),
          const SizedBox(height: 6.0),
        ],
        DropdownButtonFormField<T>(
          focusNode: widget.focusNode,
          value: widget.selectedItem,
          isExpanded: true,
          alignment: Alignment.centerLeft,
          items: widget.items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                style: GoogleFonts.georama(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.neutral700,
                ),
              ),
            );
          }).toList(),
          hint: Text(
            widget.hintText ?? '-',
            style: GoogleFonts.georama(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.neutral400,
            ),
          ), 
          onChanged: widget.disabled ? null : widget.onChanged,
          validator: widget.validator != null
            ? (value) => _validate(value)
            : null,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: widget.disabled ? AppColors.disabledFill : AppColors.white,
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
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.neutral400,
            ),
          ),
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
