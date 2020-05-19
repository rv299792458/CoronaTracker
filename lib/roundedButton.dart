import 'package:flutter/material.dart';
import 'CityDashBoard.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({this.onPressed,this.title});
  final Function onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: <Color>[Colors.blue,Colors.white
              //Color(0xffb03c30)

            ]
        )
      ),


      child: MaterialButton(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0)
        ),
        onPressed: onPressed(),
          minWidth:200.0 ,
        height: 50.0,
        child: Text(title,
        style: TextStyle(
            fontFamily:'Quantico' ,
          fontSize: 20,
          color: Colors.white
        ),
        ),
        color: Colors.transparent

      ),

    );
  }
}

Material LogInPageTile()
{
  return Material(

      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
            image: DecorationImage(
                image: AssetImage('image/blurMap.jpg'),
                fit: BoxFit.fill
            )
        ),
        child: Center(
          child: Column
            (
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),

              Icon(
                Icons.add_location,
                color: Colors.lightBlue,
                size: 65.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "ADD YOUR LOCATION",
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold

                ),
              )
            ],
          ),
        ),
      )

  );
}


Material WebViewPageTile ()
{
  return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
            image: DecorationImage(
                image: AssetImage('image/mhrd.jpg'),
                fit: BoxFit.fill
            )
        ),

      )

  );
}


Material CoronaNews ()
{
  return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
            image: DecorationImage(
                image: AssetImage('image/CoronaNews.jpg'),
                fit: BoxFit.fill
            )
        ),

      )

  );
}

Material myTile(String background_url,String text,String count,Color c1,Color c2, Color TextColor)
{
  return Material(
    color: Colors.white,
    elevation: 14.0,
    shadowColor: Colors.black,
    borderRadius: BorderRadius.circular(24.0),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,
            colors: [c1,c2]
        ),
        borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(background_url,
            height: 50.0,
            width: 50.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: TextColor,
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
              color: TextColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
