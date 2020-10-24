import 'package:flutter/material.dart';
import 'package:management_app_ui/models/chart_data.dart';
import 'package:management_app_ui/utilities/constants.dart';
import 'package:management_app_ui/widgets/chart_status_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          key: ValueKey(3),
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.44 - 30,
          height: MediaQuery.of(context).size.width * 0.44 - 30,
          child: SfCircularChart(
            series: <CircularSeries>[
              // Renders doughnut chart
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.status,
                  yValueMapper: (ChartData data, _) => data.percentage,
                  pointColorMapper: (ChartData data, _) => data.color,

                  // Radius of doughnut's inner circle
                  innerRadius: '70%')
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.width * 0.44 - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: chartData
                  .map((chart) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChartStatusView(chart),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
