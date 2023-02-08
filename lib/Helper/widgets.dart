import 'dart:io';
import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';

Text titleText(String data, context, double fSize){
  return Text(data,
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: Platform.isAndroid ? fSize: fSize*1.3,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.fontColor,
  ),);
}

Text titleTextNormal(String data, context, double fSize){
  return Text(data,
    style: TextStyle(
      fontSize: Platform.isAndroid ? fSize: fSize*1.3,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.fontColor,
    ),);
}
Text subTitleText(String data, context, double fSize){
  return Text(data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: Platform.isAndroid ? fSize: fSize*1.3,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.fontClr,
    ),);
}
Text secTitleText(String data, context, double size ){
  return Text(data,
    style:  TextStyle(
      fontSize: Platform.isAndroid ? size: size*1.3,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.secColor
      //Theme.of(context).colorScheme.fontColor,
    ),);
}
Widget textBtn( onPress, context){
  return Padding(
    padding: const EdgeInsets.all(0),
    child: TextButton(onPressed: onPress, child: secTitleText("Resend", context, 16),),
  );
}

Text themeTitleText(String data, context, double size ){
  return Text(data,
    style:  TextStyle(
        fontSize:  Platform.isAndroid ? size: size*1.3,
        fontWeight: FontWeight.bold,
        color: colors.primary
      //Theme.of(context).colorScheme.fontColor,
    ),);
}
Widget leader(bool isLeader, String image, name, rank, coins, context){
  return Column(
    children: [
      Container(
        height: isLeader ? 140 : 130,
        child: Column(
          children: [
            isLeader ?
            Image.asset('assets/images/crown.png', height: 40, width: 40,)
                : Column(
              children: [
                Text("$rank",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: colors.fntClr,
                  ),),
                // subTitleText("$rank", context, 14),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Icon(
                    rank == "3" ?
                    Icons.arrow_drop_down_outlined
                        : Icons.arrow_drop_up_outlined,
                    size: 30,
                    color: rank == "3" ?
                    Colors.red : Colors.green,
                  ),
                )
              ],
            ),
            CircleAvatar(
              radius: rank == "1" ? 50 : 35,
              child: Image.asset(image),
            ),
          ],
        ),
      ),
      SizedBox(height:  isLeader ? 10 : 0,),
      Text(name,
      style: TextStyle(
        fontSize: isLeader ? 16 : 14,
        fontWeight: isLeader ? FontWeight.w600 : FontWeight.w500
      ),),
      Row(
        children: [
          Text("${coins.toString()} ",
            style: TextStyle(
                fontSize: isLeader ? 16 : 14,
                fontWeight: isLeader ? FontWeight.w600 : FontWeight.w500
            ),),
          Image.asset('assets/images/coin.png' , height: 12,)
        ],
      )

    ],
  );
}

Widget textField(context, controller,String title, double height, int maxLength){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:  EdgeInsets.only(left: 5.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 15, color: colors.fntClr, fontWeight: FontWeight.w500),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 10),
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width-40,
          child: TextFormField(
            maxLength: maxLength,
            // maxLines: 4,
            controller: controller,
            // keyboardType: TextInputType.number,
            validator: (v) {
              if (v!.isEmpty) {
                return "This is field is required!";
              }
            },
            decoration: InputDecoration(
              counterText: "",
              // suffix: const Icon(Icons.hourglass_top_outlined),
              // hintText: "Number of hours",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                        color: colors.fntClr.withOpacity(0.5)))),
          ),
        ),
      ),
    ],
  );
}

Widget drawerItem(String image, title, onPress){
  return InkWell(
    onTap: onPress,
    child: Container(
      height: 45,
      child: Row(
        children: [
          ImageIcon(
            AssetImage(
              image
            ),
            color: colors.fntClr,
          ),
          SizedBox(width: 20,),
          Text(title,
          style: const TextStyle(
            color: colors.fntClr,
            fontSize: 18
          ),)
        ],
      ),
    ),
  );
}

setSnackbar(String msg, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
    ),
    backgroundColor: Theme.of(context).colorScheme.lightWhite,
    elevation: 1.0,
  ));
}