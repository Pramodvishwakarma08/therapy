import 'dart:io';

import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';

class AppBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onPress;
  double? height;
  double? width;
  double? fSize;
  IconData? icon;
   AppBtn({Key? key, this.title, this.onPress, this.height, this.width, this.fSize, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0 ,
        primary: colors.primary,
        shape: const StadiumBorder(),
        fixedSize: Size(width!, height!)
      ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$title',
    style: TextStyle(
      fontSize: 18,
      //fSize ,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.lightWhite,
    ),),
           icon!=  null ?  Icon(icon,
            size: 18,)
               : const SizedBox.shrink()
          ],
        ));
  }
}




