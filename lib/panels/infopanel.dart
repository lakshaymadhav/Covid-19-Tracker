import 'package:Covid19_Tracker/datasoruce.dart';
import 'package:Covid19_Tracker/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));
            },
              child: Container(
              padding:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
               color: primaryBlack,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("FAQ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                ),
            ),
          ),
            
            
            GestureDetector(
              onTap: (){
                launch('https://www.pmcares.gov.in/en/web/contribution/donate_india');
              },
              child: Container(
              padding:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
               color: primaryBlack,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("DONATE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                ),
          ),
            ),
            
            
            GestureDetector(
              onTap: (){
                launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
              },
              child: Container(
              padding:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
               color: primaryBlack,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("MYTH BUSTERS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                ),
          ),
            ),
        ],
      ),
    );
  }
}