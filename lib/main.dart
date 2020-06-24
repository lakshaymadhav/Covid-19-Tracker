import 'package:Covid19_Tracker/datasoruce.dart';
import 'package:Covid19_Tracker/homepage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
            home: HomePage(),
          );
        },

      
    );
  }
}