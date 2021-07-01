class JsonHelper {
  static DateTime getDateFromTimestampString(int jsonValue) 
    => DateTime.fromMillisecondsSinceEpoch(jsonValue * 1000, isUtc: true);
}