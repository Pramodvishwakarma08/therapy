import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';
import 'package:therapy/view/buttons/appButton.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Note", context),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colors.subTxtClr
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Type your note..",
                  hintStyle: TextStyle(
                    color: colors.subTxtClr
                  ),
                  border: InputBorder.none
                ),
                controller: noteController,
              ),
            ),
            AppBtn(
                onPress: (){

                },
              title: "Submit",
              width: MediaQuery.of(context).size.width,
              height: 45,

            )
          ],
        ),
      ),
    );
  }
}
