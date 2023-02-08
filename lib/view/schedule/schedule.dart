import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:intl/intl.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  List<Map<String, dynamic>> therapists = [
    {"image": "assets/images/profile2.png", "name": "John Wick", "date": "10:00AM to 12:00PM"},
    {"image": "assets/images/profile3.png", "name": "Jack Sparrow" , "date": "02:00PM to 03:00PM"},
    {"image": "assets/images/profile2.png", "name": "Tony Stark" , "date": "04:00PM to 06:00PM"},
    {"image": "assets/images/profile3.png", "name": "John Dalton" , "date": "06:00PM to 08:00PM"},
  ];

  _availableFeature(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          secTitleText("Today's Schedule", context, 18),
          const SizedBox(height: 20,),
          ListView.builder(
              shrinkWrap: true,
              itemCount: therapists.length,
              itemBuilder: (context, index){
                return availabilityCard(
                    context, therapists, index, false
                );
              })
        ],
      ),
    );

  }
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  String _dateValue = '';
  var dateFormate;

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        //firstDate: DateTime.now().subtract(Duration(days: 1)),
        // lastDate: new DateTime(2022),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: colors.primary,
                accentColor: Colors.black,
                colorScheme: const ColorScheme.light(primary:  colors.primary),
                // ColorScheme.light(primary: const Color(0xFFEB6C67)),
                buttonTheme:
                ButtonThemeData(textTheme: ButtonTextTheme.accent)),
            child: child!,
          );
        });
    if (picked != null)
      setState(() {
        String yourDate = picked.toString();
        _dateValue = convertDateTimeDisplay(yourDate);
        print(_dateValue);
        dateFormate = DateFormat("dd/MM/yyyy").format(DateTime.parse(_dateValue ?? ""));
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.simmerHigh,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.primary,
        title: const Text("Availability Schedule"),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            // Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: colors.primary,),
        ),
      ),
      body: _availableFeature(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.whit,
        onPressed: () async{
          _selectDate();
          // DateTime? pickedDate = await showDatePicker(
          //     context: context, initialDate: DateTime.now(),
          //     firstDate: DateTime.now() ,
          //         //- not to allow to choose before today.
          //     lastDate: DateTime(2101)
          // );
          //
          // if(pickedDate != null ){
          //   print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
          //   // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          //   // print(formattedDate); //formatted date output using intl package =>  2021-03-16
          //   //you can implement different kind of Date Format here according to your requirement
          //
          //   // setState(() {
          //   //   dateinput.text = formattedDate; //set output date to TextField value.
          //   // });
          // }else{
          //   print("Date is not selected");
          // }
        },
        child: const Icon(Icons.calendar_month,
        color: colors.primary,),

      ),
    );
  }
}
