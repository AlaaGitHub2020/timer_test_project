class TimerModel {
  String timerName;
  String timerValue;
  String timerStatus;
  bool finished;

  TimerModel({
    required this.timerName,
    required this.timerValue,
    required this.timerStatus,
    this.finished = false,
  });
}
