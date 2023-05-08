import 'package:flutter_bloc/flutter_bloc.dart';

import 'speedo_event.dart';
import 'speedo_state.dart';

class SpeedoBloc extends Bloc<SpeedoEvent, SpeedoState> {
  int value;

  SpeedoBloc({required this.value}) : super(SpeedmeterState(value: 0)) {
    on<SpeedoEvent>((event, emit) {
      if (event is ClickEvent) {
        emit(SpeedmeterState(value: event.eventValue));
      }
    });
  }
}
