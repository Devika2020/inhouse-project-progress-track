import 'package:flutter/material.dart';
import 'package:management_app_ui/screens/expenses.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      height: 30,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.drag_handle, color: Colors.black, size: 28),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Expenses();
                },settings: RouteSettings(name:"Expenses"),),);
              },
              child: Image(
                image: AssetImage("assets/man.png"),
                color: null,
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}