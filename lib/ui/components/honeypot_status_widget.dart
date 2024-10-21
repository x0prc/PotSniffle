import 'package:flutter/material.dart';

class HoneypotStatusWidget extends StatelessWidget {
  final String status;

  HoneypotStatusWidget({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Edge