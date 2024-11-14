import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.controller,
    this.fontSize = 14,
    this.hintText,
    this.disabled = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.onChanged,
    this.suffixIcon,
    this.focusNode,
  });

  final TextEditingController controller;
  final double fontSize;
  final String? hintText;
  final bool disabled;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onChanged;
  final Widget? suffixIcon;
  final FocusNode? focusNode;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(width: 0.0, color: Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.neutral200 
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        readOnly: widget.disabled,
        enabled: !widget.disabled,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        style: GoogleFonts.georama(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.neutral700,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: AppColors.neutral,
          filled: false,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          enabledBorder: _getBorder(),
          focusedBorder: _getBorder(),
          disabledBorder: _getBorder(),
          border: _getBorder(),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.georama(
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w400,
            color: AppColors.neutral400,
          ),
          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 10.0,
            ),
            child: SvgPicture.asset(
              SvgAssetConstant.searchIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.neutral700,
                BlendMode.srcIn,
              ),
              height: 16.0,
              width: 16.0,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: widget.suffixIcon,
          ),
          suffixIconConstraints: const BoxConstraints(),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
