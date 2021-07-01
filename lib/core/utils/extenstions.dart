extension DateOnly on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);
}

extension PrettyDouble on double {
  String prettify(int fractionDigits){
    var formatted = toStringAsFixed(fractionDigits);
    
    if(formatted.contains(RegExp(r'\.0+'))) {
      formatted = formatted.replaceAll(RegExp(r'\.0+'),"");
    }

    if(formatted.contains(RegExp(r'\.\d\d'))) {
      formatted = formatted.replaceRange(formatted.length-1, formatted.length, "");
    }

    return formatted;
  }
}
