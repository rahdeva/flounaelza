import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mmkv/mmkv.dart';

class StorageUtil {
  static MMKV mmkv = MMKV('RintisanBillingAppMMKV');
  static MMKV secureMmkv =
      MMKV('RintisanBilingSecureMMKV', cryptKey: dotenv.env['MMKV_ENCRYPTION_KEY']);

  static saveString({
    required String key,
    required String value,
    bool useEncryption = false,
  }) async {
    if (useEncryption) {
      secureMmkv.encodeString(key, value);
      return;
    }
    mmkv.encodeString(key, value);
  }

  static getString({
    required String key,
    bool useEncryption = false,
  }) {
    if (useEncryption) {
      return secureMmkv.decodeString(key);
    }
    return mmkv.decodeString(key);
  }

  static saveBool({
    required String key,
    required bool value,
    bool useEncryption = false,
  }) async {
    if (useEncryption) {
      secureMmkv.encodeBool(key, value);
      return;
    }
    mmkv.encodeBool(key, value);
  }

  static getBool({
    required String key,
    bool useEncryption = false,
  }) {
    if (useEncryption) {
      return secureMmkv.decodeBool(key);
    }
    return mmkv.decodeBool(key);
  }

  static remove({
    required String key,
    bool useEncryption = false,
  }) {
    if (useEncryption) {
      secureMmkv.removeValue(key);
      return;
    }
    mmkv.removeValue(key);
  }
}
