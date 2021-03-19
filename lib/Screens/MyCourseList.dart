import 'package:flutter/material.dart';
import 'package:lms/CustomText.dart';
class MyCourseList extends StatefulWidget {
  @override
  _MyCourseListState createState() => _MyCourseListState();
}

class _MyCourseListState extends State<MyCourseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Course"),),
      body:  SingleChildScrollView(
        child: Container(
         // height: 300,
          // color: Colors.orange,
          // margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: ListView.builder(
             // scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount:5,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 7,
                        offset: Offset(2,3),
                      ),
                      ]
                  ),
                  height: 78,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    children: [
                      Container(
                          height: 78,
                          width: 88,
                          child: Image.asset("images/fcimg.png",fit: BoxFit.fill,)),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width-136,
                              child: PopularPostTitle(""),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width-136,
                               child: courseTPublisher(""),
                            )

                          ],
                        ),
                      ),


                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
