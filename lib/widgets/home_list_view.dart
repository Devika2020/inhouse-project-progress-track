import 'package:flutter/material.dart';
import 'package:management_app_ui/screens/detail_screen.dart';
import 'package:management_app_ui/utilities/constants.dart';

class HomeListView extends StatelessWidget {
  List<dynamic> apiData;
  int length;
  HomeListView(this.apiData, this.length);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var project = projects[index];
          //var src=apiData[index]['issues'][0]['fields']['project']['avatarUrls']['16x16'];
          return Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            height: 100,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(apiData[index]),
                    settings: RouteSettings(name: 'ProjectDetails'),
                  ),
                );
              },
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.all(8),
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).accentColor,
                          ),
                          child: Image(
                            image:
                                // NetworkImage(src),
                                // Image.network('src'),
                                AssetImage('${project.imageName}'),
                            color: null,
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 22, horizontal: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${apiData[index]["issues"][0]['fields']['project']['name']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 6),
                              Visibility(
                                child: Text(
                                  '${project.date}',
                                  // (apiData["issues"][0]["fields"]["duedate"]==null)?'Deadline Nov 20,2019':'Deadline ${projectDeadline.month} ${projectDeadline.day},${projectDeadline.year}'

                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                visible: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    LinearProgressIndicator(
                      backgroundColor: Colors.lightBlue[100],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      value: project.progressValue,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: apiData.length,
      ),
    );
  }
}
