import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/features/general/blocs/language_cubit.dart';
import 'package:flounaelza/src/routes/router.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    localization.init(
      initLanguageCode: 'id',
      mapLocales: [
        const MapLocale('id', AppLocale.ID),
        const MapLocale('en', AppLocale.EN),
      ],
    );

    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: MaterialApp.router(
        title: 'Nadhi Mart',
        routerConfig: router,
        color: AppColors.white,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          canvasColor: AppColors.white,
          textTheme: GoogleFonts.georamaTextTheme(),
          cardColor: AppColors.white,
          shadowColor: AppColors.grey,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
            tertiary: AppColors.primarySurfaceColor,
            surfaceTint: AppColors.white,
          ),
          datePickerTheme: const DatePickerThemeData(
            headerBackgroundColor: AppColors.primaryColor,
            headerForegroundColor: AppColors.white,
            backgroundColor: AppColors.white,
            dividerColor: AppColors.neutral300,
            weekdayStyle: TextStyle(
              fontWeight: FontWeight.bold
            ),
            rangePickerHeaderBackgroundColor: AppColors.primaryColor,
            rangePickerHeaderForegroundColor: AppColors.white,
            rangePickerBackgroundColor: AppColors.white,
            rangeSelectionBackgroundColor: AppColors.primarySurfaceColor,
          ),
          timePickerTheme: const TimePickerThemeData(
            backgroundColor: AppColors.white,
          ),
        ),
        supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: messengerKey,
      ),
    );
  }
}
