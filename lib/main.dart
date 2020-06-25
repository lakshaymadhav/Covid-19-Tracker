import 'dart:async';

import 'package:Covid19_Tracker/datasoruce.dart';
import 'package:Covid19_Tracker/homepage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp( ));
}


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return DynamicTheme(

        data: (brightness){
          return ThemeData(
            primaryColor: primaryBlack,
            fontFamily: 'Circular',
            brightness: brightness==Brightness.dark?Brightness.dark:Brightness.light,
            scaffoldBackgroundColor: brightness==Brightness.dark?Colors.blueGrey[900]:Colors.white,
          );
        },
          
        themedWidgetBuilder: (context, theme){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: SplashScreen(),
            routes: <String, WidgetBuilder>{
              '/homepage': (BuildContext context) => new HomePage()
            },
          );
        },

      
    );
  }
}

  class SplashScreen extends StatefulWidget {
    @override
    _SplashScreenState createState() => _SplashScreenState();
  }
  
  class _SplashScreenState extends State<SplashScreen> {
    
startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/homepage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
      @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/covidnobg.png")
                  ),
                Text("COVID-19 TRACKER",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                
              ],
            ),
        ),
      ),
    );
  }
}
  