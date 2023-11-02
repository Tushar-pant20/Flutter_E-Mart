import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/Profile_screen/Components/details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              //edit profile button
              const Align(
                alignment: Alignment.topRight,
                child: const Icon(
                  Icons.edit,
                  color: darkFontGrey,
                ),
              ).onTap(() {}),

              //user detail section
              Row(
                children: [
                  Image.asset(imgProfile, width: 80, fit: BoxFit.contain)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy user"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      "customer@example.com".text.color(darkFontGrey).make()
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: darkFontGrey)),
                      onPressed: () {},
                      child: logout.text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make())
                ],
              ),

              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(
                      count: "00",
                      title: "In your cart",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: "32",
                      title: "In your wishlist",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: "60",
                      title: "In your Orders",
                      width: context.screenWidth / 3.4),
                ],
              ),

              //buttons section
              40.heightBox,
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profileButtonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcons[index],
                      width: 22,
                    ),
                    title: profileButtonList[index]
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.symmetric(horizontal: 16))
                  .shadowSm
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
