import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:chouaibe/model/api.dart';
import 'package:chouaibe/screens/switching.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class abcences extends StatefulWidget {
  const abcences({Key? key}) : super(key: key);

  @override
  State<abcences> createState() => _abcencesState();
}

class _abcencesState extends State<abcences> {
  bool hide = false;
  List<XFile> images = [];
  ImagePicker _picker = ImagePicker();
  var justification;
  var remarquesController = TextEditingController();
  bool affiche = false;

  @override
  void initState() {
    super.initState();
    justification_get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: hide ? Colors.grey : Colors.white,
        resizeToAvoidBottomInset: false,
        body: RefreshIndicator(
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(children: [
                Container(
                    height: 76,

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
              Visibility(
                visible: affiche,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (hide == true) {
                        hide = false;
                      } else {
                        hide = true;
                      }
                    });
                  },
                  child: Container(
                    width: 110,
                    height: 40,
                    color: Color.fromARGB(255, 2, 62, 138),
                    child: Center(
                        child: Text(
                      "غياب غير مبرر",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Visibility(
                visible: hide,
                child: justification == null
                    ? Container()
                    : Container(
                        height: 400,
                        width: 300,
                        margin: EdgeInsets.only(
                            top: 100, left: 20, right: 20, bottom: 90),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: SizedBox()),
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "برر الغياب",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(child: SizedBox()),
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: InkWell(
                                        onTap: (() {
                                          _pickImages();
                                          print("Tapped");
                                        }),
                                        child: Text(
                                          "إختر ملف لتبرير الغياب",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )))
                              ],
                            ),
                            Visibility(
                              visible: images.isNotEmpty,
                              child: _buildGridView(),
                            ),
                            Row(
                              children: [
                                Expanded(child: SizedBox()),
                                Container(
                                    child: Text(
                                  "ملاحظات",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ))
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                  controller: remarquesController,
                                  decoration: InputDecoration(
                                    // labelText: Languages.of(context).full_name,
                                    // hintText: Languages.of(context).full_name,
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          top: 0), // add padding to adjust icon
                                      // child: Icon(Icons.badge),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 2, 62, 138))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: (() {
                                  _submit();
                                }),
                                child: Text("Submit"))
                          ],
                        ),
                      ),
              ),
              Visibility(
                  visible: !affiche,
                  child: Container(
                      margin: EdgeInsets.only(top: 150),
                      child: Text("لا تبرير يوجد",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))))
            ]),
          ),
          onRefresh: () {
            return Future<void>.delayed(const Duration(seconds: 2));
          },
        ));
  }

  _pickImages() async {
    List<XFile>? res = await _picker.pickMultiImage();
    if (res == null) {
    } else {
      setState(() {
        images.addAll(res);
      });
    }
  }

  Widget _buildGridView() {
    return Container(
        height: 150,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: GridView.count(
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1,
          children: List.generate(images.length, (index) {
            File image = File(images[index].path);
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: <Widget>[
                  Image.file(
                    image,
                    width: 300,
                    height: 300,
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: InkWell(
                      child: Icon(
                        Icons.remove_circle,
                        size: 30,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          images.removeAt(index);
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }

  justification_get() async {
    var response = await Api().getData('/justification/214');
    if (response.statusCode == 200) {
      Future.delayed(Duration(milliseconds: 10)).then((_) {
        setState(() {
          final body = jsonDecode(response.body);
          justification = body;

          print("HHHHHHHHHH" + justification.toString());
          affiche = true;
        });
      });
    } else {
      affiche = false;
    }
  }

  void _submit() async {
    // setState(() {
    //   _isLoading = true;
    // });
    var data = new Map<String, String>();
    data['remar'] = remarquesController.text;
    data['id'] = justification['justification']['id'].toString();

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? id = await pref.getString('id');
    if (id != null && id.length > 0) {
      id = id.substring(1, id.length - 1);
      print(id);

      var response =
          await Api().postDataWithImages(data, '/test/' + id, images);
      //var response = await Api().postData(data, '/offer');

      if (response.statusCode == 200) {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Sent"),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                // Some code to undo the change!
              },
            ),
          ));

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => switching_page()));
        });
        // Navigator.pop(context);

      } else {
        // _showMsg('Error ${response.statusCode}');
      }
    }

    _showMsg(msg) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Some code to undo the change!
          },
        ),
      ));
    }
  }
}
