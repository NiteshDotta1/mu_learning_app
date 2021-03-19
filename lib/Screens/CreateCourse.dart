import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CreateCourse extends StatefulWidget {
  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {

  File galaryFile;

  selectImgFromGalary() async{
    File tempFile  =await ImagePicker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    setState(() {
      galaryFile = tempFile;
    });
  }

  TextEditingController course_name = TextEditingController();
  TextEditingController totalClass = TextEditingController();
  TextEditingController coursefee = TextEditingController();
  TextEditingController details = TextEditingController();

  Future createCourse() async {
    setState(() {
     // _isLoading = true;
    });

    var postUri = Uri.parse("http://course.appstic.xyz/addcourse");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['name'] =course_name.text;
    request.fields['teacher_id'] ='1';
    request.fields['total_class'] =totalClass.text;
    request.fields['fee'] =coursefee.text;
    request.fields['status'] ='Active';
    request.fields['details'] =details.text;
    request.fields['access_token']='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZW1vLm9yZyIsImF1ZCI6IjAxNzM3OTYzODkzIiwidXNlcl9pZCI6MiwidXNlcl90eXBlIjoidGVhY2hlciIsImlhdCI6MTYxNTQ1NDE5MiwiZXhwIjoxNjQ3MDExMTQ0fQ.TAorRPsEtxBBcIl-BKFI74DE0JHYKkdHY6FnqMWiLzc';
    request.fields['cat_id'] ='2';
    if( galaryFile != null){
      print('Not null from galary file ');
      http.MultipartFile multipartFile =
      await http.MultipartFile.fromPath('image', galaryFile.path);
      request.files.add(multipartFile);
    }else{
      print('elase null');
    }




    request.send().then((result) async {

      http.Response.fromStream(result)
          .then((response) {
            print(response.statusCode.toString()+" Status code");

        if (response.statusCode == 200)
        {
          print("Uploaded! ");
          print('response.body '+response.body);
          var data = json.decode(response.body);
          var message = data['message'];
          print(message);

          if(data['status']=="SUCCESS")
{
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
      //_isLoading = false;
    });

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child:  Column(
        children: [

          Container(
              margin: EdgeInsets.only(top: 30,bottom: 30),
              child: Text("Create New Course",style: TextStyle(color: Color(0xff303B58),fontSize: 24))),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: course_name,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                ),
                hintText: 'Enter Course Title',
                hintStyle: TextStyle(color: Color(0xff8E99B7)),
                suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: totalClass,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                ),
                hintText: 'Total Class',
                hintStyle: TextStyle(color: Color(0xff8E99B7)),
                suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: coursefee,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                ),
                hintText: 'Course Fee',
                hintStyle: TextStyle(color: Color(0xff8E99B7)),
                suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: details,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
                ),
                hintText: 'Course Details',
                hintStyle: TextStyle(color: Color(0xff8E99B7)),
                suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              selectImgFromGalary();
            },
            child: galaryFile !=null ?  Container(
              height: 100,
              width: 100,
              child: Image.file(galaryFile),
            ) : Container(
              height: 100,
              width: 100,
              child: Icon(Icons.image,size: 30,),
            ),
          ),


          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(3),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              height: 46,
              width: 120,
              decoration: BoxDecoration(
                color: Color(0xff8555F9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("Create Course",style: TextStyle(fontSize: 15,color: Colors.white),),
            ),
            onTap: (){
              createCourse();
            },
          )
        ],
      )
    ),
    );
  }
}
