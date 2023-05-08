class SpeedoState {
  int speedoValue;

  SpeedoState({required this.speedoValue});
}

class SpeedmeterState extends SpeedoState {
  int value;

  SpeedmeterState({required this.value}) : super(speedoValue: 0);
}
