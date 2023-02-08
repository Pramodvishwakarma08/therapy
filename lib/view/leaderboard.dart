import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/Helper/widgets.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> therapists = [
    {"image": "assets/images/profile2.png", "name": "John Wick", "level": "Level-3", "rank" : "4"},
    {"image": "assets/images/profile3.png", "name": "Jack Sparrow" , "level": "Level-3", "rank" : "5"},
    {"image": "assets/images/profile2.png", "name": "Tony Stark" , "level": "Level-3", "rank" : "6"},
    {"image": "assets/images/profile3.png", "name": "John Dalton" , "level": "Level-3", "rank" : "7"},
    {"image": "assets/images/profile2.png", "name": "John Wick", "level": "Level-3", "rank" : "8"},
    {"image": "assets/images/profile3.png", "name": "Jack Sparrow" , "level": "Level-3", "rank" : "9"},
    {"image": "assets/images/profile2.png", "name": "Tony Stark" , "level": "Level-3", "rank" : "10"},
    {"image": "assets/images/profile3.png", "name": "John Dalton" , "level": "Level-3", "rank" : "11"},
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
                  color: _currentIndex == 0 ? colors.primary : Theme.of(context).colorScheme.lightWhite,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Weekly",
                  style: TextStyle(
                      color: _currentIndex == 0
                          ? colors.whit
                          : Theme.of(context).colorScheme.fontClr,
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
                  color: _currentIndex == 1 ? colors.primary : Theme.of(context).colorScheme.lightWhite,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Monthly",
                  style: TextStyle(
                      color: _currentIndex == 1
                          ? colors.whit
                          : Theme.of(context).colorScheme.fontClr,
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
                  color: _currentIndex == 2 ? colors.primary :  Theme.of(context).colorScheme.lightWhite,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Yearly",
                  style: TextStyle(
                      color: _currentIndex == 2
                          ? colors.whit
                          : Theme.of(context).colorScheme.fontClr,
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

  _leadersHeader(){
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25, top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leader(false, 'assets/images/user2.png', "John Wick", "2", "450", context),
          leader(true, 'assets/images/user1.png', "Tony Stark", "1", "500", context),
          leader(false, 'assets/images/user3.png', "Jack Sparrow", "3", "300", context),
        ],
      ),
    );
  }

  _ranking(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height/1.8,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 12.0,
                  offset: Offset(0.75, 0.75)
              )
            ],
          color: Theme.of(context).colorScheme.lightWhite,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50), )
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30.0, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Current Rank",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Theme.of(context).colorScheme.fontColor,
              ),),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: therapists.length,
                    itemBuilder: (context, index){
                      return leaderCard(
                          context, therapists, index,
                        "${therapists[index]['rank']}", "400"
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.secondary1,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            themeTitleText("Leaderboard", context, 26),
            _selectTimePeriod(),
            const SizedBox(height: 10,),
            _leadersHeader(),
            _ranking()
          ],
        ),
      ),

      // bottomSheet:


      // _ranking(),
    );
  }
}
