import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';

class Notifications extends StatefulWidget {

  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();

}

class _NotificationsState extends State<Notifications> {
  List<Map<String, dynamic>> notifications = [
    {"image": "assets/images/profile2.png",
      "name": "John Wick",
      "description":"Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content",},
    {"image": "assets/images/user4.png",
      "name": "Jack Sparrow" ,
      "description":"Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content"},
    {"image": "assets/images/user1.png",
      "name": "Tony Stark" ,
      "description":"Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content"},
    {"image": "assets/images/user2.png",
      "name": "John Dalton" ,
      "description":"Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content"},
    {"image": "assets/images/user3.png",
      "name": "David hop" ,
      "description":"Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content"},
    {"image": "assets/images/user1.png",
      "name": "Tom Gill" ,
      "description":"Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content"},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Notifications", context),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: notifications.length,
            itemBuilder: (context, index){
          return notificationCard(context, notifications, index);
        }),
      ),
    );
  }
}
