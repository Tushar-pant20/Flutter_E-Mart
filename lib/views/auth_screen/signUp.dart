import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/applogo_widgets.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/out_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Join the $appname".text.fontFamily(semibold).black.size(18).make(),
          10.heightBox,
          Column(
            children: [
              customTextField(hint: nameHint, title: name),
              customTextField(hint: emailHint, title: email),
              customTextField(hint: passwordHint, title: password),
              customTextField(hint: retypepassword, title: retypepassword),
              Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {}, child: forgetPassword.text.make())),
              10.heightBox,
              Row(
                children: [
                  Checkbox(
                      checkColor: redColor,
                      value: ischecked,
                      onChanged: (newValue) {
                        setState(() {
                          if (!ischecked) {
                            ischecked = true;
                          } else {
                            ischecked = false;
                          }
                        });
                      }),
                  10.heightBox,
                  Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                        text: "I agree to the ",
                        style: TextStyle(fontFamily: regular, color: fontGrey)),
                    TextSpan(
                        text: termAndCond,
                        style: TextStyle(fontFamily: regular, color: redColor)),
                    TextSpan(
                        text: "&",
                        style: TextStyle(fontFamily: regular, color: fontGrey)),
                    TextSpan(
                        text: privacyPolicy,
                        style: TextStyle(fontFamily: regular, color: redColor))
                  ])))
                ],
              ),
              15.heightBox,
              ourButton(
                      color: ischecked == true ? redColor : lightGrey,
                      title: signup,
                      textColor: whiteColor,
                      onPress: () {})
                  .box
                  .width(context.screenWidth - 50)
                  .make(),
              10.heightBox,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: alreadyHaveAccount,
                    style: TextStyle(fontFamily: bold, color: fontGrey)),
                TextSpan(
                    text: login,
                    style: TextStyle(fontFamily: bold, color: redColor))
              ])).onTap(() {
                Get.back();
              }),
            ],
          )
              .box
              .white
              .rounded
              .padding(const EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .shadowSm
              .make()
        ],
      )),
    );
  }
}
