import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';


class CustomAppBtn extends StatelessWidget {

  final String? title;
  final VoidCallback? onPress;
  double? height;
  double? width;
  double? fSize;
  IconData? icon;
  CustomAppBtn({Key? key,
    this.title, this.onPress, this.height, this.width, this.fSize, this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: colors.whit,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: colors.primary)
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(
            "$title",
            style:  TextStyle(
              color: colors.primary,
              fontSize: fSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );

  }
}
