import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';

class ViewSchedule extends StatefulWidget {
  const ViewSchedule({Key? key}) : super(key: key);

  @override
  State<ViewSchedule> createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {

  List<Map<String, dynamic>> supportedPeople = [
    {"image": "assets/images/people1.png", "name": "John Wick", "date": "08 July 2022", "status" : "Active"},
    {"image": "assets/images/people2.png", "name": "Jack Sparrow" , "date": "08 July 2022", "status": "Active"},
  ];
  List<Map<String, dynamic>> sessions = [
    {"session": "1", "date": "09 July 2022", "time" : "9am to 1pm"},
    {"session": "2", "date": "10 July 2022", "time" : "2pm to 8pm"},
    {"session": "3", "date": "11 July 2022", "time" : "5pm to 9pm"},
    {"session": "4", "date": "12 July 2022", "time" : "7am to 11pm"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Schedule", context),
      body: Column(
        children: [
          supportedCard(context, supportedPeople, 0, false, false),
          Expanded(
            child: ListView.builder(
              itemCount: sessions.length,
                itemBuilder: (context, index){
              return sessionCard(context, sessions, index);
            }),
          )
        ],
      ),
    );
  }
}
