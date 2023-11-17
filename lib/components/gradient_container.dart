import 'package:flutter/material.dart';
import 'package:diceapp/dice.dart';

const beginAlignment=Alignment.topLeft;
const endAlignment=Alignment.bottomRight;





class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key,required this.colors}) : super(key: key);
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient
            (
              begin: beginAlignment,
              end: endAlignment,
              colors: colors,
          ),
      ),
      child: const Dice()
    );
  }
}
