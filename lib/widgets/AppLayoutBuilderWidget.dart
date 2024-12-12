import 'package:flutter/material.dart';

class AppLayoutBuilderWidget extends StatelessWidget {
  final int sections;
  final double width;
  const AppLayoutBuilderWidget({super.key, required this.width, required this.sections});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context,
          BoxConstraints constarints) {
        print(
            'The width is ${constarints.constrainWidth()}');
        return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
                (constarints.constrainWidth() / 6)
                    .floor(),
                    (index) => SizedBox(
                  width: 3,
                  height: 2,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300)),
                )));
      },
    );
  }
}
