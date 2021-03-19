import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/CustomText.dart';
import 'package:lms/Screens/ChangePassword.dart';
import 'package:lms/Screens/CustomWidget.dart';
import 'package:lms/Screens/EditProfile.dart';
import 'package:lms/Screens/Home.dart';
import 'package:lms/Screens/PaymentScreen.dart';
import 'package:lms/Screens/PopupScreen.dart';
import 'package:toast/toast.dart';

class CartList extends StatefulWidget {
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {

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
                   GestureDetector(
                     child: Container(
                       margin: EdgeInsets.only(left: 20,bottom: 10,top: 40),
                       height: 22,
                       width: percentageWidth * 10,
                       alignment:  Alignment.centerLeft,
                       child: Icon(Icons.search),
                     ),
                     onTap: (){

                     },
                   )
                 ],
               )
           ),
           Container(
             width: MediaQuery.of(context).size.width,
             margin: EdgeInsets.only(left: 20,bottom: 10,top: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Texth1("Cart List"),
               ],
             )
           ),
           Container(
             height: percentageHeight * 43,
             child: ListView.builder(
                 scrollDirection: Axis.vertical,
                 itemCount: 3,
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                 itemBuilder: (BuildContext context,int index){
                   return Container(
                       width: percentageWidth * 100,
                       height: percentageHeight * 12.5,
                       margin: EdgeInsets.only(left: 20,bottom: 0,top: 10,right: 20),
                       decoration: BoxDecoration(
                           color: Color(0xFFFFFFFF),
                           borderRadius: BorderRadius.circular(5.0),
                           boxShadow: [
                             BoxShadow(
                               color: Color(0xffE5E5E5).withOpacity(.5),
                               blurRadius: 4,
                               offset: Offset(2,3),
                             ),
                           ]
                       ),
                       child: Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                             width: percentageWidth * 20,
                             height: percentageHeight * 12,
                             margin: EdgeInsets.fromLTRB(6, 6, 6, 6),
                             decoration: BoxDecoration(
                                 color: Color(0xFFFFFFFF),
                                 borderRadius: BorderRadius.circular(5.0),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.white.withOpacity(.5),
                                     blurRadius: 4,
                                     offset: Offset(2,3),
                                   ),
                                 ]
                             ),
                             child: Image.asset('images/cart1.png',fit: BoxFit.fitHeight,),
                           ),
                           Container(
                               width: percentageWidth * 65,
                               height: percentageHeight * 12.5,
                               padding: EdgeInsets.only(left: 12,top: 10),
                               child: Column(
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(
                                         // width: percentageWidth * 50,
                                         child: courseTitle("Ios App Development.."),
                                       ),
                                       GestureDetector(
                                         child: Icon(Icons.more_horiz,color: Color(0xff8E99B7),),
                                         onTap: (){

                                         },
                                       )
                                     ],
                                   ),
                                   Container(
                                       margin: EdgeInsets.only(top: 6),
                                       width: percentageWidth * 65,
                                       // height: percentageHeight * 2,
                                       child: courseTPublisher('Bijon Sharma')
                                   ),
                                   Container(
                                     margin: EdgeInsets.only(top: 20,bottom: 6),
                                     width: percentageWidth * 65,
                                     // height: percentageHeight * 2,
                                     child: cartMoney("\$80"),
                                   ),
                                 ],
                               )
                           ),
                         ],
                       )
                   );
                 }
             ),
           ),
           Container(
               width: MediaQuery.of(context).size.width,
               margin: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
               decoration: BoxDecoration(
                 color: Color(0xFFFFFFFF),
                 border: Border.all(color: Color(0xff8E99B7)),
                 borderRadius: BorderRadius.circular(6.0),
                 boxShadow: [
                   BoxShadow(
                     // color: Color(0xff8E99B7).withOpacity(.3),
                     color: Color.fromRGBO(48, 59, 88, 0.05),
                     blurRadius: 4,
                     offset: Offset(2,3),
                   ),
                 ]
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     margin: EdgeInsets.only(left: 20,bottom: 20,top: 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Texth1("Order Summery"),
                       ],
                     )
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     margin: EdgeInsets.only(left: 20,bottom: 12,top: 0,right: 20),
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
                         cartTitle("Ios app development.."),
                         cartMoney("\$80"),
                       ],
                     )
                   ),
                   Container(
                       width: MediaQuery.of(context).size.width,
                       margin: EdgeInsets.only(left: 20,bottom: 12,top: 0,right: 20),
                       decoration: BoxDecoration(
                           color: Color(0xFFFFFFFF),
                           borderRadius: BorderRadius.circular(0),
                           boxShadow: [
                             BoxShadow(
                               color: Color(0xffF2F6FF).withOpacity(.5),
                               blurRadius: 4,
                               offset: Offset(3,3),
                             ),
                           ]
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           cartTitle("Ios app development.."),
                           cartMoney("\$80"),
                         ],
                       )
                   ),
                   Container(
                       width: MediaQuery.of(context).size.width,
                       margin: EdgeInsets.only(left: 20,bottom: 12,top: 0,right: 20),
                       decoration: BoxDecoration(
                           color: Color(0xFFFFFFFF),
                           borderRadius: BorderRadius.circular(0),

                           boxShadow: [
                             BoxShadow(
                               color: Color(0xffF2F6FF).withOpacity(.5),
                               blurRadius: 4,
                               offset: Offset(3,3),
                             ),
                           ]
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           cartTitle("Ios app development.."),
                           cartMoney("\$80"),
                         ],
                       )
                   ),
                   isCouponAvailable ? Container(
                       width: MediaQuery.of(context).size.width,
                       margin: EdgeInsets.only(left: 20,bottom: 12,top: 0,right: 20),
                       decoration: BoxDecoration(
                           color: Color(0xFFFFFFFF),
                           borderRadius: BorderRadius.circular(0),

                           boxShadow: [
                             BoxShadow(
                               color: Color(0xffF2F6FF).withOpacity(.5),
                               blurRadius: 4,
                               offset: Offset(3,3),
                             ),
                           ]
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           couponTotal("Coupon"),
                           couponTotal("\$10"),
                         ],
                       )
                   ): Container(),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     margin: EdgeInsets.only(left: 20,bottom: 12,top: 0,right: 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         cartTotal("Total"),
                         cartTotal("\$240"),
                       ],
                     )
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     margin: EdgeInsets.only(left: 20,bottom: 12,top: 02,right: 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                           width: percentageWidth * 60,
                           alignment: Alignment.centerLeft,
                           decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             border: Border.all(
                              color: Color(0xFF8E99B7),
                             ),
                             borderRadius: BorderRadius.all(Radius.circular(5))
                           ),
                           child: TextFormField(
                             cursorColor: Color(0xFF8E99B7),
                             keyboardType: TextInputType.text,
                             decoration: new InputDecoration(
                               border: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               enabledBorder: InputBorder.none,
                               errorBorder: InputBorder.none,
                               disabledBorder: InputBorder.none,
                               contentPadding:
                               EdgeInsets.only(left: 15, bottom: 12, top: 12, right: 5),
                               hintText: "Enter coupon code"
                             ),
                             onChanged: (String val){
                               setState(() {
                                 coupon = val.toString();
                               });
                             }
                           )
                         ),
                         Container(
                             // margin: EdgeInsets.only(left:8,),
                             alignment: Alignment.center,
                             // width: 88,
                             // height: 46,
                             decoration: BoxDecoration(
                               shape: BoxShape.rectangle,
                               border: Border.all(
                                 // width: .1,
                                 color: Color(0xFF5786F),
                                 style: BorderStyle.none
                               ),
                               color: Color(0xFF5786FF),
                               borderRadius: BorderRadius.all(Radius.circular(5))
                             ),
                             child: TextButton(
                               child: Text('Apply',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                                   color: Color(0xFFFFFFFF)),textAlign: TextAlign.center,),
                               onPressed: (){
                                 if(coupon.toString() == "wow"){
                                   setState(() {
                                      isCouponAvailable = true;
                                   });
                                 }else{
                                   Toast.show("Coupon is not correct", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM,backgroundColor: Color(0xff8E99B7));
                                 }
                               },
                             )
                         ),
                       ],
                     )
                   ),
                 ],
               )
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
                 Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen('0/=',"","")));
               },
             )
           ),
         ],
       ),
      )
    );
  }


}
