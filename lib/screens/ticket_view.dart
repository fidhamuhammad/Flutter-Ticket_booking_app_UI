import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/app_style.dart';
import 'package:ticket_booking_app/widgets/AppLayoutBuilderWidget.dart';
import 'package:ticket_booking_app/widgets/column_layout.dart';
import 'package:ticket_booking_app/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;

  const TicketView({Key? key, required this.ticket, required this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: 190,
      // AppLayout.getHeight(GetPlatform.isAndroid==true?167:169),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          children: [
            /* this container is responsible for showing the top part (blue part) of the card/ticket */
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF526799),
                // isColor==null? Color(0xFF526799):Colors.white,
                /* conditions appearing on color changes using null property */
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: Styles.headLineStyle3.copyWith(color: Colors.white),
                        // style: isColor == null
                        //     ? Styles.headLineStyle3
                        //         .copyWith(color: Colors.white)
                        //     : Styles.headLineStyle3,
                      ),
                      // const Spacer(),
                      Expanded(child: Container()),
                      ThickContainer(isColor: true),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 25,
                            child:
                              AppLayoutBuilderWidget(
                                  width: 100,
                                  sections: 22
                              )
                          ),
                          Center(
                            child:
                                //to rotate icon we use transform widget
                                Transform.rotate(
                              angle: 1.5,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: isColor == null
                                    ? Colors.white
                                    : Color(0XFF8ACCF7),
                              ),
                            ),
                          ),
                        ],
                      )),

                      ThickContainer(isColor: true),
                      Expanded(child: Container()),
                      Text(ticket['to']['code'],
                        style: Styles.headLineStyle3.copyWith(color: Colors.white),
                          // style: isColor == null
                          //     ? Styles.headLineStyle3
                          //         .copyWith(color: Colors.white)
                          //     : Styles.headLineStyle3
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(ticket['from']['name'],
                          style: Styles.headLineStyle4.copyWith(color: Colors.white),
                            // style: isColor == null
                            //     ? Styles.headLineStyle4
                            //         .copyWith(color: Colors.white)
                            //     : Styles.headLineStyle4
                        ),
                      ),
                      Text(ticket['flying_time'],
                        style: Styles.headLineStyle4.copyWith(color: Colors.white),
                          // style: isColor == null
                          //     ? Styles.headLineStyle4
                          //         .copyWith(color: Colors.white)
                          //     : Styles.headLineStyle4
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style: Styles.headLineStyle4.copyWith(color: Colors.white),
                          // style: isColor == null
                          //     ? Styles.headLineStyle4
                          //         .copyWith(color: Colors.white)
                          //     : Styles.headLineStyle4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /* showing the lowerTop part (orange) of the card/ticket */
            Container(
              color: Color(0xFF526799),
              // Colors.lightBlueAccent,
              // const Color(0xFFF37B67),
              // isColor==null? Styles.orangeColor:Colors.white,
              /* const color(0xFFF37B67) */
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white, /* this color is apper on the middle part of ticket, where shows the side curve in two sides of the container */
                            // isColor==null?
                            // Colors.white:Colors.grey.shade200,
                            // Styles.orangeColor:Colors.white,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ))),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        direction: Axis.horizontal,
                        children: List.generate(
                            (constraints.constrainWidth() / 15).floor(),
                            (index) => SizedBox(
                                  width: 5,
                                  height: 1,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    // isColor == null
                                    //     ? Colors.white
                                    //     : Colors.grey.shade300,
                                  )),
                                )),
                      );
                    }),
                  )),
                  SizedBox(
                    height: 20,
                    // AppLayout.getHeight(20),
                    width: 10,
                    // AppLayout.getWidth(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // isColor==null
                            //     ? Colors.grey.shade200
                            //     :Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ))),
                  ),
                ],
              ),
            ),
            /* showing the bottom part (orange) of the card/ticket */
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF526799),

                // Styles.orangeColor,
                // isColor==null?
                // Styles.orangeColor
                //     :Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21),
                    // isColor==null?21:0
                ),
              ),
              padding: const EdgeInsets.only(
                  left: 16, top: 10, bottom: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket['date'],
                              style: Styles.headLineStyle3.copyWith(color: Colors.white),
                              // style: isColor == null
                              //     ? Styles.headLineStyle3
                              //         .copyWith(color: Colors.white)
                              //     : Styles.headLineStyle3
                          ),
                          const Gap(5),
                          Text('Date',
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                              // style: isColor == null
                              //     ? Styles.headLineStyle4
                              //         .copyWith(color: Colors.white)
                              //     : Styles.headLineStyle4
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket['departure_time'],
                            style: Styles.headLineStyle3.copyWith(color: Colors.white),
                              // style: isColor == null
                              //     ? Styles.headLineStyle3
                              //         .copyWith(color: Colors.white)
                              //     : Styles.headLineStyle3
                          ),
                          const Gap(5),
                          Text(
                            'Departure time',
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                            // style: isColor == null
                            //     ? Styles.headLineStyle4
                            //         .copyWith(color: Colors.white)
                            //     : Styles.headLineStyle4,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket["number"].toString(),
                              /* here the keyword 'number' is an integer so it converted into string */
                            style: Styles.headLineStyle3.copyWith(color: Colors.white),
                              // style: isColor == null
                              //     ? Styles.headLineStyle3
                              //         .copyWith(color: Colors.white)
                              //     : Styles.headLineStyle3
                          ),
                          const Gap(5),
                          Text('Number',
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                              // style: isColor == null
                              //     ? Styles.headLineStyle4
                              //         .copyWith(color: Colors.white)
                              //     : Styles.headLineStyle4
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
