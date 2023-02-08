import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';

class InvoiceDetails extends StatelessWidget {
  final int? status;
  const InvoiceDetails({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.primary,
        title: const Text("Invoice Details"),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: colors.whit,),
        ),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: const Icon(
            Icons.share,
            size: 24,
          ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(15),
              color: colors.primary,
              strokeWidth: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleText("Client Name", context, 12),
                        titleText("John Wick", context, 12),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleText("Contact No.", context, 12),
                          titleText("+61261789022", context, 12),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleText("Invoice Id", context, 12),
                          titleText("5266952", context, 12),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleText("Invoice Status", context, 12),
                          Container(
                            height: 25,
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            decoration: BoxDecoration(
                              color: status == 0  ?  colors.green :
                                status == 1 ? colors.primary :
                                colors.red,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child: Text(
                                status == 0  ?  "Paid" :
                                status == 1 ? "Pending" :
                                "Rejected",
                                style: const TextStyle(
                                  color: colors.whit,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(15),
              color: colors.primary,
              strokeWidth: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleText("ABN", context, 12),
                        titleText("XXXXXXX", context, 12),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleText("Bank Details", context, 12),
                          titleText("XXXXXXX", context, 12),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleText("BSB", context, 12),
                          titleText("XXXXXXX", context, 12),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleText("Account Number", context, 12),
                          titleText("XXXXXXX", context, 12),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 20),
              child: titleText("Therapy Duration", context, 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    secTitleText("Total hours", context, 14),
                   const SizedBox(
                   height: 8,
                   ),
                    subTitleText("4 Hr", context, 14)
                  ],
                ),
                Column(
                  children: [
                    secTitleText("Hourly Rate", context, 14),
                    const SizedBox(
                      height: 8,
                    ),
                    subTitleText("\$10", context, 14)
                  ],
                ),
                Column(
                  children: [
                    secTitleText("Date", context, 14),
                    const SizedBox(
                      height: 8,),
                    subTitleText("08 july 2022", context, 14)
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              child: titleText("Therapy Charge", context, 16),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleTextNormal("Total Charge", context, 14),
                  titleText("\$40", context, 14),
                ],
              ),
            ),
           const SizedBox(height: 10,),
         const   DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: colors.secondary,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,

              dashGapRadius: 0.0,
            )
          ],
        ),
      ),
    );
  }
}
