import 'dart:developer' as logger;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timer_test_project/domain/core/utilities/colors.dart';
import 'package:timer_test_project/domain/core/utilities/strings.dart';

class NewTimer extends StatefulWidget {
  const NewTimer({Key? key}) : super(key: key);

  @override
  State<NewTimer> createState() => _NewTimerState();
}

class _NewTimerState extends State<NewTimer> {
  int _randomNumber = 10;

  void randomNumber() {
    logger.log("randomNumber: Started");

    var random = Random();

    int min = 1;

    int max = 60;

    int newRandomNumber = min + random.nextInt(max - min);

    setState(() {
      _randomNumber = newRandomNumber;
    });
    logger.log("_randomNumber:$_randomNumber");
  }

  onPressedStartRandomTimer() {
    logger.log("onPressedStartRandomTimer Started");
    randomNumber();
    Navigator.pop(
      context,
      _randomNumber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildNewTimerBody(context),
    );
  }

  Container buildNewTimerBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.15,
        child: ElevatedButton(
          style: buildButtonStyle(),
          onPressed: onPressedStartRandomTimer,
          child: buildStartRandomTimerText(context),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(Strings.cNewTimer),
    );
  }

  ButtonStyle buildButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.redColor2));
  }

  Text buildStartRandomTimerText(BuildContext context) {
    return Text(
      Strings.cStartRandomTimer,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
