// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConstant {
  static String? BASE_URL = dotenv.env['BASE_URL'];
  static String? DEFAULT_ACCESS_TOKEN = dotenv.env['DEFAULT_ACCESS_TOKEN'];
}