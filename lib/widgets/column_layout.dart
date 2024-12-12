import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/app_style.dart';

class AppColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  const AppColumnLayout({Key? key,
    required this.firstText, required this.secondText, required this.alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(firstText, style: Styles.headLineStyle3,),
        Gap(AppLayout.getHeight(5)),
        Text(secondText, style: Styles.headLineStyle4,),
      ],
    );
  }
}
