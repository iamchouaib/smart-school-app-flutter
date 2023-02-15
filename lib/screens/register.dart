

import 'dart:convert';

import 'package:chouaibe/header_widget.dart';
import 'package:chouaibe/model/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';



class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  
  bool checkedValue = false;
  bool checkboxValue = false;
  late XFile photo;
  late File image_show;
  double a = 5;
  bool _passwordVisible=false;
  List<bool> _selection =[true,false];
  bool image_registre_bool = false;
  late File image_register;
  late String name_image;
  var emailController= TextEditingController();
  var namecontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var companyController= TextEditingController();
  var phoneController= TextEditingController();
  var adresseController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [

            Container(
              height: 200,
              child: HeaderWidget(200,false),
            ),

            Container(
              
              margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: 
           
                   Column(
                      children: [
              
                            SizedBox(height: 20,),

                            Text(
                      "Smart school",
                      // style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 230, 233, 238).withOpacity(1),),
                    ),


                        SizedBox(height: 30,),
                        

                        

                        Container(
             
              child: Center(
                child: Container(
                  
                 
                  child: SvgPicture.asset('assets/illustration.svg'),
                
                )
                  //Icon(
                  //   _icon,                   /*    CHANGE  ICON      */
                  //   color: Colors.white,
                  //   size: 40.0,
                  // ),
                ),
              ),


                      SizedBox(height: 20,),
                        Container(                         
                              child:
                             
                               TextField(
                                controller: namecontroller,
                                decoration: 
                              InputDecoration(
                              labelText: "Full name",
                              hintText: "Full name",
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                              child: Icon(Icons.badge),
                              ),
                                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                )
                              ),
                              
                              decoration:BoxDecoration(
                                boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),
                      
                        SizedBox(height: 15.0),
                        
                            Container(
                              child:
                          
                               TextField(
                                controller: emailController,
                                decoration: 
                              InputDecoration(
                              labelText: "Email",
                              hintText: "Email@gmail.com",
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                              child: Icon(Icons.email),
                              ),
                                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                )
                              ),
                              
                              decoration:BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),

                        SizedBox(height: 15.0),
                          Container(
                              child:
                             
                               TextField(
                                  keyboardType: TextInputType.phone,
                                controller: phoneController,
                                decoration: 
                              InputDecoration(
                              labelText: "Phone number",
                              hintText: "Phone number",
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                              child: Icon(Icons.phone),
                              ),
                                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                )
                              ),
                              
                              decoration:BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),
SizedBox(height: 15,),
                       

                                                    Container(
                              child: TextField(
                                 obscureText: !_passwordVisible,
                                controller: passwordcontroller,
                                decoration:
                               
                              InputDecoration(
                                 
                              labelText: "Password",
                              hintText: "Password",
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                            child: Icon(Icons.key),
                            ),
                             suffixIcon: IconButton(
                             icon: Icon(            
                           _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                         color:  _passwordVisible
                         ? Theme.of(context).primaryColorDark
                         : Colors.grey               
               ),
            onPressed: () {
              
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),
                              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              )
                              ),
                              decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
                            ),
                     SizedBox(height: 15,),

                   
                   

                    
   

                           
                        SizedBox(height: 30.0),
                        Container(
                          decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 62, 138),
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                                          ],
                                  borderRadius: BorderRadius.circular(5), 
                              ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 62, 138)),),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "register".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              _submit();
                            },
                          ),
                        ),
                        
                        
                
                   
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }













   void _submit() async {

    if(emailController.text.isEmpty || passwordcontroller.text.isEmpty || namecontroller.text.isEmpty){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please put all the informations")));
    }else{
   
       var data = {'email': emailController.text, 'password': passwordcontroller.text, 'name':namecontroller.text};

        if (_selection[1]==true){
      data['agence']=1.toString();
         
       if(companyController.text.isEmpty || passwordcontroller.text.isEmpty || namecontroller.text.isEmpty){
       
       }
    



    }

    
    
    

    if(photo!=null){
      var response = await Api().postDataWithImage(data,'/register', photo.path);
      if (response.statusCode == 201){
      final body = jsonDecode(response.body);
       print(body);
       print(response.statusCode.toString());
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enregistrer : ${body['user']['email']}")));
    }
    }else{
        var response = await Api().postData(data,'/register');

        if (response.statusCode == 201){
      final body = jsonDecode(response.body);
    
       print(body);
       print(response.statusCode.toString());
    
    }
    }
      
   

    }

   }

}