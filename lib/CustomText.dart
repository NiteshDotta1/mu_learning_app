import 'package:flutter/material.dart';

Widget Texth1(String txt){
  return Text(txt,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0xff303B58),fontFamily: 'AvenirNext'));
}

Widget CatTitle(String txt){
  return Text(txt,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white,height: 2,fontFamily: 'AvenirNext',),);
}

Widget CatSubTitle(String txt){
  return Text(txt,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600,color: Colors.white,),);
}

Widget sellAllText(){
  return Row(
    children: [
      Text("See All",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.blue,),),
      Icon(Icons.arrow_right,color: Colors.blue,),
    ],);
}

Widget courseTitle(String txt){
  return Text(txt,maxLines: 1,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff303B58),height: 1.3,fontFamily: 'AvenirNext',));
}

Widget courseTPublisher(String txt){
  return Text(txt,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Color(0xff8E99B7)));
}

Widget cartMoney(String txt){
  return Text(txt,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Color(0xffD7598F),fontFamily: 'AvenirNext'));
}

Widget cartTitle(String txt){
  return Text(txt,style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,color: Color(0xff303B58),fontFamily: 'AvenirNext'));
}

Widget cartTotal(String txt){
  return Text(txt,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Color(0xff303B58),fontFamily: 'AvenirNext'));
}

Widget couponTitle(String txt){
  return Text(txt,style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,color: Color(0xff23BC20),fontFamily: 'AvenirNext'));
}

Widget couponTotal(String txt){
  return Text(txt,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color: Color(0xff23BC20),fontFamily: 'AvenirNext'));
}

Widget courseDescriptionTitle(String txt){
  return Text(txt,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Color(0xffffffff),fontFamily: 'AvenirNext',),textAlign: TextAlign.left,);
}

Widget courseDescriptionPublisher(String txt){
  return Text(txt,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: Color(0xffffffff)));
}

Widget courseStructure(String txt){
  return Text(txt,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff303B58),fontFamily: 'AvenirNext',));
}

Widget PopularPostTitle(String txt){
  return Text(txt,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,height: 3));
}

String hint(){
  return Text("Your review",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff8E99B7))).toStringShort();
}
