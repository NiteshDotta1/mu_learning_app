import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/CustomText.dart';
import 'package:lms/Screens/ChangePassword.dart';
import 'package:lms/Screens/CustomWidget.dart';
import 'package:lms/Screens/EditProfile.dart';
import 'package:lms/Screens/EnrollCourse.dart';
import 'package:lms/Screens/Home.dart';
import 'package:lms/Screens/PopupScreen.dart';
import 'package:lms/Screens/StudentCourse.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  _PaymentScreenState createState() => _PaymentScreenState();
  String amount;
  String stdID;
  String CourseID;
  PaymentScreen(this.amount,this.stdID,this.CourseID);
}

class _PaymentScreenState extends State<PaymentScreen> {

  bool isFilterDrawer = false;
  double width;
  double percentageWidth;
  double height;
  double percentageHeight;
  int _selectedIndex = 3;
  String coupon = "";
  bool isCouponAvailable = false;

  List<Color> colorsList = [
    Colors.blue,
    Colors.indigo,
    Colors.purpleAccent,
    Colors.orange
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index.toString());
      if (_selectedIndex==3){
        print("Calling 3");
        _openEndDrawer();
      }else if(_selectedIndex==2){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(2),));
      }else if(_selectedIndex==1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(1),));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(0),));
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // opendrawer
  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

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
                  child: Text("Hello Kally",style: TextStyle(fontSize: 16),)),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Good Morning",style: TextStyle(fontSize: 13,color: Color(0xff8E99B7)),)),
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
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
          },
        )
      ],
    ) ;
  }
  bool   _isLoading = false;
  Future enrollCuorse() async {
    setState(() {
      _isLoading = true;
    });

    var postUri = Uri.parse("http://course.appstic.xyz/addenroll");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['course_id'] =widget.CourseID;
    request.fields['student_id'] =widget.stdID;
    request.fields['fee'] =widget.amount;
    request.fields['status'] ="";
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
            showAlertDialog(context,data['message']);
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
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Student ID "+widget.stdID.toString());
  }

  showAlertDialog(BuildContext context,title2) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentCourse(widget.stdID)));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("SUCCESS"),
      content: Text(title2),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    percentageWidth = width / 100;
    height = MediaQuery.of(context).size.height;
    percentageHeight = height / 100;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      endDrawer: Drawer(
        child: customDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon:SvgPicture.asset("images/nab_icon_home.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/nab_icon_cart.svg"),
            label: "Cart List",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/nab_icon_course.svg"),
            label: "My Courses",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("images/nab_icon_account.svg"),
            label: "Account",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
       child: Column(
         children: [
           Container(
             width: percentageWidth * 100,
             height: percentageHeight * 85.5,
             child: Column(
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width,
                   margin: EdgeInsets.only(left: 0,bottom: 0,top: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Container(
                         margin: EdgeInsets.only(left: 20,bottom: 10,top: 40),
                         height: 22,
                         width: percentageWidth * 80,
                         alignment:  Alignment.centerLeft,
                         child: Image.asset('images/infix.png')
                         // child: Text("MU Learn",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black,fontFamily: 'AvenirNext',),textAlign: TextAlign.left),
                       ),

                     ],
                   )
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width,
                   margin: EdgeInsets.only(left: 20,bottom: 10,top: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Texth1("Checkout"),
                     ],
                   )
                 ),
                 Container(
                   height: percentageHeight * 4.95,
                   width: percentageWidth * 89.33,
                   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: Color(0xFFf8f5ff)
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Amount to checkout",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff303B58),fontFamily: 'AvenirNext')),
                       Text(widget.amount +" TK",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff8555F9),fontFamily: 'AvenirNext')),
                     ],
                   ),
                 ),
                 Container(
                   height: percentageHeight * 7.62,
                   width: percentageWidth * 89.33,
                   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                   margin: EdgeInsets.only(top: percentageHeight * 1.95),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     // color: Color(0xFFE99B7),
                     shape: BoxShape.rectangle,
                     border: Border.all(
                         color: Color(0xFFE5E5E5),
                         style: BorderStyle.solid
                     ),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.radio_button_off_outlined,color: Color(0xFFE5E5E5),),
                           SizedBox(width: 12,),
                           Text("Paypal",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0xff303B58),fontFamily: 'AvenirNext')),
                         ],
                       ),
                       Image.asset("images/paypal.png")
                     ],
                   ),
                 ),
                 Container(
                   height: percentageHeight * 7.62,
                   width: percentageWidth * 89.33,
                   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                   margin: EdgeInsets.only(top: percentageHeight * 1.95),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     // color: Color(0xFFE99B7),
                     shape: BoxShape.rectangle,
                     border: Border.all(
                         color: Color(0xFFE5E5E5),
                         style: BorderStyle.solid
                     ),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.radio_button_off_outlined,color: Color(0xFFE5E5E5),),
                           SizedBox(width: 12,),
                           Text("Debit/Credit card",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0xff303B58),fontFamily: 'AvenirNext')),
                         ],
                       ),
                       Image.asset("images/mastercard.png")
                     ],
                   ),
                 ),
                 Container(
                   height: percentageHeight * 7.62,
                   width: percentageWidth * 89.33,
                   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                   margin: EdgeInsets.only(top: percentageHeight * 1.95),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     // color: Color(0xFFE99B7),
                     shape: BoxShape.rectangle,
                     border: Border.all(
                         color: Color(0xFFE5E5E5),
                         style: BorderStyle.solid
                     ),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.radio_button_off_outlined,color: Color(0xFFE5E5E5),),
                           SizedBox(width: 12,),
                           Text("Bkash ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0xff303B58),fontFamily: 'AvenirNext')),
                         ],
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 20),
                           padding: EdgeInsets.only(left: 20,top: 10,right: 10,bottom: 10),
                           child: Image.asset("images/bkashlogo.jpg"))
                     ],
                   ),
                 ),
               ],
             ),
           ),
           Container(
               width: MediaQuery.of(context).size.width,
               height: percentageHeight * 7,
               color: Color(0xFF8555F9),
               margin: EdgeInsets.only(left: 0,bottom: 0,top: 5),
               child: TextButton(
                 child: Text('Proceed to Checkout',style: TextStyle(fontSize: 15,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w500,
                     color: Color(0xFFFFFFFF)),textAlign: TextAlign.center,),
                 onPressed: (){
                   enrollCuorse();
                  // showAlertDialog(context);

                 },
               )
           ),
         ],
       ),
      )
    );
  }


}
