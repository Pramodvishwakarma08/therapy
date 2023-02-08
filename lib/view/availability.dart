import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/buttons/custom_button.dart';
import 'package:therapy/view/view_availability.dart';

class Availability extends StatefulWidget {
  const Availability({Key? key}) : super(key: key);

  @override
  State<Availability> createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  TimeOfDay? selectedTime1;
  TimeOfDay? selectedTime2;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

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

  Widget availableWidget(){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
           decoration: BoxDecoration(
             color: Theme.of(context).colorScheme.lightWhite,
               boxShadow: <BoxShadow>[
                 BoxShadow(
                     color: Colors.grey,
                     blurRadius: 5.0,
                     offset: Offset(0.75, 0.75)
                 )
               ],
              borderRadius: BorderRadius.circular(10)
            ),
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
              initialDisplayDate: DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: colors.primary,
              startRangeSelectionColor: colors.primary,
              endRangeSelectionColor: colors.primary,
              rangeSelectionColor: colors.primary,
              rangeTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
              enablePastDates: false,
              headerHeight: 50,
              headerStyle: const DateRangePickerHeaderStyle(
                backgroundColor: colors.primary,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                      color: colors.whit,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  )
              ),
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: AppBtn(
              onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAvailability()));
              },
              title: "Update",
              width: MediaQuery.of(context).size.width,
              height: 45,
              fSize: 16,
            ),
          ),
          CustomAppBtn(
            onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAvailability()));
            },
            title: "View Availability",
            height: 45,
            width: MediaQuery.of(context).size.width,
            fSize: 16,
          )
        ],
      ),
    );
  }

  Widget notAvailableWidget(){
    return  Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.lightWhite,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0.75, 0.75)
                  )
                ],
                borderRadius: BorderRadius.circular(10)
            ),
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
              initialDisplayDate: DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: colors.primary,
              startRangeSelectionColor: colors.primary,
              endRangeSelectionColor: colors.primary,
              rangeSelectionColor: colors.primary,
              rangeTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
              enablePastDates: false,
              headerHeight: 50,
              headerStyle: const DateRangePickerHeaderStyle(
                  backgroundColor: colors.primary,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                      color: colors.whit,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: AppBtn(
              onPress: (){},
              title: "Update",
              width: MediaQuery.of(context).size.width,
              height: 45,
              fSize: 16,
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.simmerHigh,
      appBar: customAppBar("Availability", context),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  Card(
                    elevation : 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: colors.whit),
                      child: const Center(
                        child: TabBar(
                          labelColor: colors.primary,
                          unselectedLabelColor: colors.subTxtClr,
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: colors.primary,
                              fontWeight: FontWeight.w500),
                          unselectedLabelStyle: TextStyle(
                              fontSize: 18.0,
                              color: colors.fntClr,
                              fontWeight: FontWeight.normal),
                          indicator: UnderlineTabIndicator(
                              borderSide: const BorderSide(
                                  width: 2.5,
                                  color: colors.primary)
                          ),
                          // BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8),
                          //     color: Color(0xFF619aa5)),
                          tabs: <Widget>[
                            Tab(
                              text: 'Available',
                            ),
                            Tab(
                              text: 'Not Available',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        availableWidget(),
                        notAvailableWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
