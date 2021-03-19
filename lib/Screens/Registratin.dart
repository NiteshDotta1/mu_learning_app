import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lms/Screens/RegistrationStudent.dart';
class UserRegistration extends StatefulWidget {
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {


  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController password = TextEditingController();

  bool   _isLoading = false;
  Future addUser() async {
    setState(() {
      _isLoading = true;
    });

    var postUri = Uri.parse("http://course.appstic.xyz/signup");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['name'] =name.text;
    request.fields['email'] =email.text;
    request.fields['type'] ='teacher';
    request.fields['phone'] =phone.text;
    request.fields['post_code'] =zipcode.text;
    request.fields['city'] =city.text;
    request.fields['password'] =password.text;




    request.send().then((result) async {

      http.Response.fromStream(result)
          .then((response) {

        if (response.statusCode == 200)
        {
          print("Uploaded! ");
          print('response.body '+response.body);
          var data = json.decode(response.body);
          var message = data['message'];
          print(message);
          if(data['status']=="SUCCESS"){
            Navigator.pop(context);
          }

        }
        else{

        }

        return response.body;

      });
    }).catchError((err) => print('error : '+err.toString()))
        .whenComplete(()
    {});
    setState(() {
      _isLoading = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 58,),
              height: 70,
              width: 70,
              child:  Image.asset('images/signin_img.png'),),
            Container(
                margin: EdgeInsets.only(top: 30,bottom: 30),
                child: Text("Sign UP As a Teacher",style: TextStyle(color: Color(0xff303B58),fontSize: 24))),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                  ),
                  hintText: 'Enter Your Name',
                  hintStyle: TextStyle(color: Color(0xff8E99B7)),
                  suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                  ),
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(color: Color(0xff8E99B7)),
                  suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                controller: phone,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                  ),
                  hintText: 'Enter Your Phone',
                  hintStyle: TextStyle(color: Color(0xff8E99B7)),
                  suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                controller: zipcode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                  ),
                  hintText: 'Enter Your ZipCode',
                  hintStyle: TextStyle(color: Color(0xff8E99B7)),
                  suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                controller: city,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                  ),
                  hintText: 'Enter Your City Name',
                  hintStyle: TextStyle(color: Color(0xff8E99B7)),
                  suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),

                  ),


                  hintText: 'Password',
                  hintStyle: TextStyle(color: Color(0xff8E99B7)),
                  suffixIcon: Icon(Icons.lock,size: 24,color: Color.fromRGBO(142,153,183, 0.5),),

                ),
              ),
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30),
                height: 46,
                width: 98,
                decoration: BoxDecoration(
                  color: Color(0xff8555F9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text("Sign UP",style: TextStyle(fontSize: 15,color: Colors.white),),
              ),
              onTap: (){
                addUser();
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: GestureDetector(child: Text("Registration As a Student"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentRegistration(),));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
