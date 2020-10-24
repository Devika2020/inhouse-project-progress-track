import 'package:flutter/material.dart';
import 'package:management_app_ui/models/chart_data.dart';
import 'package:management_app_ui/utilities/constants.dart';

class ChartStatusView extends StatelessWidget {
  final ChartData _chartData;

  ChartStatusView(this._chartData);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 26),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  color: _chartData.color,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              SizedBox(width: 15),
              Text(
                _chartData.status,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Text(
          '${_chartData.percentage}%',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
