import 'package:flutter/material.dart';
import 'constant.dart';
import 'List.dart';
import 'roundedButton.dart';
import 'CityDashBoard.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String selecedState = "Uttar Pradesh";
  int selectedAge=1;
  String selectedCity="Kanpur Nagar";
  String selectedName="YourName";


  List<DropdownMenuItem<String>> getState()
  {
    List<DropdownMenuItem<String>> itemsState=[];
    for(int i=0;i<States.length;++i)
      {
        var dropdownitem=DropdownMenuItem(
          value: States[i],
          child: Text(States[i]),
        );
        itemsState.add(dropdownitem);
      }
    return itemsState;
  }

  List<DropdownMenuItem<int>> getAge()
  {
    List<DropdownMenuItem<int>> itemsState=[];
    for(int i=1;i<101;++i)
    {
      var dropdownitem=DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      );
      itemsState.add(dropdownitem);
    }
    return itemsState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/bg2.jpg'),fit: BoxFit.fill
          )
        ),
        child: Center(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                child: Image.asset(
                  "image/IndiaTBG.png",
                  width: 150,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7,
                horizontal: 10),
                child: Container(
                  width: 250.0,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    decoration:ktextFieldDecoration.copyWith(
                      hintText: "Enter Your Name"
                    ) ,
                    onChanged: (value){
                      selectedName=value;
                    },

                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7,
                      horizontal: 10),
                  child: Container(
                    width: 350.0,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Select Age",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20.0
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        DropdownButton(
                          value: selectedAge,
                          items: getAge(),
                          onChanged: (value){
                            selectedAge=value;
                          },
                        )
                      ],
                    ),
                  )
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7,
                    horizontal: 10),
                child: Container(
                  width: 350,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select State",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20.0
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      DropdownButton(
                        value: selecedState,
                        items: getState(),
                        onChanged: (value){
                          setState(() {
                            selecedState=value;
                          });
                        },
                      )
                    ],
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7,
                    horizontal: 10),
                child: Container(
                  width: 250.0,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    decoration:ktextFieldDecoration.copyWith(
                        hintText: "Enter Your City"
                    ) ,
                    onChanged: (value){
                        selectedCity=value;
                    },

                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(

                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
                ),
                child: MaterialButton(

                  child: (
                  Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  )
                  ),
                  onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder:
                        (context)=>LoadingScreen(selecedState,selectedCity,selectedName),
                    ));
                  }
                ),
              )

            ],
          ),
        ),
      ) ,
    );
  }
}
