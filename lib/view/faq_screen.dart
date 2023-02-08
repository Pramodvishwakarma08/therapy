import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("FAQ", context),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),
          children: [
           Card(
             elevation: 2,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8)
             ),
             color: Colors.white,
             child: ExpansionTile(
               collapsedTextColor: Colors.black,
               textColor: Colors.black,
               title: Text(
                 "Lorem Ipsum is simply dummy",
                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
               ),
               children: <Widget>[
                 ListTile(
                   title: Text(
                     "Lorem Ipsum is simply dummy text of the and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it Lorem Ipsum is simply dummy text and typesetting industry.",
                     style: TextStyle(fontWeight: FontWeight.w500,color: colors.subTxtClr,fontSize: 14),
                   ),
                 )
               ],
             ),

           ),
            SizedBox(height: 10,),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              color: Colors.white,
              child: ExpansionTile(
                collapsedTextColor: Colors.black,
                textColor: Colors.black,
                title: Text(
                  "Lorem Ipsum is simply dummy",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Lorem Ipsum is simply dummy text of the and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it Lorem Ipsum is simply dummy text and typesetting industry.",
                      style: TextStyle(fontWeight: FontWeight.w500,color: colors.subTxtClr,fontSize: 14),
                    ),
                  )
                ],
              ),

            ),
            SizedBox(height: 10,),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              color: Colors.white,
              child: ExpansionTile(
                collapsedTextColor: Colors.black,
                textColor: Colors.black,
                title: Text(
                  "Lorem Ipsum is simply dummy",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Lorem Ipsum is simply dummy text of the and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it Lorem Ipsum is simply dummy text and typesetting industry.",
                      style: TextStyle(fontWeight: FontWeight.w500,color: colors.subTxtClr,fontSize: 14),
                    ),
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
