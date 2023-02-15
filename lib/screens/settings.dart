import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: 80,
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
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Container(
                  child: Text(
                    "اعدادات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 5),
                      blurRadius: 5.0,
                      spreadRadius: 0)
                ],
                color: Color.fromARGB(255, 247, 247, 247),
                border: Border.all(color: Color.fromARGB(255, 2, 62, 138)),
                borderRadius: BorderRadius.circular(5),
              ),
              /** CheckboxListTile Widget **/
              child: ExpansionTile(
                title: Text(
                  "اللغة",
                  style: TextStyle(
                      // color: abc[0] ? Colors.blue : Colors.black,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                    height: 60,
                    margin:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0, 5),
                            blurRadius: 5.0,
                            spreadRadius: 0)
                      ],
                      color: Color.fromARGB(255, 247, 247, 247),
                      border:
                          Border.all(color: Color.fromARGB(255, 2, 62, 138)),
                      borderRadius: BorderRadius.circular(5),
                    ), //BoxDecoration

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),

                        Container(
                          width: 150,
                          child: Text("اشعارات"),
                        ),

                        // SizedBox(width: 155,),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_right_rounded,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ))),
            SizedBox(
              height: 5,
            ),
            InkWell(
                //highlightColor: Colors.transparent,
                //splashColor: Colors.transparent,
                onTap: () async {},
                child: Container(
                    height: 60,
                    margin:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0, 5),
                            blurRadius: 5.0,
                            spreadRadius: 0)
                      ],
                      color: Color.fromARGB(255, 247, 247, 247),
                      border:
                          Border.all(color: Color.fromARGB(255, 2, 62, 138)),
                      borderRadius: BorderRadius.circular(5),
                    ), //BoxDecoration

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),

                        Container(
                          width: 150,
                          child: Text("ارسل بريد"),
                        ),

                        // SizedBox(width: 155,),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.feedback_rounded,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_right_rounded,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ))),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14,
                ),
                Container(
                  child: Text(
                    "حول Smart",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: (() {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => infos()));
                }),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                    height: 60,
                    margin:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0, 5),
                            blurRadius: 5.0,
                            spreadRadius: 0)
                      ],
                      color: Color.fromARGB(255, 247, 247, 247),
                      border:
                          Border.all(color: Color.fromARGB(255, 2, 62, 138)),
                      borderRadius: BorderRadius.circular(5),
                    ), //BoxDecoration

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),

                        Container(
                          width: 150,
                          child: Text("أعدادات عامة"),
                        ),

                        // SizedBox(width: 155,),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.language,
                          size: 30,
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_right_rounded,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ))),
            SizedBox(
              height: 5,
            ),
            InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => connexion()));
                },
                child: Container(
                    height: 45,
                    margin:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0, 5),
                            blurRadius: 5.0,
                            spreadRadius: 0)
                      ],
                      color: Color.fromARGB(255, 2, 62, 138),
                      border:
                          Border.all(color: Color.fromARGB(255, 2, 62, 138)),
                      borderRadius: BorderRadius.circular(5),
                    ), //
                    child: Center(
                      child: Text(
                        "تسجيل الخروج",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ))),
            SizedBox(
              height: 20,
            )
          ]),
        ));
  }
}
