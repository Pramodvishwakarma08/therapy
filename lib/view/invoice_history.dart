import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/invoice/invoice_details.dart';
import 'package:therapy/view/visits/visit_history.dart';

class InvoiceHistory extends StatefulWidget {
  const InvoiceHistory({Key? key}) : super(key: key);

  @override
  State<InvoiceHistory> createState() => _InvoiceHistoryState();
}

class _InvoiceHistoryState extends State<InvoiceHistory> {
  int _currentIndex = 0;

  List<Map<String, dynamic>> therapists = [
    {"image": "assets/images/people1.png", "name": "John Wick", "date": "08 July 2022", },
    {"image": "assets/images/people2.png", "name": "Jack Sparrow" , "date": "08 July 2022"},
    {"image": "assets/images/people1.png", "name": "Tony Stark" , "date": "08 July 2022"},
    {"image": "assets/images/people2.png", "name": "John Dalton" , "date": "08 July 2022"},
  ];

  _selectTimePeriod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            child: Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: _currentIndex == 0 ? colors.green : Theme.of(context).colorScheme.gray,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Paid",
                  style: TextStyle(
                      color: _currentIndex == 0
                          ? colors.whit
                          : colors.fntClr,
                      //Theme.of(context).colorScheme.lightWhite,
                      fontSize: 16,
                  fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            child: Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: _currentIndex == 1 ? colors.primary :  Theme.of(context).colorScheme.gray,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Pending",
                  style: TextStyle(
                      color: _currentIndex == 1
                          ? colors.whit
                          : colors.fntClr,
                      fontSize: 16,
                  fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            child: Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: _currentIndex == 2 ? colors.red :  Theme.of(context).colorScheme.gray,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Rejected",
                  style: TextStyle(
                      color: _currentIndex == 2
                          ? colors.whit
                          : colors.fntClr,
                      fontSize: 16,
                  fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Invoice History", context),
      body: Column(
        children: [
          _selectTimePeriod(),
          _currentIndex == 0 ?
          Expanded(
            child: ListView.builder(
                itemCount: therapists.length,
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> InvoiceDetails(status: 0,)));
                      },
                      child: invoiceCard(context, therapists, index, true, colors.green, "Paid"));
                }),
          )
          : _currentIndex == 1 ?
          Expanded(
            child: ListView.builder(
                itemCount: therapists.length,
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> InvoiceDetails(status: 1,)));
                      },
                      child: invoiceCard(context, therapists, index, true, colors.primary, "Pending"));
                }),
          )
          :  Expanded(
            child: ListView.builder(
                itemCount: therapists.length,
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> InvoiceDetails(status: 2,)));
                      },
                      child: invoiceCard(context, therapists, index, true, colors.red, "Rejected"));
                }),
          ) ,
        ],
      ),
    );
  }
}
