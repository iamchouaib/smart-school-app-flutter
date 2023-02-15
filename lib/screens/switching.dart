  import 'package:chouaibe/screens/abcences.dart';
import 'package:chouaibe/screens/add.dart';
import 'package:chouaibe/screens/child.dart';
import 'package:chouaibe/screens/home.dart';
import 'package:chouaibe/screens/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class switching_page extends StatefulWidget {
  @override
  State<switching_page> createState() => _switching_pageState();
}

class _switching_pageState extends State<switching_page> {
  final screen = [
   settings(),
   add(),
   child(),
   abcences(),
    home(),
  ];

  void initState() {
    super.initState();
    


  }



int last_acces=4;

  @override
  Widget build(BuildContext context) {
    return 
    new WillPopScope(
       onWillPop: () async {
         return false;
        },
        child: 
    Scaffold(
     
     
      //  floatingActionButton:  
      //       Visibility(
      //         visible: agence_conncet ,
      //         child: 
      //       Container(
      //         margin: EdgeInsets.only(bottom: 15),
      //         child:
      //       FloatingActionButton(
      //         backgroundColor: Color.fromARGB(255,222, 226, 230),
      //         child: Icon(Icons.real_estate_agent, color:Color.fromARGB(255, 73, 80, 87)),
      //       onPressed:(){
      //         Navigator.push(context,MaterialPageRoute(builder: (context) =>switching_agence()));
      //         print(agence_conncet);
      //         }
      //       ),
      //       ),
            
      //       ),
      body: screen[last_acces],
      bottomNavigationBar: CurvedNavigationBar(
        letIndexChange: (value) => true,
        // animationDuration: Duration(microseconds: 400),
       // animationDuration: Duration(milliseconds: 280),
       animationDuration: Duration(milliseconds: 400),
        index: last_acces,
        height: 50,
        color: Color.fromARGB(255, 2, 62, 138),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromARGB(255, 2, 62, 138),
        // animationCurve: Curves.slowMiddle,
        animationCurve: Curves.linear,
        items: <Widget>[
         
        
         
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.settings_outlined,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "إعدادات",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              )
            ],
          ),
          
             Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add_outlined,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "تسجيل",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              )
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.child_care,
                size: 30,
                color: Colors.white,
              ),
              Text(
               "أبنائي",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              )
            ],
          ),
         Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.file_copy_outlined,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "التبرير",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              )
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "الرئيسية",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
        onTap: (index) {
        
          setState(() {
            {
              last_acces = index;
              // page = index;
            }
          });
        },
      ),
    )
    );
  }
}
