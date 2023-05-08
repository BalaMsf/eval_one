import 'package:eval_one/Screens/reading_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_pattern/speedo_bloc.dart';
import '../bloc_pattern/speedo_event.dart';
import '../bloc_pattern/speedo_state.dart';
import '../constants.dart';
import 'circle.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomePage> {
  final myController = TextEditingController();
  String? textvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          AppConstants.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: SizedBox(
                height: 150,
                width: 400,
                child: Center(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          textvalue = value;
                        },
                        controller: myController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter the range',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<SpeedoBloc>().add((ClickEvent(
                              int.tryParse(textvalue ?? '0') ?? 0)));
                        },
                        child: Text(AppConstants.buttonText)),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: BlocBuilder<SpeedoBloc, SpeedoState>(
                            builder: (context, state) {
                          if (state is SpeedmeterState) {
                            textvalue = state.value.toString();
                          }
                          return CustomPaint(
                            size: const Size(270, 270),
                            painter: CircleWidget(
                                value: int.tryParse(textvalue ?? '0') ?? 0),
                            foregroundPainter: ReadingValue(),
                          );
                        }),
                      ),
                      // ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
