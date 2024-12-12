import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:ticket_booking_app/screens/ticket_view.dart';
import 'package:ticket_booking_app/utils/app_info_list.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/app_style.dart';
import 'package:ticket_booking_app/widgets/column_layout.dart';
import 'package:ticket_booking_app/widgets/ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20), vertical: AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text('Tickets', style: Styles.headLineStyle1,),
              Gap(AppLayout.getHeight(20)),
              const AppTicketTabs(firstTab: 'UpComing', secondTab: 'Previous'),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0], isColor:true,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                    bottom: Radius.circular(20.0)
                  )
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnLayout(firstText: 'Flutter DB', secondText: 'Passenger',alignment: CrossAxisAlignment.start,),
                        AppColumnLayout(firstText: '5221 364869', secondText: 'Passport',alignment: CrossAxisAlignment.end),
                      ],
                      ),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnLayout(firstText: '364738 28274478', secondText: ' number of E-ticket',alignment: CrossAxisAlignment.start),
                        AppColumnLayout(firstText: 'B2SG28', secondText: 'Booking code',alignment: CrossAxisAlignment.end,),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/visa_logo.png', scale: 13,
                                ),
                                Text('*** 2462', style: Styles.headLineStyle3,),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Payement method', style: Styles.headLineStyle4,)
                              ],
                            ),

                            Gap(AppLayout.getHeight(20)),


                          ],

                        ),
                        AppColumnLayout(
                            firstText: '\$249.99',
                            secondText: 'Price',
                            alignment: CrossAxisAlignment.end)
                      ],
                    ),
                    Gap(10),
                    /* barcode */
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                        child: BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: 'https://github.com/martinovovo',
                          drawText: false,
                          color: Styles.textColor,
                          // width: double.infinity,
                          height: 70,
                        ),
                      ),
                    )

                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
