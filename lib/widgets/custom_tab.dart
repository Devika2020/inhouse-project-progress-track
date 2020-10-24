import 'package:flutter/material.dart';

const tabs = [
  'Projects',
  'Clients',
  'Complet',
];

class CustomTab extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function onTap;

  CustomTab({this.index, this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 38,
        width: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: selectedIndex == index
                ? [
                    BoxShadow(
                      offset: Offset(10, 10),
                      color: Colors.grey[200],
                      blurRadius: 20,
                    ),
                  ]
                : []),
        child: Text(
          tabs[index],
          style: TextStyle(
            color: Colors.black,
            fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
            fontSize: selectedIndex == index ? 16 : 15.5,
          ),
        ),
      ),
    );
  }
}
