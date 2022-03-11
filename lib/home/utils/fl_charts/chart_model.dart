import 'package:flutter/material.dart';

import 'line_chart2/line_chart2_view.dart';
import 'pie_chart/pie_card.dart';
import 'bar_chart2/bar_chart2_view.dart';
import 'bar_chart1/bar_chart1_view.dart';

class ChartList {
  static final List<Widget> chartList = [
    PieChartSample2(),
    BarChartSample1(),
    LineChartSample2(),
    BarChartSample2()
  ];
}
