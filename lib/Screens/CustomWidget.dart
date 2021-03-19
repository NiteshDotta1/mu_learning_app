import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget drawerListItem(icon, txt){

  return Container(
    padding: EdgeInsets.only(left: 20,top: 15,bottom: 15),
    margin: EdgeInsets.only(left: 20  ,right: 30,top: 5,bottom: 5),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(width: 1,color:Color(0xffF2F6FF))
    ),
    child: Row(
      children: [
        Container(
            height: 16,
            width: 16,
            child: SvgPicture.asset(icon)
        ),
        Text(txt,style: TextStyle(fontSize: 13),),
      ],
    ),
  );

}