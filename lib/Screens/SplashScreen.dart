
import 'package:flutter/material.dart';
import 'package:lms/Screens/Home.dart';
import 'package:lms/Screens/TeacherDashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String userType;
  Future<String> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userType=await prefs.getString('type');
    print(userType);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      userType =="teacher" ? Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TeacherDashBoard(),
        ),
      ) :
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(0),
        ),
      );

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => HomeScreen(0),
      //   ),
      // );
    });
  }

  @override
  void initState() {
    super.initState();
     getUserID();



  }

  @override
  Widget build(BuildContext context) {
    //  FlutterStatusbarcolor.dar(false);

    return Scaffold(
      backgroundColor: Color(0xffFFC700),
      body: Center(
        child: Container(
          child: Text("MU Learning App"),
        ),
      ),
    );
  }
}
