import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:management_app_ui/screens/expenses.dart';
import 'package:management_app_ui/screens/home_screen.dart';
import 'package:management_app_ui/utilities/analytics.dart';
import 'package:management_app_ui/utilities/constants.dart';
import 'package:management_app_ui/utilities/locator.dart';

void main() {
  setUpLocator();

  runApp(ManagementApp());
}

class ManagementApp extends StatefulWidget {
  // static FirebaseAnalytics analytics = new FirebaseAnalytics();
  // static FirebaseAnalyticsObserver observer =
  //     new FirebaseAnalyticsObserver(analytics: analytics);

  @override
  _ManagementAppState createState() => _ManagementAppState();
}

class _ManagementAppState extends State<ManagementApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Management App',
      navigatorObservers: [
        locator<FirebaseAnalyticsPage>().getAnalyticsobserver()
      ],
      //home: HomeScreen(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/expenses': (context) => Expenses(),
//'/projectDetails': (context) => DetailScreen(apiData),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xFFF2F6FE),
        textTheme: TextTheme(
          headline4: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedColor,
            fontSize: 25,
          ),
          bodyText1: TextStyle(
            color: Colors.grey[600],
            fontSize: 15,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[600],
            fontSize: 13,
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.w600,
            color: selectedColor,
            fontSize: 20,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.w600,
            color: selectedColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
