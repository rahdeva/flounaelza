import 'package:flutter_localization/flutter_localization.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageCubit extends HydratedCubit<String> {
  LanguageCubit() : super('id');

  final FlutterLocalization localization = FlutterLocalization.instance;

  void toggleLanguage() {
    final newLanguage = state == 'id' ? 'en' : 'id';
    emit(newLanguage);
    localization.translate(newLanguage);
  }

  void changeLanguage({required String newLanguage}) {
    emit(newLanguage);
    localization.translate(newLanguage);
  }

  FlutterLocalization getLocalization() {
    return localization;
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json['language'] as String;
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {'language': state};
  }
}
