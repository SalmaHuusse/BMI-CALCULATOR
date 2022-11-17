


import 'package:flutter/material.dart';

import 'constans.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitel , required this.onTap});
  late final String buttonTitel;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text( buttonTitel ,
          style: kLargeButtonTextStyle,)),
        color: kBottomContainrtColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
