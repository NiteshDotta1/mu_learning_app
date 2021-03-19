import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/CustomText.dart';
import 'package:lms/Model/AllCourseModel.dart';
import 'package:lms/Screens/AllCourses.dart';
import 'package:lms/Screens/ChangePassword.dart';
import 'package:lms/Screens/CustomWidget.dart';
import 'package:lms/Screens/EditProfile.dart';
import 'package:lms/Screens/MyCourseList.dart';
import 'package:lms/Screens/PopupScreen.dart';
import 'package:http/http.dart' as http;
import 'package:lms/Screens/Registratin.dart';
import 'package:lms/Screens/TeacherDashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  int code = 0;
  HomeScreen(this.code);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Color> colorsList = [
    Colors.blue,
    Colors.indigo,
    Colors.purpleAccent,
    Colors.orange
  ];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  bool isFilterDrawer = false;
  double width;
  double percentageWidth;
  double height;
  double percentageHeight;
  bool isLoadingCourse = true;

  String UserName = "";


  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

List<AllCourse> allCourse = List();
  Future getAllCourseList() async {
    final responce = await http.get("http://course.appstic.xyz/getcourses");
print(responce.body);
var data = json.decode(responce.body);
print(data);


    print("OPKkkk");
 for(var note in data){
   allCourse.add(AllCourse.fromJson(note));
 }
    setState(() {
      isLoadingCourse = false;
    });

  }

  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    print("Working");

    final response = await http.post("http://course.appstic.xyz/login",body:{
      'phone': phone.text,
      'password' : password.text,
    });

    var data = json.decode(response.body);
    print(data['message']);
    print(data['user']['id']);
    UserName = data['user']['name'];
    if(data['status']=="SUCCESS"){
      await saveData(data['user']['id'].toString());
      await saveType(data['user']['type']);
      print("OPKkkk");
      if(data['user']['type']=="teacher"){
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherDashBoard(),));
      }
    }









    setState(() {
      isLoadingCourse = false;
    });

  }


  List<AllCourse> allCategories = List();
  Future getAllCategories() async {
    final responce = await http.get("http://course.appstic.xyz/getcourses");
    print(responce.body);
    var data = json.decode(responce.body);
    print(data);


    print("OPKkkk");
    for(var note in data){
      allCourse.add(AllCourse.fromJson(note));
    }
    setState(() {
      isLoadingCourse = false;
    });

  }

  String nameKey = "userID";
  String userType = "type";

  Future<void> saveData(String msg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(nameKey, msg);
  }
  Future<void> saveType(String msg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(userType, msg);
  }


  String userID="0" ;
  Future<void> loginChecker() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
      userID=await preferences.getString(nameKey);
  }

  Future<void> signOUT() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(nameKey, "0");
  }



   Future<String> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userID= prefs.getString(nameKey) ;
  }





  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    _selectedIndex = widget.code;
    super.initState();
    getAllCourseList();
    getUserID();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }


  void _onItemTapped(int index) {

  setState(() {
    _selectedIndex = index;
    print(index.toString());
    if (_selectedIndex==3){
      print("Calling 3");
      _openEndDrawer();
    }
  });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // opendrawer
  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  Widget myCourse() {

    loginChecker();
    setState(() {

    });
    return userID == '0' ? signIN() :  MyCourseList("");
  }
  Widget MyCourseList(userID){
    return Container(
      child:     Container(
        height: MediaQuery.of(context).size.height,

        // color: Colors.orange,
        // margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount:allCourse.length,
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
                              child: PopularPostTitle(allCourse[index].name)),
                          Container(
                              width: MediaQuery.of(context).size.width-136,
                              child: courseTPublisher(allCourse[index].teacher.name))

                        ],
                      ),
                    ),


                  ],
                ),
              );
            }),
      ),
    );

  }

  Widget CartList(){

     loginChecker();
     setState(() {

     });
    return userID == '0' ? signIN() : Text("Your Cart List Empty !");

  }

  Widget signIN() {
    return Column(
      children: [
        Container(
         margin: EdgeInsets.only(top: 58,),
         height: 70,
         width: 70,
         child:  Image.asset('images/signin_img.png'),),
        Container(
            margin: EdgeInsets.only(top: 30,bottom: 30),
            child: Text("Sign IN",style: TextStyle(color: Color(0xff303B58),fontSize: 24))),
        Container(
          padding: EdgeInsets.only(left: 30,right: 30),
          child: TextField(
            controller: phone,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(5),
                borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),
              ),
              hintText: 'Enter Your Phone',
              hintStyle: TextStyle(color: Color(0xff8E99B7)),
              suffixIcon: Icon(Icons.email,size: 24,color:  Color.fromRGBO(142,153,183, 0.5),),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(left: 30,right: 30),
          child: TextField(
            controller: password,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15,top: 3,bottom: 3),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(5),
                borderSide: BorderSide(color: Color.fromRGBO(142,153,183, 0.4), width: 1.0),

              ),


              hintText: 'Password',
              hintStyle: TextStyle(color: Color(0xff8E99B7)),
              suffixIcon: Icon(Icons.lock,size: 24,color: Color.fromRGBO(142,153,183, 0.5),),

            ),
          ),
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            height: 46,
              width: 98,
            decoration: BoxDecoration(
              color: Color(0xff8555F9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("Sign In",style: TextStyle(fontSize: 15,color: Colors.white),),
          ),
          onTap: (){
            login();
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: GestureDetector(child: Text("Don't have any Account ?"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegistration(),));
          },
          ),
        ),
      ],
    );
  }

  List courseList = ['Web','Graphic','Mobile App','Advance Web',];
  List courseQnty = ['04','03','02','02',];
  Widget homeContent(){
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20,bottom: 10,top: 20),
            child: Texth1("Top Categories")),
        Container(
          height: 80,
          //margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  decoration: BoxDecoration(
                      color: colorsList[index],
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  height: 80,
                  width: 140,
                  margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    children: [
                      SizedBox(height: 8,),
                      Container(
                          width: 140,
                          margin: EdgeInsets.only(left: 15),
                          child: CatTitle(courseList[index])),
                      Container(
                          margin: EdgeInsets.only(left: 15,top: 5),
                          width: 140,
                          child: CatSubTitle(courseQnty[index]+" course")),
                    ],
                  ),
                );
              }),
        ),

        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20,bottom: 10,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Texth1("Featured Courses"),
                GestureDetector(
                  child: sellAllText(),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllCourses(),));
                  },
                )
              ],
            )
        ),
       isLoadingCourse ? Center(child: CircularProgressIndicator(),): Container(
          height: percentageHeight * 24,
          width: percentageWidth * 100,
          margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allCourse.length,
            itemBuilder: (BuildContext context,int index){
              return Container(
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
                height: percentageHeight * 23,
                width: percentageWidth * 40,
                margin: EdgeInsets.fromLTRB(16, 0, 0, 8),
                child: Column(
                  children: [
                    Container(
                      height: percentageHeight * 11.5,
                      width: percentageWidth * 40,
                      // margin: EdgeInsets.only(left: 15),
                      child: Image.asset( 'images/fcimg.png',fit: BoxFit.fill,)),
                    Container(
                      height: percentageHeight * 11.5,
                      width: percentageWidth * 40,
                      padding: EdgeInsets.only(left: 10,top: 5),
                      child: Column(
                        children: [
                          courseTitle(allCourse[index].name),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: percentageWidth * 40,
                            child: courseTPublisher(allCourse[index].teacher.name)),
                        ],
                      )
                    ),
                  ],
                ),
              );
            }
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20,bottom: 0,top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Texth1("Popular Courses"),
                GestureDetector(
                  child: sellAllText(),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllCourses(),));
                  },
                )
              ],
            )),

        Container(
          height: 300,
          // color: Colors.orange,
          // margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount:allCourse.length,
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
                                child: PopularPostTitle(allCourse[index].name)),
                            Container(
                                width: MediaQuery.of(context).size.width-136,
                                child: courseTPublisher(allCourse[index].teacher.name))

                          ],
                        ),
                      ),


                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget customDrawerSignIN(){
   return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        signIN(),
    ]
    );
  }
  Widget customDrawer() {
    return userID=="0" ? customDrawerSignIN() : Column(
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
                  child: Text(UserName,style: TextStyle(fontSize: 16),)),
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
        left: 30,
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

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    percentageWidth = width / 100;
    height = MediaQuery.of(context).size.height;
    percentageHeight = height / 100;
    return Scaffold(
      key: _scaffoldKey,
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
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,bottom: 10,top: 40),
                height: 26,
                width: MediaQuery.of(context).size.width,
                alignment:  Alignment.centerLeft,
                child: Image.asset('images/infix.png')
                // child: Text("MU Learn",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black,fontFamily: 'AvenirNext',),textAlign: TextAlign.left,),
              ),
              _selectedIndex == 0 ? Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(2,2),
                    ),
                  ],
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
                    hintText: 'What you want to learn?',
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
              ) : Container(),

              _selectedIndex == 0 ?  homeContent() : _selectedIndex == 1 ?
              CartList() : _selectedIndex == 2 ?  userID == '0' ? signIN() :  MyCourseList("") :homeContent() ,
          //  signIN(),

            ],
          ),
        ),
      ),

    );
  }

}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Apple'),
      Company(2, 'Google'),
      Company(3, 'Samsung'),
      Company(4, 'Sony'),
      Company(5, 'LG'),
    ];
  }
}

