import 'package:flutter/material.dart';
import 'package:timer_test_project/domain/core/utilities/colors.dart';
import 'package:timer_test_project/domain/core/utilities/strings.dart';

class TimerListItem extends StatelessWidget {
  final String timerItemIndex;
  final String timerItemValue;
  final bool runningTimer;

  const TimerListItem({
    Key? key,
    required this.timerItemIndex,
    required this.timerItemValue,
    required this.runningTimer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: ListTile(
        leading: buildTimerItemNameText(context),
        trailing: buildTimerValueText(context),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
            width: 2.0, color: AppColors.blackColor1.withOpacity(0.4)),
      ),
    );
  }

  Text buildTimerItemNameText(BuildContext context) {
    return Text(
      "${Strings.appTitle} $timerItemIndex",
      style: Theme.of(context).textTheme.headline2,
    );
  }

  Text buildTimerValueText(BuildContext context) {
    return Text(
      runningTimer ? "$timerItemValue ${Strings.cSecond}" : timerItemValue,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
