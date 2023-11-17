import 'package:flutter/material.dart';
import 'components/gradient_container.dart';

const beginAlignment=Alignment.topLeft;
const endAlignment=Alignment.bottomRight;


class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({Key? key}) : super(key: key);




  @override



    Widget build(BuildContext context) {
      return  MaterialApp(
        title: 'Dice App',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: const Text('Roller Dice App'),
          ),
          body:const GradientContainer(
            colors: [
              Color.fromARGB(255, 115, 50, 0),
              Color.fromARGB(255, 228, 213, 0)
            ],
          ),

        ),
      );
    }
  }


