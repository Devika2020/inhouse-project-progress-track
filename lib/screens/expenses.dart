import 'package:flutter/material.dart';
import 'package:management_app_ui/models/expense_data.dart';
import 'package:management_app_ui/utilities/constants.dart';
import 'package:management_app_ui/widgets/expense_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List third = ['Cost Allocation', 'Expenses', 'Payments', 'Pending'];

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 10,
                  right: 10,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: third.asMap().entries.map((MapEntry map) {
                      return CustomTab2(
                        index: map.key,
                        selectedIndex: _selectedIndex,
                        onTap: () {
                          setState(() {
                            _selectedIndex = map.key;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                  // margin: EdgeInsets.only(
                  //   top: 8,
                  // ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      SfCircularChart(series: <CircularSeries>[
                        DoughnutSeries<ExpenseData, String>(
                          dataSource: expenses,
                          xValueMapper: (ExpenseData data, _) => data.name,
                          yValueMapper: (ExpenseData data, _) =>
                              data.percentage,
                          pointColorMapper: (ExpenseData data, _) => data.color,
                          startAngle: 270, // Starting angle of doughnut
                          endAngle: 90, // Ending angle of doughnut
                          innerRadius: '70%',
                        )
                      ]),
                      Positioned(
                        left: 147,
                        top: 70,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: '\$ ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              TextSpan(
                                text: '336.',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(text: '59'),
                            ],
                          ),
                        ),
                        //     child: Text(
                        //   '336.59',
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.w600
                        //   ),
                        // ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(
                  bottom: 5,
                  left: 20,
                  right: 20,
                ),
                child: Divider(
                  thickness: 1.3,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 20,
                  right: 20,
                ),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ExpenseCard(
                      amount: expenses[index].amount,
                      name: expenses[index].name,
                      color: expenses[index].color,
                      percentage: expenses[index].percentage,
                      icon: expenses[index].icon,
                    );
                  },
                  itemCount: expenses.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTab2 extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function onTap;

  CustomTab2({this.index, this.selectedIndex, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 10,
        bottom: 10,
        left: 10,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            third[index],
            style: TextStyle(
              letterSpacing: 0.3,
              color: selectedIndex == index ? Colors.black : Colors.grey,
              fontWeight:
                  selectedIndex == index ? FontWeight.bold : FontWeight.w500,
              fontSize: selectedIndex == index ? 16 : 15.5,
            ),
          ),
        ),
      ),
    );
  }
}