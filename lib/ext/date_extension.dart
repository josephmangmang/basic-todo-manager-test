import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
extension DateTimeExt on DateTime? {
  String toDueDate() {
    if (this == null) return '';
    // if this is today use time, else use date
    if (isToday()) {
      return DateFormat('hh:mm a').format(this!);
    }
    return DateFormat('dd/MM/yyyy').format(this!);
  }

  String toInputDueDate() {
    if (this == null) return '';
    // if this is today use time, else use date
    if (isToday()) {
      return DateFormat('hh:mm a').format(this!);
    }
    return DateFormat('dd/MM/yyyy hh:mm a').format(this!);
  }

  bool isToday() {
    return DateUtils.isSameDay(this, DateTime.now());
  }
}
