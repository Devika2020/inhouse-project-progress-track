import 'package:flutter/material.dart';

class ChartData {
  final String status;
  final int percentage;
  final Color color;

  const ChartData({
    this.color,
    this.status,
    this.percentage,
  });
}
