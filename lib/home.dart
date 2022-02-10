import 'package:flutter/material.dart';
import 'package:portfolioapp/colors.dart';
import 'package:portfolioapp/footer.dart';
import 'package:portfolioapp/header.dart';
import 'package:portfolioapp/middle.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.primaryColor,
      child: VStack(
        [
        HeaderScreen(),
          if(context.isMobile)IntroductionWidget().p16(),
          MiddleScreen(),
          FooterScreen(),
        ]
      ).scrollVertical(),
    );
  }
}
