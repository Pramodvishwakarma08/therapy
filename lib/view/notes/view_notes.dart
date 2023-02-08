import 'package:flutter/material.dart';
import 'package:therapy/Helper/card_widgets.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/buttons/appButton.dart';
import 'package:therapy/view/notes/add_notes.dart';

class ViewNotes extends StatefulWidget {
  bool isAdd;
   ViewNotes({Key? key, required this.isAdd}) : super(key: key);

  @override
  State<ViewNotes> createState() => _ViewNotesState();
}

class _ViewNotesState extends State<ViewNotes> {
  List<Map<String, dynamic>> notes = [
    {"name": "John Wick", "time": "15 min", "initial": "JW", "color": "1" },
    {"name": "Mack Gorge", "time": "10 min", "initial": "MG", "color": "2" },
    // {"name": "John Wick", "time": "15 min", "initial": "JW", "color": "1" },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Notes", context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
                itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 20,right: 100),
                child: noteCard(context, notes, index),
              );
            }),
          ),
          widget.isAdd ?
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppBtn(
              height: 45,
              width: MediaQuery.of(context).size.width,
              onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNotes()));
              },
              title: "Add Notes",
            ),
          )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
