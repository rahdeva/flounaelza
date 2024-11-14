import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

class DateRangePickerWidget extends StatefulWidget {
  const DateRangePickerWidget({
    super.key,
    required this.initialStartDate,
    required this.initialEndDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateRangeSelected,
  });

  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTimeRange) onDateRangeSelected;

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange? selectedRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: widget.initialStartDate, 
        end: widget.initialEndDate
      ),
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 340,
                maxHeight: 550,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: child
              ),
            ),
          ],
        );
      }
    );

    if (picked != null && picked != selectedRange) {
      setState(() {
        selectedRange = picked;
      });
      widget.onDateRangeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: () => _selectDateRange(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.disabledOutline,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: AppColors.neutral300,
            width: 1
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 10, 4),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.bgCalendarIcon,
                    child: SvgPicture.asset(
                      SvgAssetConstant.calendarIcon,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white, 
                        BlendMode.srcIn
                      ),
                    ),
                  ),
                ),
                DefaultText(
                  text: selectedRange == null
                    ? AppLocale.chooseDate.getString(context)
                    : '${DateFormat('dd MMM yyyy', 'id').format(selectedRange!.start)} - ${DateFormat('dd MMM yyyy', 'id').format(selectedRange!.end)}',
                  type: DefaultTextType.textSM,
                  weight: DefaultTextWeight.medium,
                  color: AppColors.neutral700,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 2,
                  color: AppColors.neutral400,
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.neutral700,
                ),
                const SizedBox(width: 16)
              ],
            )
          ],
        ),
      ),
    );
  }
}
