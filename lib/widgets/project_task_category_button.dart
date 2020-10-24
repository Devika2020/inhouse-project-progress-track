import 'package:flutter/material.dart';
import 'package:management_app_ui/utilities/constants.dart';

class ProjectTaskCategoryButton extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function onTap;

  ProjectTaskCategoryButton({this.index, this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          taskCategory[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.5,
            color: index == selectedIndex ? Colors.white : selectedColor,
          ),
        ),
        decoration: BoxDecoration(
          color: selectedIndex == index ? selectedColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
