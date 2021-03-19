import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/CustomText.dart';

class EnrollCourse extends StatefulWidget {
  _EnrollCourseState createState() => _EnrollCourseState();
  String amount;
  EnrollCourse(this.amount);
}

class _EnrollCourseState extends State<EnrollCourse> {
  double width;
  double percentageWidth;
  double height;
  double percentageHeight;
  bool isReview = false;
  bool isCurriculum = true;
  bool isFiles = false;
  bool isQA = false;
  bool isReply = true;
  int listviewCounter = 3;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    percentageWidth = width / 100;
    height = MediaQuery.of(context).size.height;
    percentageHeight = height / 100;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView (
        child: Column(
            children: [
              Container(
                height: percentageHeight * 38.6,
                width: percentageWidth * 100,
                padding: EdgeInsets.all(0),
                color: Color(0xFF260B67),
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
                      width: percentageWidth * 100,
                      height: percentageHeight * 7,
                      padding: EdgeInsets.fromLTRB(30.28, 0, 92.28, 0),
                      child: courseDescriptionTitle("App development beginner guide"),
                    ),
                    SizedBox(height: percentageHeight * 1,),
                    Container(
                      width: percentageWidth * 100,
                      height: percentageHeight * 2,
                      padding: EdgeInsets.fromLTRB(30.28, 0, 30.28, 0),
                      child: courseDescriptionPublisher("Jon Smith"),
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
                          // decoration: BoxDecoration(
                          //   shape: BoxShape.circle,
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: Color(0xFFFFFFFF).withOpacity(.2),
                          //       // blurRadius: 4,
                          //       // offset: Offset(3,3),
                          //     ),
                          //   ]
                          // ),
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
                                Icon(Icons.access_time,color: Color(0xff8555F9),size: 14,),
                                courseStructure("23 Hours"),
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
                                Icon(Icons.insert_chart_sharp,color: Color(0xff8555F9),size: 14,),
                                courseStructure("Beginner"),
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
                                courseStructure("18500"),
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
                        width: percentageWidth * 33.3,
                        decoration: BoxDecoration(
                          color: isCurriculum ? Color(0xff8555F9) : Color(0xFFffffff),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        padding: EdgeInsets.all(0),
                        child: Center(
                            child: Text("Curriculum",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: isCurriculum ? Color(0xFFffffff) : Color(0xff303B58), fontFamily: 'Avenir Next'))
                        )
                    ),
                    onTap: (){
                      setState(() {
                        if(!isCurriculum){
                          isCurriculum = true;
                          isFiles = false;
                          isQA = false;
                        }else{
                          isCurriculum = false;
                        }
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                        height: percentageHeight * 7,
                        width: percentageWidth * 33.33,
                        decoration: BoxDecoration(
                          color: isFiles ? Color(0xff8555F9) : Color(0xFFffffff),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        padding: EdgeInsets.all(0),
                        child: Center(child: Text("Files",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: isFiles ? Color(0xFFffffff) : Color(0xff303B58), fontFamily: 'Avenir Next')),)
                    ),
                    onTap: (){
                      setState(() {
                        if(!isFiles){
                          isFiles = true;
                          isCurriculum = false;
                          isQA = false;
                        }else{
                          isFiles = false;
                        }
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                        height: percentageHeight * 7,
                        width: percentageWidth * 33.33,
                        decoration: BoxDecoration(
                          color: isQA ? Color(0xff8555F9) : Color(0xFFffffff),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        padding: EdgeInsets.all(0),
                        child: Center(child: Text("Q/A",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: isQA ? Color(0xFFffffff) : Color(0xff303B58), fontFamily: 'Avenir Next')),)
                    ),
                    onTap: (){
                      setState(() {
                        if(!isQA){
                          isQA = true;
                          isCurriculum = false;
                          isFiles = false;
                        }else{
                          isQA = false;
                        }
                      });
                    },
                  )
                ],
              ),
              isCurriculum ? Container(
                width: percentageWidth * 100,
                height: percentageHeight * 54.4,
                child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    itemCount: listviewCounter,
                    itemBuilder: (BuildContext context,int index){
                      // return Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   margin: EdgeInsets.only(left: percentageWidth * 12.07,bottom: 0,top: percentageHeight * 1.30,right: percentageWidth * 12.07),
                      //   decoration: BoxDecoration(
                      //     color: Color(0xFFFFFFFF),
                      //     borderRadius: BorderRadius.circular(0),
                      //     // boxShadow: [
                      //     //   BoxShadow(
                      //     //     color: Color(0xffF2F6FF).withOpacity(.3),
                      //     //     blurRadius: 1,
                      //     //     offset: Offset(3,3),
                      //     //   ),
                      //     // ]
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Icon(Icons.play_circle_outline_sharp,size: 16, color: Color(0xFF8555F9),),
                      //       SizedBox(width: 8,),
                      //       Text("01. Free lesson",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xff303B58),fontFamily: 'Font Awesome 5 Free')),
                      //     ],
                      //   )
                      // );
                      return Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: percentageWidth * 5.3,bottom: percentageHeight * 1.27,top: percentageHeight * 3.92,right: percentageWidth * 5.3),
                              padding: EdgeInsets.only(bottom: percentageHeight * 1.27),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffF2F6FF).withOpacity(.3),
                                      blurRadius: 1,
                                      offset: Offset(3,3),
                                    ),
                                  ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("01. Free lesson",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff303B58),fontFamily: 'AvenirNext')),
                                  Text("30 min",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff8E99B7),fontFamily: 'AvenirNext'))

                                ],
                              )
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height : percentageHeight * 2,
                              margin: EdgeInsets.only(left: percentageWidth * 12.07,bottom: 0,top: percentageHeight * 1.30,right: percentageWidth * 12.07),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.play_circle_outline_sharp,size: 16, color: Color(0xFF8555F9),),
                                  SizedBox(width: 8,),
                                  Text("Developing authentic",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xff303B58),fontFamily: 'Font Awesome 5 Free')),
                                ],
                              )
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height : percentageHeight * 2,
                              margin: EdgeInsets.only(left: percentageWidth * 12.07,bottom: 0,top: percentageHeight * 2.30,right: percentageWidth * 12.07),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.play_circle_outline_sharp,size: 16, color: Color(0xFF8555F9),),
                                  SizedBox(width: 8,),
                                  Text("Developing authentic",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xff303B58),fontFamily: 'Font Awesome 5 Free')),
                                ],
                              )
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height : percentageHeight * 2,
                              margin: EdgeInsets.only(left: percentageWidth * 12.07,bottom: 0,top: percentageHeight * 2.30,right: percentageWidth * 12.07),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.play_circle_outline_sharp,size: 16, color: Color(0xFF8555F9),),
                                  SizedBox(width: 8,),
                                  Text("Developing authentic",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xff303B58),fontFamily: 'Font Awesome 5 Free')),
                                ],
                              )
                          )
                        ],
                      );
                    }
                ),
              ) : Container(),
              isFiles ? Container(
                width: percentageWidth * 100,
                height: percentageHeight * 54.4,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: percentageHeight * 3.9),
                    scrollDirection: Axis.vertical,
                    itemCount: listviewCounter,
                    itemBuilder: (BuildContext context,int index){
                      return Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: percentageWidth * 5.3,bottom: percentageHeight * 2.6,right: percentageWidth * 5.3),
                              padding: EdgeInsets.only(bottom: percentageHeight * 1.27),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffF2F6FF).withOpacity(.3),
                                      blurRadius: 1,
                                      offset: Offset(3,3),
                                    ),
                                  ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.upload_file,size: 16, color: Color(0xFF8555F9),),
                                  SizedBox(width: 8,),
                                  Text("Developing authentic.pdf",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Color(0xff303B58),fontFamily: 'Font Awesome 5 Free')),
                                ],
                              )
                          ),
                        ],
                      );
                    }
                ),
              ) : Container(),
              isQA ? Container(
                width: percentageWidth * 100,
                height: percentageHeight * 44.73,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: percentageHeight * 3.9,left: percentageWidth * 7.8),
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (BuildContext context,int index){
                      return Column(
                        children: [
                          Row(
                            children: [
                              // SizedBox(width: percentageWidth * 2.7,),
                              CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Color(0xFFD7598F),
                                  child : ClipRRect(
                                    child: Image.asset("images/demo_img.png"),
                                    borderRadius: BorderRadius.circular(20.0),
                                  )
                              ),
                              SizedBox(width: percentageWidth * 2.7),
                              cartTotal("Hello Kally"),
                              SizedBox( width: percentageWidth * 3),
                              Container(
                                width: percentageWidth * 40,
                                height: percentageHeight * 2,
                                child: Text("12.40am, 21 June",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 11,color: Color(0xFF8E99B7),fontStyle : FontStyle.normal,fontFamily: 'Font Awesome 5 Free',)),
                              ),
                            ],
                          ),
                          Container(
                            width: percentageWidth*100,
                            height: percentageHeight*7,
                            padding: EdgeInsets.fromLTRB(percentageWidth * 12.9, 0, percentageWidth * 8, 0),
                            // color : Colors.red,
                            child: courseStructure("Learn about internal and external PC hardware options to support intelligent decisions regarding."),
                          ),
                          Container(
                              width: percentageWidth*100,
                              height: percentageHeight*6,
                              padding: EdgeInsets.fromLTRB(percentageWidth * 12.9, 0, percentageWidth * 8, percentageHeight * 3.6),
                              // color : Colors.red,
                              child: Row(
                                children: [
                                  Icon(Icons.reply,color: Color(0xFF5786FF),size: 14,),
                                  SizedBox(width: 8,height: percentageHeight * 1.83,),
                                  Text("Reply",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xFF5786FF),fontStyle : FontStyle.normal,fontFamily: 'Font Awesome 5 Free',)),
                                ],
                              )
                          ),
                          isReply ? Container(
                            width: percentageWidth * 100,
                            height: percentageHeight * 18.6,
                            padding: EdgeInsets.only(left: percentageWidth * 15.6),
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
                                    SizedBox(width: percentageWidth * 2.7),
                                    cartTotal("Hello Kally"),
                                    SizedBox( width: percentageWidth * 3),
                                    Container(
                                      width: percentageWidth * 40,
                                      height: percentageHeight * 2,
                                      child: Text("12.40am, 21 June",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 11,color: Color(0xFF8E99B7),fontStyle : FontStyle.normal,fontFamily: 'Font Awesome 5 Free',)),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: percentageWidth*100,
                                  height: percentageHeight*7,
                                  padding: EdgeInsets.fromLTRB(percentageWidth * 12.9, 0, percentageWidth * 8, 0),
                                  // color : Colors.red,
                                  child: courseStructure("Learn about internal and external PC hardware options to support intelligent decisions regarding."),
                                ),
                                Container(
                                    width: percentageWidth*100,
                                    height: percentageHeight*6,
                                    padding: EdgeInsets.fromLTRB(percentageWidth * 12.9, 0, percentageWidth * 8, percentageHeight * 3.6),
                                    // color : Colors.red,
                                    child: Row(
                                      children: [
                                        Icon(Icons.reply,color: Color(0xFF5786FF),size: 14,),
                                        SizedBox(width: 8,height: percentageHeight * 1.83,),
                                        Text("Reply",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xFF5786FF),fontStyle : FontStyle.normal,fontFamily: 'Font Awesome 5 Free',)),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ) : Container(),
                        ],
                      );
                    }
                ),
              ) : Container(),
              isQA ? Container(
                width: percentageWidth * 100,
                height: percentageHeight * 9.67,
                padding: EdgeInsets.only(left: percentageWidth * 7.8),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Color(0xFFD7598F),
                        child : ClipRRect(
                          child: Image.asset("images/demo_img.png"),
                          borderRadius: BorderRadius.circular(20.0),
                        )
                    ),
                    SizedBox(width: percentageWidth * 2.13),
                    Container(
                      width: percentageWidth * 60,
                      height: percentageHeight * 4.96,
                      // color: Color(0xffF2F6FF),
                      decoration: BoxDecoration(
                        color: Color(0xffF2F6FF),
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: TextField(
                        // maxLines: 3,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15, top: 3, bottom: 3),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(19),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(142, 153, 183, 0.4), width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(142, 153, 183, 0.4), width: 1.0),
                          ),
                          hintText: 'Add reply',
                          hintStyle: TextStyle(
                              color: Color(0xff8E99B7), fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(width: percentageWidth * 1.6),
                    Container(
                      width: percentageWidth * 18,
                      height: percentageHeight * 9.67,
                      padding: EdgeInsets.only(right: percentageWidth * 7.8),
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
              ) : Container(),
            ]
        ),
      )
    );
  }

}
