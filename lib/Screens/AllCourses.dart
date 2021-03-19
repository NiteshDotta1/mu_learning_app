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

class AllCourses extends StatefulWidget {
  _AllCoursesState createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {

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
        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(1),));
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartList()));
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

  showPopup(BuildContext context,{BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 0,
        left: 35,
        right: 0,
        bottom: 0,
        child: PopupContent(
          content: Scaffold(
            body: filterDrawer(),
          ),
        ),
      ),
    );
  }

  Widget filterDrawer() {
    String dropdownValue = 'One';
    return Container(
      width: percentageWidth* 89.85,
      height: percentageHeight* 100,
      color: Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 115.3,
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30.56),
                    alignment: Alignment.centerLeft,
                    width: 108,
                    height: 22,
                    child: Text('Filter Courses',style: TextStyle(fontSize: 17,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                        color: Color(0xFF303B58)),textAlign: TextAlign.center,)
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30.56,top: 32),
                    alignment: Alignment.centerLeft,
                    width: percentageWidth* 16,
                    height: 22,
                    child: Text('Topic',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                        color: Color(0xFF303B58)),textAlign: TextAlign.center,)
                ),
                Container(
                  margin: EdgeInsets.only(left: 47.19,top: 30),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        // width: .1,
                          color: Color(0xFF8E99B7),
                          style: BorderStyle.none
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Container(
                    width: 195,
                    height: 46,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      dropDownButton: Icon(Icons.keyboard_arrow_down_sharp,size: 14,color: Color(0xFF8E99B7),),
                      items: ["Flutter", "Web Design (Disabled)", "Digital Marketing", 'Graphics Design'],
                      // label: "Menu mode",
                      hint: "Select topic",
                      popupItemDisabled: (String s) => s.startsWith('W'),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30.56,top: 10),
                    alignment: Alignment.centerLeft,
                    width: percentageWidth* 16,
                    height: 22,
                    child: Text('Software',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                        color: Color(0xFF303B58)),textAlign: TextAlign.center,)
                ),
                Container(
                  margin: EdgeInsets.only(left: 47.19,top: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        // width: .1,
                          color: Color(0xFF8E99B7),
                          style: BorderStyle.none
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Container(
                    width: 195,
                    height: 46,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      dropDownButton: Icon(Icons.keyboard_arrow_down_sharp,size: 14,color: Color(0xFF8E99B7),),
                      items: ["Flutter", "Web Design (Disabled)", "Digital Marketing", 'Graphics Design'],
                      // label: "Menu mode",
                      hint: "Select topic",
                      popupItemDisabled: (String s) => s.startsWith('W'),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30.56,top: 10),
                    alignment: Alignment.centerLeft,
                    width: percentageWidth* 16,
                    height: 22,
                    child: Text('Skill Level',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                        color: Color(0xFF303B58)),textAlign: TextAlign.center,)
                ),
                Container(
                  margin: EdgeInsets.only(left: 47.19,top: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        // width: .1,
                          color: Color(0xFF8E99B7),
                          style: BorderStyle.none
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Container(
                    width: 195,
                    height: 46,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      dropDownButton: Icon(Icons.keyboard_arrow_down_sharp,size: 14,color: Color(0xFF8E99B7),),
                      items: ["Flutter", "Web Design (Disabled)", "Digital Marketing", 'Graphics Design'],
                      // label: "Menu mode",
                      hint: "Select topic",
                      popupItemDisabled: (String s) => s.startsWith('W'),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30.56,top: 10),
                    alignment: Alignment.centerLeft,
                    width: percentageWidth* 16,
                    height: 22,
                    child: Text('Language',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                        color: Color(0xFF303B58)),textAlign: TextAlign.center,)
                ),
                Container(
                  margin: EdgeInsets.only(left: 47.19,top: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        // width: .1,
                          color: Color(0xFF8E99B7),
                          style: BorderStyle.none
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Container(
                    width: 195,
                    height: 46,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      dropDownButton: Icon(Icons.keyboard_arrow_down_sharp,size: 14,color: Color(0xFF8E99B7),),
                      items: ["Flutter", "Web Design (Disabled)", "Digital Marketing", 'Graphics Design'],
                      // label: "Menu mode",
                      hint: "Select topic",
                      popupItemDisabled: (String s) => s.startsWith('W'),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30.56,top: 10),
                    alignment: Alignment.centerLeft,
                    width: percentageWidth* 16,
                    height: 22,
                    child: Text('Author',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                        color: Color(0xFF303B58)),textAlign: TextAlign.center,)
                ),
                Container(
                  margin: EdgeInsets.only(left: 47.19,top: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        // width: .1,
                          color: Color(0xFF8E99B7),
                          style: BorderStyle.none
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Container(
                    width: 195,
                    height: 46,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      dropDownButton: Icon(Icons.keyboard_arrow_down_sharp,size: 14,color: Color(0xFF8E99B7),),
                      items: ["Flutter", "Web Design (Disabled)", "Digital Marketing", 'Graphics Design'],
                      // label: "Menu mode",
                      hint: "Select topic",
                      popupItemDisabled: (String s) => s.startsWith('W'),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30.56,top: 10),
                    alignment: Alignment.centerLeft,
                    width: percentageWidth* 16,
                    height: 22,
                    child: Text('Price',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                        color: Color(0xFF303B58)),textAlign: TextAlign.center,)
                ),
                Container(
                  margin: EdgeInsets.only(left: 47.19,top: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        // width: .1,
                          color: Color(0xFF8E99B7),
                          style: BorderStyle.none
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Container(
                    width: 195,
                    height: 46,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      dropDownButton: Icon(Icons.keyboard_arrow_down_sharp,size: 14,color: Color(0xFF8E99B7),),
                      items: ["Flutter", "Web Design (Disabled)", "Digital Marketing", 'Graphics Design'],
                      // label: "Menu mode",
                      hint: "Select topic",
                      popupItemDisabled: (String s) => s.startsWith('W'),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 24.7),
                    alignment: Alignment.center,
                    width: 88,
                    height: 46,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          // width: .1,
                            color: Color(0xFFD7598F),
                            style: BorderStyle.none
                        ),
                        color: Color(0xFFD7598F),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    // color: Color(0xFFD7598F),
                    child: TextButton(
                      child: Text('Reset',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),textAlign: TextAlign.center,),
                      onPressed: (){

                      },
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left:14.88,top: 24.7),
                    alignment: Alignment.center,
                    width: 88,
                    height: 46,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          // width: .1,
                            color: Color(0xFFD7598F),
                            style: BorderStyle.none
                        ),
                        color: Color(0xFF8555F9),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: TextButton(
                      child: Text('Apply',style: TextStyle(fontSize: 14,fontFamily: 'AvenirNext',fontStyle: FontStyle.normal,fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),textAlign: TextAlign.center,),
                      onPressed: (){

                      },
                    )
                ),

              ],
            ),

          ],
        ),
      )
    );
  }

  List<AllCourse> allCourseList = List();
  Future getAllCourseList() async {
    final responce = await http.get("http://course.appstic.xyz/getcourses");
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
               margin: EdgeInsets.only(left: 20,bottom: 10,top: 40),
               height: 22,
               width: MediaQuery.of(context).size.width,
               alignment:  Alignment.centerLeft,
               child: Image.asset('images/infix.png')
               // child: Text("MU Learn",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black,fontFamily: 'AvenirNext',),textAlign: TextAlign.left,),

           ),
           Container(
             decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.3),
                   blurRadius: 10,
                   offset: Offset(2,2),
                 ),
               ] ,
             ),
             margin: EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
             child:  TextField(
               decoration: InputDecoration(
                   contentPadding: EdgeInsets.all(3.0),
                   filled: true,
                   fillColor: Colors.white,
                   enabledBorder: OutlineInputBorder(
                     borderRadius:  BorderRadius.circular(5),
                     borderSide: BorderSide(color: Color.fromRGBO(48, 59, 88, 0.07), width: 1.0),
                   ),
                   hintText: 'What you want to learn ?',
                   hintStyle: TextStyle(fontSize: 13),
                   prefixIcon: Icon(Icons.search,size: 28,),
                   suffixIcon: GestureDetector(
                     child: Container(
                       padding: EdgeInsets.only(left: 8,top: 8,bottom: 8,right: 16),
                       height: 40,
                       width: 40,
                       child: SvgPicture.asset('images/filter_icon.svg'),
                     ),
                     onTap: (){
                       print("hello");
                       // setState(() {
                       //   isFilterDrawer = true;
                       // });
                       showPopup(context);
                     },
                   )
               ),
             ),
           ),
           Container(
               width: MediaQuery.of(context).size.width,
               margin: EdgeInsets.only(left: 20,bottom: 10,top: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Texth1("All Courses"),
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
