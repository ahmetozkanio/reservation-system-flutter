import 'package:intl/intl.dart';

//Tarih icin formatlama
dateFormat(dateTime) {
  String formatDate;

  if (dateTime != null) {
    formatDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formatDate;
  }
}

//Saat icin Formatlama
timeFormat(DateTime dateTime) {
  String formatTime;
  if (dateTime != null) {
    formatTime = DateFormat('HH:mm').format(dateTime);
    return formatTime;
  }
}
