import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

void setupSnackbar() {
  final snackbarService = locator<SnackbarService>();


  snackbarService.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Colors.black,
    textColor: Colors.white,
    borderRadius: 10,
    snackPosition: SnackPosition.BOTTOM,
  ));
}
