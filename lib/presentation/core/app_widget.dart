import 'package:flutter/material.dart';
import 'package:timer_test_project/domain/core/utilities/app_theme.dart';
import 'package:timer_test_project/domain/core/utilities/strings.dart';
import 'package:timer_test_project/presentation/timer_list/timer_list.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const TimerList(title: Strings.cTimerListTitle),
    );
  }
}
