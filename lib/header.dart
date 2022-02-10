import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'colors.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameWidget = "Amish\nDutta"
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
          child:ZStack(
            [
            PictureWidget(),
              Row(

                children: [
                  VStack([
                    if(context.isMobile)50.heightBox else 10.heightBox,
                     CustomAppBar().shimmer(
                       primaryColor: Coolors.accentColor,
                     ),
                    30.heightBox,
                    nameWidget,
                    20.heightBox,
                    VxBox()
                        .color(Coolors.accentColor)
                        .size(60, 10)
                        .make()
                        .px4()
                        .shimmer(primaryColor: Coolors.accentColor),
                    30.heightBox,
                    SocialAccounts(),




                  ]).pSymmetric(h: context.percentWidth*5  ,v: 32),
                  20.widthBox,
                  Expanded(
                    child:VxResponsive(
                      fallback: Offstage(),
                      large: IntroductionWidget().pOnly(left: 120).h(context.percentHeight*60),
                    )
                  ),

                ],
              ).w(context.screenWidth),
            ]
          ),

      ).size(context.screenWidth, context.percentHeight*60).color(Coolors.secondaryColor).make(),
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: Transform(
        child: Image.asset("assets/pic.jpeg",
        fit: BoxFit.contain,
          height: context.percentHeight*60,
        ),
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),

      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      size: 70,
      color: Coolors.accentColor,
    );
  }
}
class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        FontAwesomeIcons.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch("https://twitter.com/amish_dutta");
      }).make(),
      20.widthBox,
      Icon(
        FontAwesomeIcons.instagram,
        color: Colors.white,
      ).mdClick(() {
        launch("https://www.instagram.com/flutter.resistance/");
      }).make(),
      20.widthBox,
      Icon(
        FontAwesomeIcons.linkedinIn,
        color: Colors.white,
      ).mdClick(() {
        launch("https://www.linkedin.com/in/amish-dutta-b20058154/");
      }).make(),
      20.widthBox,

      Icon(
        FontAwesomeIcons.github,
          color: Colors.white,
      ).mdClick(() {
        launch("https://github.com/Olympus9239");
      }).make()
    ].hStack();
  }
}

class IntroductionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          " - Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "AppDeveloper in Flutter, Firebase, Dart & Web.\nSolidity Developer, Entrepreneur."
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
              ? context.screenWidth
              : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        RaisedButton(
          onPressed: () {
          },
          hoverColor: Vx.purple700,
          shape: Vx.roundedSm,
          color: Coolors.accentColor,
          textColor: Coolors.primaryColor,
          child: "Software Development Executive".text.make(),
        ).h(50)
      ],
      // crossAlignment: CrossAxisAlignment.center,
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
