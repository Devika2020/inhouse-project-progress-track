import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String name;
  final double amount;
  final int percentage;
  final Color color;
  final Icon icon;

  const ExpenseCard(
      {this.name, this.amount, this.percentage, this.color, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 10,
      ),
      height: 60,
      width: 60,
      child: ListTile(
        leading: Container(
          child: icon,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: color),
        ),
        title: Text(
          name,
          style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4),
        ),
        subtitle: Text(
          '$percentage%',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '-\$ ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: '$amount',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}