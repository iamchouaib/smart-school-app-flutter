import 'dart:convert';

import 'package:chouaibe/model/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var absences;

  @override
  void initState() {
    super.initState();
    absences_get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: RefreshIndicator(
            child: Column(children: [
              Stack(children: [
                Container(
                    height: 75,

                    //color: Colors.red,),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Sketch.png"),
                            fit: BoxFit.cover),
                        //color: Color(0xffE5E7F3),

                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                        ))),
              ]),
              SizedBox(
                height: 20,
              ),
              absences == null
                  ? Container()
                  : Expanded(
                      child: ListView.builder(
                      itemBuilder: _buildOfferItem,
                      itemCount: absences.length,
                      padding: const EdgeInsets.only(
                        top: 0,
                        left: 8,
                        right: 8,
                      ),
                    ))
            ]),
            onRefresh: () {
              absences_get();
              return Future<void>.delayed(const Duration(seconds: 2));
            }));
  }

  Widget _buildOfferItem(BuildContext context, int index) {
    return InkWell(
        onTap: () {
          // Navigator.push(
          // context,
          // MaterialPageRoute(
          // builder: (context) =>
          //      agence_profile(user_id: _agence[index]['id'])));
        },
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8), //border corner radius
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 2, // blur radius
                offset: Offset(0, 2), // changes position of shadow
              ),
              //you can set more BoxShadow() here
            ],
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Text(
                        "(" +
                            absences[index]['seance']['session']['session_type']
                                .toString() +
                            ")",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 2, 62, 138)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(" +
                            absences[index]['seance']['session']['module']
                                    ['priority']
                                .toString() +
                            ")",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 2, 62, 138)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        absences[index]['seance']['session']['module']
                                ['name_ar']
                            .toString(),
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // _agence[index]['adresse']==null?
                  // Row(children: [
                  //   Icon(Icons.pin_drop_outlined,size: 18,),
                  //   SizedBox(width: 10,),
                  // Text('Non disponible')
                  // ],)
                  // :
                  Row(
                    children: [
                      Text(
                        absences[index]['seance']['session']['duration']
                            .toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        absences[index]['seance']['seance_date'].toString(),
                        style:
                            TextStyle(color: Color.fromARGB(255, 2, 62, 138)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.calendar_month,
                        size: 18,
                        color: Color.fromARGB(255, 2, 62, 138),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(100),
                    color: Color.fromARGB(87, 209, 206, 206),
                  ),
                  child: ClipOval(
                      child: Icon(
                    Icons.subject,
                    size: 40,
                    color: Color.fromARGB(255, 2, 62, 138),
                  ))),
            ],
          ),
        ));
  }

  absences_get() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? id = await pref.getString('id');
    if (id != null && id.length > 0) {
      id = id.substring(1, id.length - 1);
      print(id);

      var response = await Api().getData('/absences/' + id);
      if (response.statusCode == 200) {
        Future.delayed(Duration(milliseconds: 10)).then((_) {
          setState(() {
            final body = jsonDecode(response.body);
            absences = body;
            print("HHHHHHHHHH" + absences.toString());

            print("MODULE" +
                absences[0]['seance']['session']['module']['name'].toString());
            // print(get_offer);
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Error ' + response.statusCode.toString() + ': ' + response.body),
          //  content: Text('Error ' + response.statusCode + ': ' + response.body),
        ));
      }
    }
  }
}
