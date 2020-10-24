import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:management_app_ui/widgets/bottom_bar.dart';
import 'package:management_app_ui/widgets/home_app_bar.dart';
import 'package:management_app_ui/widgets/custom_tab.dart';
import 'package:management_app_ui/widgets/home_list_view.dart';
import 'package:http/http.dart' as http;

final databaseReference = FirebaseDatabase.instance.reference();
String authToken;
String authEmail;
var projectId;

enum BottomIcons { Home, Favorite, Search, Account }

class HomeScreen extends StatefulWidget {
  HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> apiData = [];
  int length;

//REAL TIME DB AND API CALL
  Future<List> getData() async {
    await databaseReference.once().then((DataSnapshot snapshot) {
      var dataa = Map<String, dynamic>.from(snapshot.value);

      setState(() {
        authToken = dataa['users']['user1']['authToken'];
        authEmail = (snapshot.value)['users']['user1']['authEmail'];
        projectId = (snapshot.value)['users']['user1']['projectsIds'];
        length = dataa['users']['user1']['projectsIds'].values.length;
      });
    });
    //API PART
    await Future.delayed(const Duration(milliseconds: 500));
    int ptr = 0;
    var projectIds = Map<String, dynamic>.from(projectId);

    print(projectIds.length);
    String basicAuth = 'Basic ' +
        base64Encode(
          utf8.encode('$authEmail:$authToken'),
        );
    List<dynamic> apiData1 = [];
    for (int i = 0; i < length; i++) {
      // projectIds.forEach((key, value) async {
      //FOR EACH=>API CALL

      String f =
          "https://gowebknot.atlassian.net/rest/api/2/search?jql=project=BEZ&maxResults=1000";
      http.Response response = await http.get(
        '$f',
        headers: {
          HttpHeaders.authorizationHeader: basicAuth,
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

      if (response.statusCode == 200) {
        String data = response.body;
        print("Working");
        dynamic d1 = jsonDecode(data);

        apiData1.add(d1);

        print(apiData1[0]["issues"][0]['fields']['project']['name']);
      } else {
        print("not working");
      }
      ptr++;
    }

    Future.delayed(const Duration(milliseconds: 200));

    return apiData1;
  }

  BottomIcons bottomIcons = BottomIcons.Home;
  int _selectedIndex = 0;
  @override
  void initState() {
    // this.apiData = getData();
    //getDataFromdb();

//     Future.delayed(const Duration(seconds:5),(){
// getData().then((val) {
//         setState(() {
//           this.apiData = val;
//         });
//       });
//     });

    getData().then((val) {
      setState(() {
        print(val.length);
        apiData = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ((apiData.length == 0 || authToken == null || apiData == null)) {
      return Center(
          child: SizedBox(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.grey,
          strokeWidth: 5,
        ),
      ));
    } else {
      return Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: Theme.of(context).accentColor,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: false,
                  expandedHeight: 250,
                  pinned: true,
                  backgroundColor: Colors.white,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                    ),
                  ),
                  title: HomeAppBar(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(
                        left: 22.0,
                        right: 22.0,
                        top: 80,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Text(
                              'Hi Rahman!',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Good afternoon',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Text(
                              '03 September 2019',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          SizedBox(height: 46),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: tabs.asMap().entries.map((MapEntry map) {
                              return CustomTab(
                                index: map.key,
                                selectedIndex: _selectedIndex,
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = map.key;
                                  });
                                },
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                HomeListView(apiData, length),
              ],
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 20,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Home;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Home ? true : false,
                      icons: Icons.home,
                      text: "Home"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Favorite;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Favorite ? true : false,
                      icons: Icons.settings,
                      text: "Settings"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Search;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Search ? true : false,
                      icons: Icons.favorite_border,
                      text: "Favorite"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Account;
                        });
                      },
                      bottomIcons:
                          bottomIcons == BottomIcons.Account ? true : false,
                      icons: Icons.person_outline,
                      text: "Account"),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
