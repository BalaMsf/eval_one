abstract class SpeedoEvent {}

class ClickEvent extends SpeedoEvent {
  int eventValue;

  ClickEvent(this.eventValue);
}
