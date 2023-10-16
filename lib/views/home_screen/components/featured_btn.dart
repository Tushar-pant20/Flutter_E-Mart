import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )
      .box
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .width(200)
      .white
      .padding(EdgeInsets.all(4.0))
      .roundedSM
      .make();
}
