import 'package:flutter/material.dart';
import 'package:management_app_ui/models/project_tasks.dart';
import 'package:management_app_ui/utilities/constants.dart';
import 'package:management_app_ui/widgets/team_members_stack.dart';

List<ProjectTask> ptasks = [];

class ProjectTaskSliverList extends StatefulWidget {
  dynamic apiData;
  ProjectTaskSliverList(this.apiData);
  @override
  _ProjectTaskSliverListState createState() => _ProjectTaskSliverListState();
}

class _ProjectTaskSliverListState extends State<ProjectTaskSliverList> {
  void iterateData() {
    int p = 0;
    DateTime totDays = DateTime.now();
    int tspent;
    var a = widget.apiData['issues'];
    for (var i in a) {
      p++;
      DateTime tdate = DateTime.parse(i["fields"]["created"]);
      if (i['fields']['timeoriginalestimate'] == null ||
          i['fields']['timeoriginalestimate'] == 0) {
        totDays = DateTime.now();
      } else {
        DateTime t = DateTime.parse(i['fields']['timeoriginalestimate']);
        totDays = t;
      }
      if (i['fields']['aggregatetimespent'] == null ||
          i['fields']['aggregatetimespent'] == 0) {
        tspent = null;
      } else {
        double t = i['fields']['aggregatetimespent'] / 3600;
        tspent = t.round();
      }

      ptasks.add(
        ProjectTask(
          taskName: (i['fields']['summary'] == null)
              ? 'TaskName'
              : i['fields']['summary'],
          teamMembers: 3,
          progressValue:
              (i["fields"]["percent"] == null) ? 12 : i["fields"]["percent"],
          totalDays: '${totDays.day}',
          date: '${tdate.month}/${tdate.day}/${tdate.year}',
          timeSpent: (tspent == null) ? '1d 7h' : '$tspent h',
          isLarge: false,
        ),
      );
    }
  }

  @override
  void initState() {
    iterateData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ptasks[index].isLarge
              ? AnimatedContainer(
                  key: ValueKey(1),
                  height: 350,
                  curve: Curves.bounceOut,
                  duration: Duration(seconds: 1),
                  color: Color(0xFFE1E7F6),
                  child: Container(
                    height: 207,
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[50],
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          color: Colors.grey[300],
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(
                        children: [
                          TeamMembers(ptasks[index].progressValue),
                          Divider(
                            thickness: 1.5,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.pink[50],
                                  radius: 25,
                                  backgroundImage: AssetImage('assets/man.png'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Daniel Davis',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Project Manager',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        //color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '1d 2h',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Time',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        //color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.pink[50],
                                  radius: 25,
                                  backgroundImage: AssetImage('assets/man.png'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rachel Long',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'UX/UI Designer',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        //color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '1d 3h',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Time',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        //color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.pink[50],
                                  radius: 25,
                                  backgroundImage: AssetImage('assets/man.png'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Zachary Butler',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'UI Designer',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        //color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '3h',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Time',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        //color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20,
                                child: Text(
                                  'More detailed',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15.5,
                                  ),
                                ),
                              ),
                              Container(
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '2d 4h',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    IconButton(
                                        padding: EdgeInsets.only(
                                          bottom: 1.3,
                                        ),
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey[600],
                                          //size: 25,
                                        ),
                                        iconSize: 27,
                                        onPressed: () {
                                          setState(() {
                                            ptasks[index].isLarge = false;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )

              ///SMALLLL
              : AnimatedContainer(
                  key: ValueKey(2),
                  duration: Duration(seconds: 1),
                  curve: Curves.bounceIn,
                  color: Color(0xFFE1E7F6),
                  child: Container(
                    height: 207,
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[50],
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          color: Colors.grey[300],
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Visibility(
                                child: Text(
                                  '${ptasks[index].totalDays} Days ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                visible: true,
                              ),
                              Text(
                                //'${ptasks[index].date}',
                                '|  ${ptasks[index].date}',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 190,
                                padding: EdgeInsets.only(
                                  top: 8,
                                ),
                                child: Text(
                                  // textAlign: TextAlign.start,
                                  '${ptasks[index].taskName}',
                                  style: Theme.of(context).textTheme.headline3,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 10,
                                ),
                                child: Text(
                                  'Team Members',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ],
                          ),
                          //StackExample(),
                          TeamMembers(ptasks[index].progressValue),
                          Divider(
                            thickness: 1.7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20,
                                child: Text(
                                  'More detailed',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15.5,
                                  ),
                                ),
                              ),
                              Container(
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Visibility(
                                      child: Text(
                                        '${ptasks[index].timeSpent}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      visible: true,
                                    ),
                                    IconButton(
                                        padding: EdgeInsets.only(
                                          bottom: 1.3,
                                        ),
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey[600],
                                          //size: 25,
                                        ),
                                        iconSize: 27,
                                        onPressed: () {
                                          setState(() {
                                            ptasks[index].isLarge = true;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
        childCount: widget.apiData['total'],
      ),
    );
  }
}
