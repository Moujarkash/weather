class JsonHelper {
  static DateTime   getDateFromJson(String dateTimeJson) => DateTime.parse(dateTimeJson).toUtc();

  static String convertDateToJson(DateTime dateTime) => dateTime.toIso8601String();

  static DateTime getDateFromTimeStampJson(int jsonValue) => DateTime.fromMillisecondsSinceEpoch(jsonValue * 1000);

  static int convertDateToTimeStampJson(DateTime dateTime) => dateTime.millisecondsSinceEpoch ~/ 1000;

  static int getIntFromJson(dynamic json) {
    if (json is String) {
      final result = int.tryParse(json);
      
      return result ?? 0;
    }

    if (json is int) {
      return json;
    }

    return 0;
  }

  static String convertIntToJson(int value) => value.toString();
}