import 'package:flutter/material.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/general/blocs/language_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';

class ChangeLanguageButton extends StatefulWidget {
  const ChangeLanguageButton({super.key});

  @override
  State<ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  late LanguageCubit _languageCubit = LanguageCubit();
  String selectedLanguage = '🇮🇩  Bahasa Indonesia';
  late List<String> languageList;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    if(_languageCubit.state == 'id'){
      selectedLanguage = AppLocale.indonesia_language.getString(context);
    } else if(_languageCubit.state == 'en'){
      selectedLanguage = AppLocale.english_language.getString(context);
    }
    languageList = [
      AppLocale.english_language.getString(context),
      AppLocale.indonesia_language.getString(context),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.neutral200,
        ),
      ),
      width: 150,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedLanguage,
          onChanged: (String? newValue) {
            setState(() {
              if(newValue != null){
                selectedLanguage = newValue;
                if(newValue == AppLocale.english_language.getString(context)){
                  _languageCubit.changeLanguage(newLanguage: 'en');
                } else if(newValue == AppLocale.indonesia_language.getString(context)){
                  _languageCubit.changeLanguage(newLanguage: 'id');
                }
              }
            });
          },
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.transparent,
          ),
          iconSize: 0,
          items: languageList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: DefaultText(
                text: value,
                type: DefaultTextType.text3XS,
                weight: DefaultTextWeight.regular,
                color: AppColors.neutral800,
              ),
            );
          }).toList(),
          isDense: true,
          selectedItemBuilder: (BuildContext context) {
            return languageList.map<Widget>((String item) {
              return DefaultText(
                text: selectedLanguage,
                type: DefaultTextType.text3XS,
                weight: DefaultTextWeight.regular,
                color: AppColors.neutral800,
              );
            }).toList();
          },
        ),
      ),
    );
  }
}