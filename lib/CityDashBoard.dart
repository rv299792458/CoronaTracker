import 'dart:convert';
import 'package:coronacount/dashboard.dart';
import 'dashboard.dart';
import 'roundedButton.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'webpage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

int active = 0,
    confirmed = 0,
    deaths = 0,
    recovered = 0;

double value=0.0;
Color valueColor=Colors.green;


class LoadingScreen extends StatefulWidget {
  LoadingScreen(this.state,this.city,this.name);
  final String state;
  final String city;
  final String name;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getCityDashBoard(widget.state,widget.city,widget.name);
    super.initState();
  }

  getCityDashBoard(String State,String City,String Name)
  async{
    var isLoading = await getDate(State, City);
    if(isLoading==200)
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=>CityDashBoard(State,City,Name),

      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SpinKitFoldingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}




class CityDashBoard extends StatefulWidget {
  CityDashBoard(this.State, this.City, this.Name);

  final String State;
  final String City;
  final String Name;

  @override
  _CityDashBoardState createState() => _CityDashBoardState();
}

class _CityDashBoardState extends State<CityDashBoard> {
  String yourname;
  int counter=0;
  static var chartdisplay;
  final blue = charts.MaterialPalette.blue.makeShades(2);
  final red = charts.MaterialPalette.red.makeShades(2);
  final green = charts.MaterialPalette.green.makeShades(2);
  final orange = charts.MaterialPalette.deepOrange.makeShades(2);


  @override
  void initState() {

    var data=[
      addCharts("active",active),
      addCharts("confirmed",confirmed),
      addCharts("deaths",deaths),
      addCharts("recovered",recovered),

    ];
    var series=[charts.Series(
      domainFn: (addCharts addcharts,_)=>addcharts.text,
      measureFn: (addCharts addcharts,_)=>addcharts.number,
      id: "addcharts",
      data:data,
      colorFn: (addCharts addcharts,_){
        switch(addcharts.text){
          case "active":
            {
              return blue[0];
            }
          case "confirmed":
            {
              return orange[1];
            }
          case "deaths":
            {
              return red[0];
            }
          case "recovered":
            {
              return green[0];

            }

        }
      },
    ),];

    chartdisplay=charts.BarChart(
    series,
      animationDuration: Duration(milliseconds: 2000),
    );
    yourname = widget.Name;
    getDate(widget.State, widget.City);
    value=0.2+((deaths/recovered));
    if(value>0.25&&value<0.6)
      valueColor=Colors.yellow;
    else if(value>0.6)
      valueColor=Colors.red;
    print(value);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "City DashBoard",
                    style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 20.0,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Row(

                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      child: Image.asset('image/maleMask.jpg',
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                    Text(
                      "hi ,$yourname",
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),

                    SizedBox(
                      width: 50.0,
                    ),
                   GestureDetector(
                     onTap:(){
                       Navigator.push(context,MaterialPageRoute(
                           builder:(context)=>Dashboard()
                       ));
                     },
                     child: Icon(
                       Icons.home,
                       size: 40.0,
                       color: Colors.purple,
                     ),
                   )
                  ],

                ),

                Container(
                  width: 300.0,
                  height: 30.0,
                  child: LiquidLinearProgressIndicator(
                    value: value,
                    valueColor: AlwaysStoppedAnimation(valueColor),
                    backgroundColor: Colors.white,
                    borderColor: valueColor,
                    borderRadius: 5.0,
                    borderWidth: 5.0,
                    direction: Axis.horizontal,
                    center: Text("Danger Level",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        //flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ContainerTile(
                            'https://www.mohfw.gov.in/assets/images/icon-infected.png',
                            Colors.blue,
                            "Active",
                            active.toString(),
                          ),
                        ),
                      ),
                      Expanded(
                        //flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ContainerTile(
                            'https://www.mohfw.gov.in/assets/images/icon-inactive.png',
                            Colors.green,
                            "Cure",
                            recovered.toString(),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        //flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ContainerTile(
                            'https://www.mohfw.gov.in/assets/images/icon-infected.png',
                            Colors.red,
                            "Deaths",
                           deaths.toString(),
                          ),
                        ),
                      ),
                      Expanded(
                        //flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ContainerTile(
                            'https://www.mohfw.gov.in/assets/images/icon-active.png',
                            Colors.brown,
                            "Confirmed",
                            confirmed.toString(),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Material(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
                        elevation: 14.0,
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),

                      ),
                      height: 200.0,
                      width: 400.0,
                      child: chartdisplay,

                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),


                Container(
                  width: 500.0,
                  height: 500.0,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[

                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: WebViewPageTile(),
                        width: 350,
                          height: 190,
                        ),
                      ),

                      GestureDetector(
                          onTap:(){
                            Navigator.push(context,MaterialPageRoute(
                                builder:(context)=>NewsPage()
                            ));
                          },
                          child:  Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: CoronaNews(),
                              width: 350,
                              height: 190,
                            ),
                          ),
                      ),
                    ],
                  ),

                )




              ],
            ),

          ),
        ),
      ),
    );
  }

 Material ContainerTile(String url,
      Color textColor,
      String text,
      String count,) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
      child: Container(

        //  color: Colors.blue,

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Image.network(url,
        height: 50.0,
        width: 50.0,
        ),
        SizedBox(
        height: 20.0,
        ),
        Text(
        text,
        style: TextStyle(
        color:textColor,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,

        ),
        ),
        SizedBox(
        height: 10.0,
        ),
        Text(
        count,
        style: TextStyle(
        color: textColor,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        ),
        ),
        ],
        ),
      ),
      ),
    );
    }
}


Future getDate(String State, String City) async {
  http.Response response = await http.get(
      'https://api.covid19india.org/state_district_wise.json');
  if (response.statusCode == 200) {
    print("sucess");
    String data = response.body;
    active = jsonDecode(data)[State]['districtData'][City]['active'];
    confirmed = jsonDecode(data)[State]['districtData'][City]['confirmed'];
    deaths = jsonDecode(data)[State]['districtData'][City]['deceased'];
    recovered = jsonDecode(data)[State]['districtData'][City]['recovered'];
    print(active);
    print(confirmed);
    print(deaths);
    print(recovered);

  }
  else {
    print("Error");
  }
  return response.statusCode;
}

class addCharts
{
  final String text;
  final int number;
  addCharts(this.text,this.number);
}
