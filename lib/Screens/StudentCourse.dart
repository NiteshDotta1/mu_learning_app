import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/CustomText.dart';
import 'package:lms/Model/AllCourseModel.dart';
import 'package:lms/Screens/CartList.dart';
import 'package:lms/Screens/ChangePassword.dart';
import 'package:lms/Screens/CourseDescription.dart';
import 'package:lms/Screens/CustomWidget.dart';
import 'package:lms/Screens/EditProfile.dart';
import 'package:lms/Screens/Home.dart';
import 'package:lms/Screens/PopupScreen.dart';
import 'package:http/http.dart' as http;

class StudentCourse extends StatefulWidget {
  _AllCoursesState createState() => _AllCoursesState();
String stdID;
StudentCourse(this.stdID);
}

class _AllCoursesState extends State<StudentCourse> {

  bool isFilterDrawer = false;
  double width;
  double percentageWidth;
  double height;
  double percentageHeight;
  int _selectedIndex = 3;
  bool isLoading = true;

  List<Color> colorsList = [
    Colors.blue,
    Colors.indigo,
    Colors.purpleAccent,
    Colors.orange
  ];



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  List<AllCourse> allCourseList = List();
  Future getAllCourseList() async {
    final responce = await http.get("http://course.appstic.xyz/getcourse/"+widget.stdID);
    print(responce.body);
    var data = json.decode(responce.body);
    print(data);



    for(var note in data){
      allCourseList.add(AllCourse.fromJson(note));
    }
    setState(() {
      print("loading false");
      isLoading = false;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCourseList();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    percentageWidth = width / 100;
    height = MediaQuery.of(context).size.height;
    percentageHeight = height / 100;
    return Scaffold(
    //  appBar: AppBar(title: Text("My Course"),),


        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20,bottom: 10,top: 40),
                  height: 22,
                  width: MediaQuery.of(context).size.width,
                  alignment:  Alignment.centerLeft,
                  child: Image.asset('images/infix.png')
                // child: Text("MU Learn",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black,fontFamily: 'AvenirNext',),textAlign: TextAlign.left,),

              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20,bottom: 10,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texth1("My Courses"),
                    ],
                  )
              ),
              isLoading ? CircularProgressIndicator(): Container(
                height: percentageHeight * 70,
                // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: allCourseList.length,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    itemBuilder: (BuildContext context,int index){
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: Offset(2,3),
                                ),
                              ]
                          ),


                          margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                          child: Column(
                            children: [
                              Container(
                                  width: percentageWidth * 42,
                                  height: percentageHeight * 14,
                                  // margin: EdgeInsets.only(left: 15),
                                  child:allCourseList[index].image== null ? Image.asset('images/fcimg.png',fit: BoxFit.fill,): Image.network('http://course.appstic.xyz/storage/uploads/courses/'+
                                      allCourseList[index].image,fit: BoxFit.fill,)),
                              Container(
                                  width: percentageWidth * 42,

                                  padding: EdgeInsets.only(left: 10,top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.only(top: 5),
                                        width: percentageWidth * 45,
                                        // height: percentageHeight * 2,
                                        child: courseTitle(allCourseList[index].name),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          width: percentageWidth * 45,
                                          // height: percentageHeight * 2,
                                          child: courseTPublisher(allCourseList[index].teacher.name)
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),



                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDescription(allCourseList[index].id.toString()),));
                        },
                      );
                    }
                ),
              ),

            ],
          ),
        )
    );
  }


}
