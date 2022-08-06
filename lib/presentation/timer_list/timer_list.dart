import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timer_test_project/domain/core/utilities/strings.dart';
import 'package:timer_test_project/domain/timer/timer.dart';
import 'package:timer_test_project/presentation/new_timer/new_timer.dart';
import 'package:timer_test_project/presentation/timer_list/widget/timer_list_item.dart';

class TimerList extends StatefulWidget {
  const TimerList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TimerList> createState() => _TimerListState();
}

class _TimerListState extends State<TimerList> {
  List<TimerModel> timerList = [];
  late int randomTimerValue;

  Future<int> getTheRandomValue() async {
    log("getTheRandomValue Started");
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewTimer()),
    );
  }

  addToTheTimerListNewValue(int timerValue, String name) {
    timerList.add(TimerModel(
      timerName: name,
      timerValue: timerValue.toString(),
      timerStatus: timerList.length < 4 ? "running" : "paused",
      finished: timerValue == 0 ? true : false,
    ));
  }

  updateTheList(int index) {
    log("updateTheList Started");
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (int.parse(timerList[index].timerValue) == 0) {
        timerList.removeWhere((item) => int.parse(item.timerValue) == 0);
      } else {
        setState(
          () {
            (int.parse(timerList[index].timerValue) > 0)
                ? timerList[index].timerValue =
                    (int.parse(timerList[index].timerValue) - 1).toString()
                : (int.parse(timerList[index].timerValue) == 0)
                    ? {
                        timerList[index].finished = true,
                      }
                    : {};
          },
        );
      }
    });
  }

  void _addNewTimer() async {
    log("_incrementCounter Started");
    /**1**/

    randomTimerValue =
        await getTheRandomValue().whenComplete(() => setState(() {}));
    log("received new randomTimerValue : $randomTimerValue");

    /**2**/
    addToTheTimerListNewValue(randomTimerValue, timerList.length.toString());

    /**3**/
    log("timerList.length:${timerList.length}");
    if (timerList.isNotEmpty) updateTheList(timerList.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
      floatingActionButton: buildAddNewTimerBtn(),
    );
  }

  Container buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTimerList(context),
          const Spacer(),
          buildTotal(context),
          buildSizedBox(),
        ],
      ),
    );
  }

  SizedBox buildTimerList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          primary: true,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: timerList.length,
          itemBuilder: (BuildContext context, int index) {
            return (timerList[index].finished)
                ? Container()
                : TimerListItem(
                    timerItemIndex: timerList[index].timerName,
                    timerItemValue: timerList[index].timerStatus == "running"
                        ? timerList[index].timerValue
                        : timerList[index].timerStatus,
                    runningTimer: timerList[index].timerStatus == "running"
                        ? true
                        : false,
                  );
          }),
    );
  }

  FloatingActionButton buildAddNewTimerBtn() {
    return FloatingActionButton(
      onPressed: _addNewTimer,
      tooltip: Strings.cAddNewTimer,
      child: const Icon(Icons.add),
    );
  }

  SizedBox buildSizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Row buildTotal(BuildContext context) {
    return Row(
      children: [
        Text(
          Strings.cTotal,
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          '${timerList.length}',
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(widget.title),
    );
  }
}
