import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pijjybank/screens/groups.dart';
import 'package:pijjybank/models/transaction.dart';
import 'package:side_header_list_view/side_header_list_view.dart';

import '../widgets/budgetOverview.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();//for drawer
  String _username = "Jash";
  _getDay(int weekday) {
    if (weekday == 1)
      return "MON";
    else if (weekday == 2)
      return "TUE";
    else if (weekday == 3)
      return "WED";
    else if (weekday == 4)
      return "THU";
    else if (weekday == 5)
      return "FRI";
    else if (weekday == 6)
      return "SAT";
    else
      return "SUN";
  }

  Container _buildBottomSheet(context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),topRight: Radius.circular(16.0))
      ),
      child: Text("Bottom Sheet"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Timeline",),
          elevation: 1.0,
          iconTheme: new IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        key: _scaffoldKey,
        body: RefreshIndicator(
          onRefresh: () async {
            //as this always returns a future object, we have just added a future delay and
            // await keyword by default returns a future object so no need to return explicitly here
            await Future.delayed(Duration(seconds: 1));
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Refreshed"),
            ));
          },
          child: SideHeaderListView(
            padding: new EdgeInsets.all(8.0),
            itemCount: transactions.length,
            itemExtend: 70.0,
            headerBuilder: (BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(),
                  child: Column(
                    children: <Widget>[
                      Text(_getDay(transactions[index].date.weekday)),
                      Text(transactions[index].date.day.toString(),style: Theme.of(context).textTheme.headline,),
                    ],
                  ));
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 8.0,left: 8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight:Radius.circular(8.0),bottomRight: Radius.circular(8.0),bottomLeft: Radius.circular(8.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(transactions[index].title,style: Theme.of(context).textTheme.title,),
                        Text(transactions[index].party,style: Theme.of(context).textTheme.subtitle,)
                      ],
                    ),
                    Text(transactions[index].amount.toString(),style: Theme.of(context).textTheme.headline,)
                  ],
                ),
              );
            },
            hasSameHeader: (int a, int b) {
              Duration val = transactions[a].date.difference(transactions[b].date);
              if (val.inDays == 0) return true;
              return false;
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scaffoldKey.currentState.showBottomSheet((context)=>_buildBottomSheet(context));
          },
          child: Icon(Icons.add),
          tooltip: "Add new transaction",
        ),
        drawer: Drawer(
            key: _drawerKey,
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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Groups();
                    }));
                  },
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
      ),
    );
  }
}
