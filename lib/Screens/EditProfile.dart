import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  double icon_size = 16.0;
  double hint_font_size = 14.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, bottom: 10, top: 40),
                    height: 22,
                    // width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Image.asset('images/infix.png')),
                Container(
                    margin: EdgeInsets.only(right: 24, top: 40),
                    child: Icon(
                      Icons.search,
                      color: Color(0xff8E99B7),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff303B58),
                      size: 18,
                    )
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 17, color: Color(0xff303B58)),
                ),
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 15),
              width: 118,
              height: 118,
              child: Image.asset('images/demo_img.png'),
            ),
            Container(
              alignment: Alignment.center,
              width: 111,
              height: 32,
              decoration: BoxDecoration(
                  color: Color(0xff303B58),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Choose Image',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Basic Information',
                  style: TextStyle(fontSize: 16, color: Color(0xff303B58)),
                )),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: TextField(
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
                  hintText: 'Full Name',
                  hintStyle: TextStyle(
                      color: Color(0xff8E99B7), fontSize: hint_font_size),
                  suffixIcon: Icon(
                    Icons.person,
                    size: icon_size,
                    color: Color.fromRGBO(142, 153, 183, 0.5),
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
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
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Color(0xff8E99B7), fontSize: hint_font_size),
                  suffixIcon: Icon(
                    Icons.email,
                    size: icon_size,
                    color: Color.fromRGBO(142, 153, 183, 0.5),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: TextField(
                keyboardType: TextInputType.phone,
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
                  hintText: 'Phone No.',
                  hintStyle: TextStyle(
                      color: Color(0xff8E99B7), fontSize: hint_font_size),
                  suffixIcon: Icon(
                    Icons.call,
                    size: icon_size,
                    color: Color.fromRGBO(142, 153, 183, 0.5),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: TextField(
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
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      color: Color(0xff8E99B7), fontSize: hint_font_size),
                  suffixIcon: Icon(
                    Icons.location_on_rounded,
                    size: icon_size,
                    color: Color.fromRGBO(142, 153, 183, 0.5),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: TextField(
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
                  hintText: 'Country',
                  hintStyle: TextStyle(
                      color: Color(0xff8E99B7), fontSize: hint_font_size),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    size: icon_size,
                    color: Color.fromRGBO(142, 153, 183, 0.5),
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: TextField(
                keyboardType: TextInputType.number,
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
                  hintText: 'Zip Code',
                  hintStyle: TextStyle(
                      color: Color(0xff8E99B7), fontSize: hint_font_size),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30, bottom: 20),
              height: 46,
              width: 185,
              decoration: BoxDecoration(
                color: Color(0xff8555F9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Update Information",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xff8E99B7)),
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
