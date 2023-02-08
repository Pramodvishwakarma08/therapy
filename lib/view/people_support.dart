import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/job_details.dart';
import 'package:therapy/view/visits/visit_history.dart';

class PeopleSupport extends StatelessWidget {
   PeopleSupport({Key? key}) : super(key: key);

  List<Map<String, dynamic>> supportedPeople = [
    {"image": "assets/images/people1.png", "name": "John Wick", "date": "08 July 2022", "status" : "Active"},
    {"image": "assets/images/people2.png", "name": "Jack Sparrow" , "date": "08 July 2022", "status": "Active"},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.simmerHigh,
      appBar:  customAppBar("People I Support", context),
      body: ListView.builder(
          itemCount: supportedPeople.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Visits()));
              },
                child: supportedCard(context, supportedPeople, index, true, true));
          }),
    );
  }
}