import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'webpage.dart';
import 'loginPage.dart';
import 'roundedButton.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
          title: Center(child: Text("Dashboard")),
      ),
      body:StaggeredGridView.count(
          crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        children: <Widget>[
        myTile('https://www.mohfw.gov.in/assets/images/icon-infected.png', "Active Cases", "23651",Color(0xFFA5C9FD),Color(0xFFBDE6FB), Colors.indigo),
          myTile('https://www.mohfw.gov.in/assets/images/icon-infected.png',"Deaths","1074",Color(0xFFFF4000), Color(0xFFFE8582),  Colors.red[900]),
        myTile('https://www.mohfw.gov.in/assets/images/icon-inactive.png', "Cured","8324", Color(0xFFBAD335),Color(0xFFB4FEB4),  Colors.green[900]),
          myTile('https://www.mohfw.gov.in/assets/images/icon-active.png', "Migrated","1", Color(0xFFFCA782), Color(0xFFF6CD67), Colors.brown),
          GestureDetector(
          onTap:(){
            Navigator.push(context,MaterialPageRoute(
              builder:(context)=>LoadWebPage()
            ));
          },
          child: WebViewPageTile()
        ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                  builder:(context)=>LoginPage()
              ));
            },
            child: LogInPageTile(),

          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                  builder:(context)=>NewsPage()
              ));
            },
            child: CoronaNews(),

          ),




        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 200),
          StaggeredTile.extent(1, 200),
          StaggeredTile.extent(1, 200),
          StaggeredTile.extent(1, 200),
          StaggeredTile.extent(2, 250),
          StaggeredTile.extent(2, 180),
          StaggeredTile.extent(2, 180),



        ],


      ),

    );
  }
}
