import 'package:eval_one/view/reading_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_pattern/speedo_bloc.dart';
import '../bloc_pattern/speedo_event.dart';
import '../bloc_pattern/speedo_state.dart';
import '../constants/constants.dart';
import 'circle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomePage> {
  final myController = TextEditingController();
  String? inputValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
            child: Text(
          AppConstants.title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Center(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          inputValue = value;
                        },
                        controller: myController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter the range',
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<SpeedoBloc>()
                              .add((ClickEvent(int.parse(inputValue ?? '0'))));
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                        },
                        child: Text(AppConstants.buttonText)),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: BlocBuilder<SpeedoBloc, SpeedoState>(
                          builder: (context, state) {
                        if (state is SpeedmeterState) {
                          inputValue = state.value.toString();
                        }
                        return CustomPaint(
                          size: const Size(270, 270),
                          painter: CircleWidget(
                              inputValue: int.parse(inputValue ?? '0')),
                          foregroundPainter: ReadingValue(),
                        );
                      }),
                      // ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
