import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

removeFocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

String formatDate(DateTime dateTime) {
  //return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime.toLocal().toLocal());
  return '';
}

double availableHeight(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
}
