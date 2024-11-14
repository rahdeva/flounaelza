import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/utils/formatters/date_time_formatter.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

enum DateTimeInputType { date, time, datetime }

enum DateTimeFormatType {
  toFormattedDate,
  toFormattedTime,
  toFormattedTimeWithSecond,
  toFormattedDateTime,
  toFormattedDateWithMonthName,
  toFormattedTime12Hour,
  toFormattedDateWithDay,
  toShortDateFormat,
  toCustomFormat,
}

class DateTimeInput extends StatefulWidget {
  const DateTimeInput({
    super.key,
    required this.controller,
    this.fontSize = 14,
    this.label,
    this.hintText,
    this.prefixText,
    this.errorText,
    this.clearable = false,
    this.disabled = false,
    this.required = false,
    this.optional = false,
    this.validator,
    this.onChanged,
    this.onTapOutside,
    this.onClearButtonPressed,
    this.inputType = DateTimeInputType.date,
    this.firstDate,
    this.lastDate,
    this.currentDate,
    this.initialDate,
    this.dateFormatType,
    this.customDateFormat,
    this.is24HourTimeFormat = true,
  });

  final TextEditingController controller;
  final double fontSize;
  final String? label;
  final String? hintText;
  final String? prefixText;
  final String? errorText;
  final bool clearable;
  final bool disabled;
  final bool required;
  final bool optional;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onClearButtonPressed;
  final DateTimeInputType inputType;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? currentDate;
  final DateTime? initialDate;
  final DateTimeFormatType? dateFormatType;
  final String? customDateFormat;
  final bool is24HourTimeFormat;

  @override
  State<DateTimeInput> createState() => _DateTimeInputState();
}

class _DateTimeInputState extends State<DateTimeInput> {
  String _validatedErrorText = '';

  DateTime _getFirstDate() => widget.firstDate ?? DateTime(2000);
  DateTime _getLastDate() => widget.lastDate ?? DateTime(2101);
  DateTime _getInitialDate() => widget.initialDate ?? DateTime.now();
  
  String _formatDateTime(DateTime dateTime) {
    switch (widget.dateFormatType) {
      case DateTimeFormatType.toFormattedDate:
        return dateTime.toFormattedDate();
      case DateTimeFormatType.toFormattedTime:
        return dateTime.toFormattedTime();
      case DateTimeFormatType.toFormattedTimeWithSecond:
        return dateTime.toFormattedTimeWithSecond();
      case DateTimeFormatType.toFormattedDateTime:
        return dateTime.toFormattedDateTime();
      case DateTimeFormatType.toFormattedDateWithMonthName:
        return dateTime.toFormattedDateWithMonthName();
      case DateTimeFormatType.toFormattedTime12Hour:
        return dateTime.toFormattedTime12Hour();
      case DateTimeFormatType.toFormattedDateWithDay:
        return dateTime.toFormattedDateWithDay();
      case DateTimeFormatType.toShortDateFormat:
        return dateTime.toShortDateFormat();
      case DateTimeFormatType.toCustomFormat:
        return dateTime.toCustomFormat(
          widget.customDateFormat ?? 'yyyy-MM-dd'
        );
      default:
        return dateTime.toString();
    }
  }
      
  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    if (
      widget.inputType == DateTimeInputType.date ||
      widget.inputType == DateTimeInputType.datetime
    ) {
      selectedDate = await showDatePicker(
        context: context,
        initialDate: _getInitialDate(),
        firstDate: _getFirstDate(),
        lastDate: _getLastDate(),
        currentDate: widget.currentDate,
      );
    }

    if (
      (widget.inputType == DateTimeInputType.time ||
      widget.inputType == DateTimeInputType.datetime) &&
      (selectedDate != null || widget.inputType == DateTimeInputType.time)
    ) {
      selectedTime = await showTimePicker(
        // ignore: use_build_context_synchronously
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: widget.is24HourTimeFormat
            ),
            child: child!,
          );
        },
      );
    }

    if (
      selectedDate != null &&
      selectedTime != null &&
      widget.inputType == DateTimeInputType.datetime
    ) {
      DateTime dateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
      widget.controller.text = _formatDateTime(dateTime);
      widget.onChanged?.call(widget.controller.text);
    } else if (selectedDate != null && widget.inputType == DateTimeInputType.date) {
      widget.controller.text = _formatDateTime(selectedDate);
      widget.onChanged?.call(widget.controller.text);
    } else if (selectedTime != null && widget.inputType == DateTimeInputType.time) {
      widget.controller.text = widget.is24HourTimeFormat
        ? '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}'
        // ignore: use_build_context_synchronously
        : selectedTime.format(context);
    widget.onChanged?.call(widget.controller.text);
    }
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
              if (widget.clearable) ...[
                const Spacer(),
                Pressable(
                  onPressed: widget.onClearButtonPressed,
                  child: const DefaultText(
                    text: 'clear',
                    color: AppColors.errorColor,
                    type: DefaultTextType.textSM,
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(width: 4.0),
              ],
            ],
          ),
          const SizedBox(height: 6.0),
        ],
        Row(
          children: [
            Expanded(
              child: Pressable(
                onPressed: (){
                  _selectDateTime(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    onTapOutside: widget.onTapOutside,
                    controller: widget.controller,
                    readOnly: true,
                    enabled: !widget.disabled,
                    validator: _validate,
                    style: GoogleFonts.georama(
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral700,
                    ),
                    decoration: InputDecoration(
                      counter: const SizedBox(),
                      fillColor: widget.disabled 
                        ? AppColors.disabledFill 
                        : AppColors.white,
                      filled: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, 
                        vertical: 10.0
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
                      suffixIcon: Pressable(
                        onPressed: () => _selectDateTime(context),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 12.0,
                          ),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: SvgPicture.asset(
                              SvgAssetConstant.calendarIcon,
                              colorFilter: const ColorFilter.mode(
                                AppColors.neutral400, 
                                BlendMode.srcIn
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onChanged: widget.onChanged,
                  ),
                ),
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
