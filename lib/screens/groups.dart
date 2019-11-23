import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'grouptimeline.dart';

class Groups extends StatefulWidget {
  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  final List<String> _choices = ['Join Group', 'Create Group'];
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); //for drawer
  String _username = "Jash";

  void _joinGroup() {
    print("joined group");
  }

  void _createGroup() {
    print("new group created");
  }

  final cardColors = [
    Colors.red,
    Colors.indigo,
    Colors.blueGrey,
    Colors.green,
    Colors.purple,
    Colors.brown,
    Colors.black,
    Colors.pink,
    Colors.amber
  ];

  int _randomColor() {
//    print(new Random().nextInt(cardColors.length));
    return new Random().nextInt(cardColors.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Groups",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              tooltip: "New Group",
              icon: Icon(Icons.add),
              itemBuilder: (context) {
                return _choices.map((String option) {
                  return PopupMenuItem<String>(
                    child: Text(option),
                    value: option,
                  );
                }).toList();
              },
              onSelected: (String selected) {
                switch (selected) {
                  case "Join Group":
                    {
                      _joinGroup();
                    }
                    break;
                  case "Create Group":
                    {
                      _createGroup();
                    }
                    break;
                  default:
                    break;
                }
              },
            ),
          ],
        ),
        drawer: Drawer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              duration: const Duration(milliseconds: 30000),
              child: UserAccountsDrawerHeader(
                accountEmail: Text("jash@gmail.com",
                    style: TextStyle(
                      fontSize: 15.0,
                    )),
                accountName: Text(_username,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600)),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Group"),
            ),
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text("Timeline"),
            ),
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text("Statistics"),
            ),
            ListTile(
                leading: Icon(Icons.account_circle), title: Text("Profile")),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),
          ],
        )),
        body: RefreshIndicator(
          onRefresh: () async {
            //as this always returns a future object, we have just added a future delay and
            // await keyword by default returns a future object so no need to return explicitly here
            await Future.delayed(Duration(seconds: 1));
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Refreshed"),
            ));
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(),
                child: Card(
                  child: ListTile(
                    title: Text("Group Name"),
                    subtitle: Text("Group Admin"),
                    trailing: Text("200"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Timeline();
                      }));
                    },
                  ),
                ),
              );
            },
            itemCount: 10,
//            itemExtent: 100.0,
          ),
        ),
      ),
    );
  }
}
