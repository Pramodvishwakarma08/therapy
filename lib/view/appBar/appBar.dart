import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';

// class CustomAppBar extends StatelessWidget {
//   final String? title;
//   const CustomAppBar({Key? key, this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: colors.primary,
//         title: Text(title!),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: colors.whit,),
//         ),
//       ),
//     );
//   }
// }


AppBar customAppBar(title, context){
  return AppBar(
    elevation: 0,
    backgroundColor: colors.primary,
    title: Text(title!,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),),
    centerTitle: true,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios, color: colors.whit,),
    ),
  );
}