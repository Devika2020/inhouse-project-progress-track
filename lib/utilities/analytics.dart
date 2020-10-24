
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
class FirebaseAnalyticsPage{
  FirebaseAnalytics analytics =  FirebaseAnalytics();
    FirebaseAnalyticsObserver getAnalyticsobserver() =>
       FirebaseAnalyticsObserver(analytics: analytics);
}
