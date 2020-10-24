import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:management_app_ui/utilities/constants.dart';
import 'package:management_app_ui/widgets/chart_view.dart';
import 'package:management_app_ui/widgets/detail_screen_app_bar.dart';
import 'package:management_app_ui/widgets/project_task_category_button.dart';
import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:management_app_ui/widgets/project_task_sliver_list.dart';
import '../main.dart';

class DetailScreen extends StatefulWidget {
  dynamic apiData;
  DetailScreen(this.apiData);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: false,
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.white,
            centerTitle: false,
            title: DetailScreenAppBar(),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(
                  left: 22.0,
                  right: 22.0,
                  top: 112,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OMP Dashboard',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Icon(Icons.insert_chart),
                      ],
                    ),
                    SizedBox(height: 20),
                    ChartView(),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: false,
            delegate: _SliverAppBarDelegate(
              minHeight: 110.0,
              maxHeight: 110.0,
              child: Container(
                padding: EdgeInsets.only(top: 28),
                decoration: BoxDecoration(
                  color: Color(0xFFE1E7F6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Project tasks',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            '${(widget.apiData['issues']).length} quantity',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(left: 28),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            taskCategory.asMap().entries.map((MapEntry map) {
                          return ProjectTaskCategoryButton(
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
                  ],
                ),
              ),
            ),
          ),
          ProjectTaskSliverList(widget.apiData),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
