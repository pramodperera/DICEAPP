import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  dynamic diceNumber;
  String playerOneName = "Player One";
  List<int> playerOne = [];

  String playerTwoName = "Player Two";
  List<int> playerTwo = [];
  int roundCount1 = 0;
  int roundCount2 = 0;






  int getSum(List<int> list) {
    int sum = 0;
    for (int i = 0; i < 5 && i < list.length; i++) {
      sum += list[i];
    }
    return sum;
  }


  List<int> getMaxSumList(List<int> list1, List<int> list2) {
    int sumList1 = getSum(list1);
    int sumList2 = getSum(list2);

    return sumList1 > sumList2 ? list1.take(5).toList() : list2.take(5).toList();
  }


  void changeDice1Face() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerOne.add(diceNumber);
      print('Player One List Values: $playerOne');
      roundCount1++;
    });

    if (roundCount1 > 5) {
      playerOne = [];
      roundCount1 = 0; // Reset roundCount to start over
    }
  }

  void changeDice2Face() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerTwo.add(diceNumber);
      print('Player Two List Values: $playerTwo');
      roundCount2++;
    });

    if (roundCount2 > 5) {
      playerTwo = [];
      roundCount2 = 0; // Reset roundCount to start over
    }
  }

  void resetLists() {
    setState(() {
      playerOne = [];
      playerTwo = [];
      roundCount1 = 0;
      roundCount2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {


    List<int> maxList = getMaxSumList(playerOne, playerTwo);


    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/dice$diceNumber.png',
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: changeDice1Face,
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 28)),
                  child: const Text('PLAYER 1')),
              const SizedBox(
                width: 50,
              ),
              TextButton(
                  onPressed: changeDice2Face,
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 28)),
                  child: const Text('PLAYER 2')),
            ],
          ),
          const SizedBox(height: 20),
          if (roundCount1 >=5 || roundCount2 >=5)
            ElevatedButton(
              onPressed: () {
                print("Max value list: $maxList");
                resetLists();
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28)),
              child: const Text('Calculate and Reset'),
            ),
        ],
      ),
    );
  }
}
