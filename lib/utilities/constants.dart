import 'package:management_app_ui/models/chart_data.dart';
import 'package:management_app_ui/models/expense_data.dart';
import 'package:management_app_ui/models/project.dart';
import 'package:flutter/material.dart';

const projects = [
  Project(
    name: 'Social Media App',
    date: 'Deadline Nov 20,2019',
    imageName: 'assets/google.png',
    progressValue: 0.4,
  ),
  Project(
    name: 'Event App',
    date: 'Deadline Nov 30,2019',
    imageName: 'assets/pinterest.png',
    progressValue: 0.3,
  ),
  Project(
    name: 'Video Calling App',
    date: 'Deadline Dec 20,2019',
    imageName: 'assets/skype.png',
    progressValue: 0.6,
  ),
  Project(
    name: 'Instagram App',
    date: 'Deadline Nov 20,2019',
    imageName: 'assets/instagram.png',
    progressValue: 0.45,
  ),
  Project(
    name: 'Online Messaging App',
    date: 'Deadline Nov 20,2019',
    imageName: 'assets/messenger.png',
    progressValue: 0.8,
  ),
  Project(
    name: 'E-Mail App',
    date: 'Deadline Dec 10,2019',
    imageName: 'assets/gmail.png',
    progressValue: 0.7,
  ),
  Project(
    name: 'Chat App',
    date: 'Deadline Dec 30,2019',
    imageName: 'assets/whatsapp.png',
    progressValue: 0.6,
  ),
  Project(
    name: 'Browser App',
    date: 'Deadline Jan 01,2020',
    imageName: 'assets/firefox.png',
    progressValue: 0.45,
  ),
];

const chartData = [
  ChartData(color: Colors.indigoAccent, status: 'Done', percentage: 45),
  ChartData(color: Colors.redAccent, status: 'In Progress', percentage: 25),
  ChartData(color: Colors.orangeAccent, status: 'To Do', percentage: 15),
];

const taskCategory = [
  'All',
  'Design',
  'Frontend',
  'Backend',
  'Management',
];
const expenses=[
ExpenseData(name:"Food and Market",amount:336.59,percentage:24,color:Color(0xFF26C0B5),icon:Icon(Icons.fastfood,color: Colors.white,)),
ExpenseData(name:"Intercity And Transport",amount:290.21,percentage:18,color:Color(0xFFF8B24B),icon:Icon(Icons.directions_car,color: Colors.white,)),
ExpenseData(name:"Accomodation",amount:236.99,percentage:14,color:Color(0xFFBF8BE6),icon:Icon(Icons.face,color: Colors.white,)),
ExpenseData(name:"Life Insurance",amount:180.59,percentage:11,color:Color(0xFFC7C7C7),icon:Icon(Icons.all_inclusive,color: Colors.white,)),
ExpenseData(name:"Intercity And Transport",amount:290.21,percentage:18,color:Color(0xFFC8DF01),icon:Icon(Icons.directions_car,color: Colors.white,)),
ExpenseData(name:"Transfer service",amount:216.99,percentage:13,color:Color(0xFFFB99C88),icon:Icon(Icons.monetization_on,color: Colors.white,)),
];

const selectedColor = Color(0xFF0D204C);

