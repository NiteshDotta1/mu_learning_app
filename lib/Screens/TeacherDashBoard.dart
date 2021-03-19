import 'package:flutter/material.dart';
import 'package:lms/Screens/ChangePassword.dart';
import 'package:lms/Screens/CreateCourse.dart';
import 'package:lms/Screens/CustomWidget.dart';
import 'package:lms/Screens/EditProfile.dart';
import 'package:lms/Screens/Home.dart';
import 'package:lms/Screens/TeachersCourse.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TeacherDashBoard extends StatefulWidget {
  @override
  _TeacherDashBoardState createState() => _TeacherDashBoardState();
}

class _TeacherDashBoardState extends State<TeacherDashBoard> {
  Widget customDrawer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text('Account',style: TextStyle(fontSize: 17),)),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20),
                height: 70,
                width: 70,
                child: Image.asset('images/fcimg.png')),

            Column(children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 8),
                  child: Text("",style: TextStyle(fontSize: 16),)),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Have a Good Day !",style: TextStyle(fontSize: 13,color: Color(0xff8E99B7)),)),
            ],)

          ],
        ),

        GestureDetector(
          child: drawerListItem("images/icon_person.svg","   Edit profile"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
          },
        ),
        GestureDetector(
          child: drawerListItem("images/icon_key.svg","   Change Password"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(),));
          },
        ),
        GestureDetector(
          child: drawerListItem("images/icon_signout.svg","   Sign Out"),
          onTap: () async {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
            await signOUT();
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(0),));

          },
        )
      ],
    ) ;
  }
  String nameKey = "userType";

  Future<void> signOUT() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(nameKey, "0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: customDrawer(),
      ),
      appBar: AppBar(title: Text("Teacher DashBoard"),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

          GestureDetector(  child: Container(
        alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 30),
          height: 46,
        //  width: 98,
          decoration: BoxDecoration(
            color: Color(0xff8555F9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text("Create Course",style: TextStyle(fontSize: 15,color: Colors.white),),
        ),onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCourse(),));
          },),

            GestureDetector(  child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 30),
              height: 46,
              //  width: 98,
              decoration: BoxDecoration(
                color: Color(0xff8555F9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("Course List",style: TextStyle(fontSize: 15,color: Colors.white),),
            ),onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => TeachersCourse(),));
            },),

        ],),
      ),
    );
  }
}
