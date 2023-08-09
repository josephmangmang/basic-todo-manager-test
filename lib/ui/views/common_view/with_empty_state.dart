import 'package:flutter/material.dart';

class WithEmptyState extends StatelessWidget {
  const WithEmptyState({Key? key, required this.isEmpty, required this.child, required this.emptyWidget})
      : super(key: key);
  final bool isEmpty;
  final Widget child;
  final Widget emptyWidget;

  @override
  Widget build(BuildContext context) {
    if (isEmpty) {
      return emptyWidget;
    }
    return child;
  }
}
