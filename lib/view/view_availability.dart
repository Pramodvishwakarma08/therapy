import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';

class ViewAvailability extends StatefulWidget {
  const ViewAvailability({Key? key}) : super(key: key);

  @override
  State<ViewAvailability> createState() => _ViewAvailabilityState();
}

class _ViewAvailabilityState extends State<ViewAvailability> {

  int currentIndex = 0;

  List<Map<String, dynamic>> weeklyLIist = [
    {"time": "9am to 1pm", "day": "Mon",  "date": "03 Jan 2023","status":"Available"},
    {"time": "9am to 1pm", "day": "Tue",  "date": "04 Jan 2023","status":"Available"},
    {"time": "9am to 1pm", "day": "Web",  "date": "05 Jan 2023","status":"Available"},
    {"time": "9am to 1pm", "day": "Thu",  "date": "06 Jan 2023","status":"Available"},
    {"time": "9am to 1pm", "day": "Fri",  "date": "07 Jan 2023","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "Sat",  "date": "08 Jan 2023","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "Sun",  "date": "09 Jan 2023","status":"Not-Available"},
  ];

  List<Map<String, dynamic>> monthlyLIist = [
    {"time": "9am to 1pm", "day": "1",  "date": "03 Jan 2023","status":"Available"},
    {"time": "9am to 1pm", "day": "2",  "date": "04 Jan 2023","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "3",  "date": "05 Jan 2023","status":"Available"},
    {"time": "9am to 1pm", "day": "4",  "date": "06 Jan 2023","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "5",  "date": "07 Jan 2023","status":"Not-Available"},
    {"time": "9am to 1pm", "day": "6",  "date": "08 Jan 2023","status":"Available"},
    {"time": "9am to 1pm", "day": "7",  "date": "09 Jan 2023","status":"Not-Available"},
  ];

  _weekly(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15, bottom: 10),
          child: Container(
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
              initialSelectedRange: PickerDateRange(DateTime.now(), DateTime.now().add(Duration(days: 7))),
              //DateTime.now().add(Duration(days: 7)),
              selectionColor: colors.primary,
              startRangeSelectionColor: colors.primary,
              endRangeSelectionColor: colors.primary,
              rangeSelectionColor: colors.primary,
              // initialSelectedDates: [DateTime.now(), DateTime.now().add(Duration(days: 7))],
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
        ),
        Expanded(
          child: ListView.builder(
              itemCount: weeklyLIist.length,
              shrinkWrap: true,
              itemBuilder: (context,i){
                return availableCardWidget(context, weeklyLIist, i);
              }),
        ),
      ],
    );
  }

  _monthly(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15, bottom: 10),
          child: Container(
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
              initialSelectedRange: PickerDateRange(DateTime.now(), DateTime.now().add(Duration(days: 30))),
              //DateTime.now().add(Duration(days: 7)),
              selectionColor: colors.primary,
              startRangeSelectionColor: colors.primary,
              endRangeSelectionColor: colors.primary,
              rangeSelectionColor: colors.primary,
              // initialSelectedDates: [DateTime.now(), DateTime.now().add(Duration(days: 7))],
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
        ),
        Expanded(
          child: ListView.builder(
              itemCount: monthlyLIist.length,
              shrinkWrap: true,
              itemBuilder: (context,i){
                return availableCardWidget(context, monthlyLIist, i);
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Availability", context),
      body:Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                              text: 'Weekly',
                            ),
                            Tab(
                              text: 'Monthly',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        _weekly(),
                        _monthly(),
                        // availableWidget(),
                        // notAvailableWidget(),
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
