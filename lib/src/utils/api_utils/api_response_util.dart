class ApiResponseUtil {
  static String? extractErrorMessage(dynamic message) {
    if (message is String) {
      return message;
    }
    
    if (message is Map<String, dynamic>) {
      for (var entry in message.entries) {
        if (entry.value is List && (entry.value as List).isNotEmpty) {
          return (entry.value as List).first.toString();
        }
      }
    }

    return 'Error';
  }
}