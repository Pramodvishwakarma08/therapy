import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:intl/intl.dart';
import 'package:therapy/view/buttons/appButton.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  var items = [
    'Non face to face service',
    'Direct Service',
    'Short Notice Cancellation',
    'Provide Travel',
    'Report Writing(NDIA required)',
    'Telehealth'
  ];
  String? _selectValue;
  int _selectDay = 0;

  String? dropdownValue;

  String _dateValue = '';
  var dateFormate;
  String? sDate;

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  // TextEditingController dateController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  // TextEditingController futureController = TextEditingController();

  // Future _selectDate() async {
  //   DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: new DateTime.now(),
  //       firstDate: DateTime.now(),
  //       lastDate: DateTime(2025),
  //       //firstDate: DateTime.now().subtract(Duration(days: 1)),
  //       // lastDate: new DateTime(2022),
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData.light().copyWith(
  //               primaryColor: Colors.black, //Head background
  //               accentColor: Colors.black,
  //               colorScheme:
  //               ColorScheme.light(primary:  colors.primary),
  //               buttonTheme:
  //               ButtonThemeData(textTheme: ButtonTextTheme.primary)),
  //           child: child!,
  //         );
  //       });
  //   if (picked != null)
  //     setState(() {
  //       String yourDate = picked.toString();
  //       _dateValue = convertDateTimeDisplay(yourDate);
  //       print(_dateValue);
  //       dateFormate =
  //           DateFormat("dd/MM/yyyy").format(DateTime.parse(_dateValue ?? ""));
  //       sDate =
  //           DateFormat("yyyy-MM-dd").format(DateTime.parse(_dateValue ?? ""));
  //       dateController.text = dateFormate;
  //     });
  // }

  // String convertDateTimeDisplay(String date) {
  //   final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  //   final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
  //   final DateTime displayDate = displayFormater.parse(date);
  //   final String formatted = serverFormater.format(displayDate);
  //   return formatted;
  // }

  TimeOfDay? selectedTime1;
  TimeOfDay? selectedTime2;

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        useRootNavigator: true,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(primary: colors.primary),
                buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(primary: colors.primary))),
            child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child!),
          );
        });
    if (timeOfDay != null && timeOfDay != selectedTime1) {
      setState(() {
        selectedTime1 = timeOfDay.replacing(hour: timeOfDay.hourOfPeriod);
        startTimeController.text = selectedTime1!.format(context);
      });
    }
    var per = selectedTime1!.period.toString().split(".");
    print(
        "selected time here ${selectedTime1!.format(context).toString()} and ${per[1]}");
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        useRootNavigator: true,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(primary: colors.primary),
                buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.light(primary: colors.primary))),
            child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child!),
          );
        });
    if (timeOfDay != null && timeOfDay != selectedTime2) {
      setState(() {
        selectedTime2 = timeOfDay.replacing(hour: timeOfDay.hourOfPeriod);
        endTimeController.text = selectedTime2!.format(context);
      });
    }
    var per = selectedTime2!.period.toString().split(".");
    print(
        "selected time here ${selectedTime2!.format(context).toString()} and ${per[1]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Add Schedule", context),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:

            _visitFields()
        ),
      ),
    );
  }
  Widget _weeksWidget(){
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
      child: Row(
        children: [
          InkWell(
            onTap: (){
             setState((){
               _selectDay = 0;
             });
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: _selectDay == 0 ? colors.primary : colors.whit,
                  borderRadius: BorderRadius.circular(10)
                ),
                height: 40,
                width: 37,
                child:  Center(
                  child: Text("Mon",
                  style: TextStyle(
                    color: _selectDay == 0 ? colors.whit : colors.fntClr,
                  ),),
                ),

              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState((){
                _selectDay = 1;
              });
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: _selectDay == 1 ? colors.primary : colors.whit,
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 40,
                width: 37,
                child:  Center(
                  child: Text("Tue",
                    style: TextStyle(
                      color: _selectDay == 1 ? colors.whit : colors.fntClr,
                    ),),
                ),

              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState((){
                _selectDay = 2;
              });
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: _selectDay == 2 ? colors.primary : colors.whit,
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 40,
                width: 37,
                child:  Center(
                  child: Text("Wed",
                    style: TextStyle(
                      color: _selectDay == 2 ? colors.whit : colors.fntClr,
                    ),),
                ),

              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState((){
                _selectDay = 3;
              });
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: _selectDay == 3 ? colors.primary : colors.whit,
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 40,
                width: 37,
                child:  Center(
                  child: Text("Thu",
                    style: TextStyle(
                      color: _selectDay == 3 ? colors.whit : colors.fntClr,
                    ),),
                ),

              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState((){
                _selectDay = 4;
              });
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: _selectDay == 4 ? colors.primary : colors.whit,
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 40,
                width: 37,
                child:  Center(
                  child: Text("Fri",
                    style: TextStyle(
                      color: _selectDay == 4 ? colors.whit : colors.fntClr,
                    ),),
                ),

              ),
            ),
          ),
          InkWell(
            onTap: (){
             setState((){
               _selectDay = 5;
             });
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: _selectDay == 5 ? colors.primary : colors.whit,
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 40,
                width: 37,
                child:  Center(
                  child: Text("Sat",
                    style: TextStyle(
                      color: _selectDay == 5 ? colors.whit : colors.fntClr,
                    ),),
                ),

              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState((){
                _selectDay = 6;
              });
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: _selectDay == 6 ? colors.primary : colors.whit,
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 40,
                width: 37,
                child:  Center(
                  child: Text("Sun",
                    style: TextStyle(
                      color: _selectDay == 6 ? colors.whit : colors.fntClr,
                    ),),
                ),

              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget _visitFields(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

         Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            "Select Per Week",
            style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.secColor, fontWeight: FontWeight.w600),
          ),
        ),
        _weeksWidget(),


         Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            "Select Time",
            style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.secColor,
            fontWeight: FontWeight.w600),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _selectStartTime(context);
                },
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/2- 25,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.lightWhite,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0.75, 0.75)
                        )
                      ],
                      // border: Border.all(
                      //   color: Theme.of(context).colorScheme.fontClr,
                      // )
                    ),
                    child:
                    selectedTime1 != null
                        ?
                    Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${selectedTime1!.format(context)}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.fontClr,
                          ),),
                        Icon(Icons.access_time,
                          color: Theme.of(context).colorScheme.fontClr,)
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start Time",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.fontClr,
                              fontSize: 15),
                        ),
                        Icon(Icons.access_time,
                          color: Theme.of(context).colorScheme.fontClr,)
                      ],
                    )),
                // TextFormField( controller: locationController,
                //   validator: (v){
                //     if(v!.isEmpty){
                //       return "Enter time";
                //     }
                //   },
                //   readOnly: true,
                //   decoration: InputDecoration(
                //       hintText: "Select time",
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(7),
                //           borderSide: BorderSide(color: appColorBlack.withOpacity(0.5))
                //       )
                //   ),),
              ),
              InkWell(
                onTap: () {
                  _selectEndTime(context);
                },
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/2- 25,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Theme.of(context).colorScheme.lightWhite,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0.75, 0.75)
                        )
                      ],
                      // border: Border.all(
                      //   color: Theme.of(context).colorScheme.fontClr,)
                    ),
                    child:
                    selectedTime2 != null
                        ?
                    Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${selectedTime2!.format(context)}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.fontClr,
                          ),),
                        Icon(Icons.access_time,
                          color: Theme.of(context).colorScheme.fontClr,)
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "End Time",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.fontClr,
                              fontSize: 15),
                        ),
                        const   Icon(Icons.access_time,
                          color: colors.subTxtClr,)
                      ],
                    )),
                // TextFormField( controller: locationController,
                //   validator: (v){
                //     if(v!.isEmpty){
                //       return "Enter time";
                //     }
                //   },
                //   readOnly: true,
                //   decoration: InputDecoration(
                //       hintText: "Select time",
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(7),
                //           borderSide: BorderSide(color: appColorBlack.withOpacity(0.5))
                //       )
                //   ),),
              ),

            ],
          ),
        ),

        Row(
          children: [
            Row(
              children: [
                Radio<String>(
                  value: 'Recurring',
                  activeColor: colors.primary,
                  groupValue: _selectValue,
                  // fillColor: MaterialStateColor.resolveWith(
                  //         (states) => Colors.grey[300]),
                  onChanged: (value) {
                    setState(() {
                      _selectValue = value;
                    });
                  },
                ),
                Text("Recurring", style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.fontClr, fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<String>(
                  value: 'Non Recurring',
                  activeColor: colors.primary,
                  groupValue: _selectValue,
                  // fillColor: MaterialStateColor.resolveWith(
                  //         (states) => Colors.grey[300]),
                  onChanged: (value) {
                    setState(() {
                      _selectValue = value;
                    });
                  },
                ),
                Text("Non Recurring", style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.fontClr, fontWeight: FontWeight.w600),)
              ],
            ),

          ],
        ),

         Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 15),
          child: Text(
            "Comment",
            style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.secColor, fontWeight: FontWeight.w600),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width-40,
            child: TextFormField(
              maxLines: 4,
              style: TextStyle(
                color: Theme.of(context).colorScheme.fontClr
              ),
              controller: commentController,
              // keyboardType: TextInputType.number,
              validator: (v) {
                if (v!.isEmpty) {
                  return "This is field is required!";
                }
              },
              decoration: InputDecoration(
                // suffix: const Icon(Icons.hourglass_top_outlined),
                // hintText: "Number of hours",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.fontClr))),
            ),
          ),
        ),
        const SizedBox(height: 20,),
        // const Padding(
        //   padding:  EdgeInsets.only(left: 5.0),
        //   child: Text(
        //     "Plan for future sessions",
        //     style: TextStyle(fontSize: 15, color: colors.fntClr),
        //   ),
        // ),
        //
        // Padding(
        //   padding: const EdgeInsets.only(top: 5.0, bottom: 10),
        //   child: Container(
        //     height: 100,
        //     width: MediaQuery.of(context).size.width-40,
        //     child: TextFormField(
        //       maxLines: 4,
        //       controller: futureController,
        //       keyboardType: TextInputType.number,
        //       validator: (v) {
        //         if (v!.isEmpty) {
        //           return "This is field is required!";
        //         }
        //       },
        //       decoration: InputDecoration(
        //         // suffix: const Icon(Icons.hourglass_top_outlined),
        //         // hintText: "Plan for future sessions",
        //           border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(7),
        //               borderSide: BorderSide(
        //                   color: colors.fntClr.withOpacity(0.5)))),
        //     ),
        //   ),
        // ),
        AppBtn(
          onPress: (){},
          title: "Update",
          height: 45,
          fSize: 16,
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}
