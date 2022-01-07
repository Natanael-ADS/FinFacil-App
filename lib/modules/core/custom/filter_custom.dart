import 'package:finfacil_app/modules/core/const/color_const.dart';
import 'package:finfacil_app/modules/core/const/image_const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFilter extends StatefulWidget {
  Function onPressedPrevious = () {};
  Function onPressedNext = () {};
  String contentText = "n/d";
  double height = 80;

  CustomFilter({
    this.onPressedPrevious,
    this.onPressedNext,
    this.contentText,
    this.height,
  });

  @override
  _CustomFilterState createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 40,
            onPressed: widget.onPressedPrevious,
            icon: Image.asset(
              ImageConst.PREVIOUS,
              color: ColorConst.THEME_1,
            ),
          ),
          SizedBox(
            height: 20,
            width: 150,
            child: Center(
              child: Text(
                widget.contentText ?? "n/d",
                style: TextStyle(fontSize: 20, color: ColorConst.TEXT_1),
              ),
            ),
          ),
          IconButton(
            iconSize: 40,
            onPressed: widget.onPressedNext,
            icon: Image.asset(
              ImageConst.NEXT,
              color: ColorConst.THEME_1,
            ),
          ),
        ],
      ),
    );
  }
}
