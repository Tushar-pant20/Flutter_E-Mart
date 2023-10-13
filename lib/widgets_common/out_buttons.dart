import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({
  onPress,
  color,
  title,
  textColor,
}) {
  return ElevatedButton(
    style:
        ElevatedButton.styleFrom(primary: color, padding: EdgeInsets.all(12.0)),
    onPressed: onPress,
    child: title.toString().text.color(textColor).fontFamily(bold).make(),
  );
}
