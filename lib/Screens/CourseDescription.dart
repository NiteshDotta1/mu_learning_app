import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/CustomText.dart';
import 'package:lms/Screens/EnrollCourse.dart';
import 'package:lms/Screens/PaymentScreen.dart';
import 'package:lms/Screens/PopupScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class CourseDescription extends StatefulWidget {
  _CourseDescriptionState createState() => _CourseDescriptionState();
String courseID ;
String UserID;
CourseDescription(this.courseID,);
}

class _CourseDescriptionState extends State<CourseDescription> {

  double width;
  double percentageWidth;
  double height;
  double percentageHeight;
  bool isReview = false;
  bool isSignIn = true;
  bool isLoadingCourse = true;
  var data ;
  Future getAllCourseList() async {
    final responce = await http.get("http://course.appstic.xyz/getcourse/"+widget.courseID);
    print(responce.body);
    data = json.decode(responce.body);
    print(data);


    print("OPKkkk");

    setState(() {
      isLoadingCourse = false;
    });

  }

  String userID;
  String nameKey = "userid";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCourseList();
    getUserID();
  }


  Future<String> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userID= await prefs.getString(nameKey) ;
  }




  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    percentageWidth = width / 100;
    height = MediaQuery.of(context).size.height;
    percentageHeight = height / 100;
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoadingCourse ? Center(child: CircularProgressIndicator()) : Column(
        children: [
          Container(

            decoration: BoxDecoration(
              color: Color(0xFF260B67),
              // image: DecorationImage(
              //   image: NetworkImage("http://course.appstic.xyz/storage/uploads/courses/"+data[0]['image']),
              //   fit: BoxFit.cover,
              // ), 
            ),
            height: percentageHeight * 38.6,
            width: percentageWidth * 100,
            padding: EdgeInsets.all(0),

            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: percentageHeight * 3.7,
                  width: percentageWidth * 100,
                  color: Color(0xFFffffff),
                ),
                SizedBox(height: percentageHeight * 1,),
                Container(
                  height: percentageHeight * 5,
                  width: percentageWidth * 100,
                  // color: Color(0xFFffffaa),
                  padding: EdgeInsets.fromLTRB(30.28, 0, 30.28, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          child: Icon(Icons.arrow_back_outlined,color: Colors.white,),
                          onTap: (){
                            Navigator.of(context).pop(true);
                          }
                      ),
                      Text("Back",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(height: percentageHeight * 2,),
                Container(
               //  color:   Color(0xFF260B67),
                    width: percentageWidth * 100,
                  height: percentageHeight * 7,
                  padding: EdgeInsets.fromLTRB(30.28, 0, 92.28, 0),
                  child: courseDescriptionTitle(data[0]['name']),
                ),
                SizedBox(height: percentageHeight * 1,),
                Container(
                  width: percentageWidth * 100,
                  height: percentageHeight * 2,
                  padding: EdgeInsets.fromLTRB(30.28, 0, 30.28, 0),
                  child: courseDescriptionPublisher(data[0]['teacher']
                  ['name']),
                ),
                SizedBox(height: percentageHeight * 1,),
                Row(
                  children: [
                    Container(
                      width: percentageWidth * 60,
                      height: percentageHeight * 6,
                      child: Column(
                        children: [
                          Container(
                              width: percentageWidth * 60,
                              height: percentageHeight * 2,
                              padding: EdgeInsets.fromLTRB(30.28, 0, 30.28, 0),
                              child: Row(
                                children: [
                                  Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                  Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                  Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                  Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                  Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                ],
                              )
                          ),
                          SizedBox(height: percentageHeight * 1,),
                          Container(
                            width: percentageWidth * 60,
                            height: percentageHeight * 2,
                            padding: EdgeInsets.fromLTRB(30.28, 0, 30.28, 0),
                            child: courseDescriptionPublisher("(4.5) based on 20 review"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: percentageWidth * 40,
                      height: percentageHeight * 6,
                      padding: EdgeInsets.all(4),
                      // child: Image.asset("images/play_button.svg",fit: BoxFit.fill,),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Color(0xFFD7598F),
                        child : ClipRRect(
                          child: Icon(Icons.play_arrow,size: 22,color: Colors.white,),
                          borderRadius: BorderRadius.circular(20.0),
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(height: percentageHeight * 1.5,),
                Container(
                  width: percentageWidth * 100,
                  height: percentageHeight * 5,
                  padding: EdgeInsets.fromLTRB(30.28, 0, percentageWidth * 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: percentageWidth * 26,
                        height: percentageHeight * 5,
                        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            courseStructure(data[0]['total_class'].toString() +" Classes"),
                          ],
                        ),
                      ),
                      Container(
                        width: percentageWidth * 26,
                        height: percentageHeight * 5,
                        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.money,color: Color(0xff8555F9),size: 14,),
                            courseStructure(data[0]['fee'].toString()+"TK"),
                          ],
                        ),
                      ),
                      Container(
                        width: percentageWidth * 20,
                        height: percentageHeight * 5,
                        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.person_add_alt_1,color: Color(0xff8555F9),size: 14,),
                            courseStructure("150"),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  height: percentageHeight * 7,
                  width: percentageWidth * 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: EdgeInsets.all(0),
                  child: Center(
                    child: courseTitle("Description"),
                  )
                ),
                onTap: (){
                  setState(() {
                    isReview = false;
                  });
                },
              ),
              GestureDetector(
                child: Container(
                  height: percentageHeight * 7,
                  width: percentageWidth * 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F6FF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: EdgeInsets.all(0),
                  child: Center(child: courseTitle("Review"),)
                ),
                onTap: (){
                  setState(() {
                    isReview = true;
                  });
                },
              )
            ],
          ),
          isReview ? isSignIn ?
          SingleChildScrollView(
            child: Container(
              width: percentageWidth * 100,
              height: percentageHeight * 45,
              padding: EdgeInsets.fromLTRB(30.28, 15, 30.28, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      width: percentageWidth * 100,
                      height: percentageHeight * 6,
                      padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffF2F6FF),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cartTotal("Rate the course"),
                          Icon(Icons.add,color: Color(0xff8555F9),size: 15,)
                        ],
                      ),
                    ),
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   PopupLayout(
                      //     top: percentageHeight * 45.32,
                      //     left: 0,
                      //     right: 0,
                      //     bottom: 0,
                      //     child: PopupContent(
                      //       content: Scaffold(
                      //         body: Container(
                      //           width: percentageWidth* 100,
                      //           height: percentageHeight* 54.68,
                      //           decoration: BoxDecoration(
                      //             color: Colors.red,
                      //             shape: BoxShape.rectangle,
                      //             borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 color: Color(0xff303B58).withOpacity(0.6),
                      //                 blurRadius: 10,
                      //                 offset: Offset(2,2),
                      //               ),
                      //             ] ,
                      //           ),
                      //           // color: Color(0xFFFFFFFF),
                      //           child: SingleChildScrollView(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               children: <Widget>[
                      //                 Row(
                      //                   children: [
                      //                     Container(
                      //                       margin: EdgeInsets.only(left: 30.56),
                      //                       alignment: Alignment.centerLeft,
                      //                       width: 108,
                      //                       height: 22,
                      //                       child: Text('Filter Courses',style: TextStyle(fontSize: 17,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                      //                       color: Color(0xFF303B58)),textAlign: TextAlign.center,)
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ]
                      //             )
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // );
                      showModalBottomSheet(
                          context: context,
                          // backgroundColor: Color(0xff303a58).withOpacity(.6),
                          barrierColor: null,
                          builder: (context){
                            return Container(
                              width: percentageWidth* 100,
                              height: percentageHeight* 54.68,
                              color: Color(0xff737373),
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(topLeft: const Radius.circular(30), topRight: const Radius.circular(30)),
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Container(
                                            width: percentageWidth * 18.66,
                                            height: percentageHeight * 1,
                                            decoration: BoxDecoration(
                                                color: Color(0xffE5E5E5),
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.circular(4.5)
                                            ),
                                            // color: Color(0xffE5E5E5),
                                          ),
                                          onTap: (){

                                          },
                                        ),
                                        SizedBox(height: percentageHeight * 6.28,),
                                        Center(
                                          child: Text('Rate the course',style: TextStyle(fontSize: 24,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w500, color: Color(0xFF303B58)),textAlign: TextAlign.center,),
                                        ),
                                        SizedBox(height: percentageHeight * 3.0,),
                                        Center(
                                          child: Text('Your rating',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w500, color: Color(0xFF8E99B7)),textAlign: TextAlign.center,),
                                        ),
                                        SizedBox(height: 6,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star_border,color: Color(0xFFFFCF23),size: 31,),
                                            Icon(Icons.star_border,color: Color(0xFFFFCF23),size: 31,),
                                            Icon(Icons.star_border,color: Color(0xFFFFCF23),size: 31,),
                                            Icon(Icons.star_border,color: Color(0xFFFFCF23),size: 31,),
                                            Icon(Icons.star_border,color: Color(0xFFFFCF23),size: 31,),
                                          ],
                                        ),
                                        SizedBox(height: percentageHeight * 4.92,),
                                        Container(
                                          width: percentageWidth * 100,
                                          height: percentageHeight * 12.19,
                                          // padding: EdgeInsets.fromLTRB(percentageWidth*8, 0, percentageWidth*8, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Container(
                                                        height: percentageHeight * 6.19,
                                                        width: percentageWidth * 12,
                                                        color: Colors.white,
                                                        child: CircleAvatar(
                                                          radius: 25.0,
                                                          child : ClipRRect(
                                                            child: Image.asset("images/demo_img.png"),
                                                            borderRadius: BorderRadius.circular(25.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                              SizedBox(
                                                width: percentageWidth * 2,
                                              ),
                                              Container(
                                                height: percentageHeight * 12.19,
                                                width: percentageWidth * 75.22,
                                                // color: Color(0xffF2F6FF),
                                                decoration: BoxDecoration(
                                                  color: Color(0xffF2F6FF),
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: TextField(
                                                  maxLines: 6,
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.only(left: 15, top: 3, bottom: 3),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                      borderSide: BorderSide(
                                                          color: Color.fromRGBO(142, 153, 183, 0.4), width: 1.0),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                      borderSide: BorderSide(
                                                          color: Color.fromRGBO(142, 153, 183, 0.4), width: 1.0),
                                                    ),
                                                    hintText: 'Your Review',
                                                    hintStyle: TextStyle(
                                                        color: Color(0xff8E99B7), fontSize: 14,),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 12,),
                                        Container(
                                          width: percentageWidth * 50,
                                          height: percentageHeight * 5,
                                          padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8555F9),
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Text("Submit Review",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Color(0xffffffff),height: 1.3,fontFamily: 'AvenirNext'),textAlign: TextAlign.center,),
                                        ),
                                      ]
                                  )
                              ),
                            );
                          }
                      );
                    },
                  ),
                  Container(
                    width: percentageWidth * 100,
                    height: percentageHeight * 35.9,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (BuildContext context,int index){
                          return Container(
                            width: percentageWidth * 100,
                            height: percentageHeight * 13,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Color(0xFFD7598F),
                                        child : ClipRRect(
                                          child: Image.asset("images/demo_img.png"),
                                          borderRadius: BorderRadius.circular(20.0),
                                        )
                                    ),
                                    SizedBox(width: 9.85,),
                                    cartTotal("Hello Kally"),
                                    SizedBox(width: 14),
                                    Container(
                                        width: percentageWidth * 40,
                                        height: percentageHeight * 2,
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                            Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                            Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                            Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                            Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                                Container(
                                  width: percentageWidth*61,
                                  height: percentageHeight*6,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  // color : Colors.red,
                                  child: courseStructure("Learn about internal and external PC hardware options to support intelligent decisions regarding."),
                                )
                              ],
                            ),
                          );
                        }
                    ),
                  )
                ],
              ),
            ),
          ) :
          Container(
            width: percentageWidth * 100,
            height: percentageHeight * 45,
            padding: EdgeInsets.fromLTRB(10.28, 0, 30.28, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
            ),
            child : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  width: percentageWidth * 100,
                  height: percentageHeight * 14,
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Color(0xFFD7598F),
                            child : ClipRRect(
                              child: Image.asset("images/demo_img.png"),
                              borderRadius: BorderRadius.circular(20.0),
                            )
                          ),
                          SizedBox(width: 9.85,),
                          cartTotal("Hello Kally"),
                          SizedBox(width: 14),
                          Container(
                            width: percentageWidth * 40,
                            height: percentageHeight * 2,
                            child: Row(
                              children: [
                                Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                                Icon(Icons.star,color: Color(0xFFFFCF23),size: 13,),
                              ],
                            )
                          ),
                        ],
                      ),
                      Container(
                        width: percentageWidth*61,
                        height: percentageHeight*6,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        // color : Colors.red,
                        child: courseStructure("Learn about internal and external PC hardware options to support intelligent decisions regarding."),
                      )
                    ],
                  ),
                );
              }
            )
          ) :
          Container(
            width: percentageWidth * 100,
            height: percentageHeight * 45,
            padding: EdgeInsets.fromLTRB(30.28, 0, 30.28, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
            ),
            child : SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: percentageWidth * 100,
                  height: percentageHeight * 50,
                    padding: EdgeInsets.fromLTRB(0, percentageHeight * 3, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(data[0]['details'],style: TextStyle(fontSize: 16),),
                  ),
                  SizedBox(height: percentageHeight * 3,),

                  SizedBox(height: percentageHeight * 2,),
                ],
              ),
            ),
          ),

          isSignIn ? Container(
            width: percentageWidth * 100,
            height: percentageHeight * 9.4,
            padding: EdgeInsets.fromLTRB(percentageWidth * 10, 10, percentageWidth * 10, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: percentageWidth * 70,
                    height: percentageHeight * 5,
                    padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFF8555F9),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("Enroll the Course",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xffffffff),height: 1.3,fontFamily: 'AvenirNext'),textAlign: TextAlign.center,),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(data[0]['fee'].toString(),userID,data[0]['id'].toString(),)));
                  },
                )
              ],
            ),
          ) :
          Container(
            width: percentageWidth * 100,
            height: percentageHeight * 9.4,
            padding: EdgeInsets.fromLTRB(percentageWidth * 10, 10, percentageWidth * 10, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: percentageWidth * 35,
                  height: percentageHeight * 5,
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFD7598F),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Get Full Access",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xffffffff),height: 1.3,fontFamily: 'AvenirNext'),textAlign: TextAlign.center,),
                ),
                Container(
                  width: percentageWidth * 30,
                  height: percentageHeight * 5,
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFF8555F9),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Add to Cart",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xffffffff),height: 1.3,fontFamily: 'AvenirNext'),textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }

}
