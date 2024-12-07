import 'package:flutter/material.dart';

import 'widgets/bottom_buttons.dart';
import 'widgets/build_text_field_and_date_time_picker.dart';
import 'widgets/my_app_bar.dart';
import 'widgets/top_text_widget.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const MyAppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TopTextWidget(),
                const BuildTextFieldAndDateTimePicker(),
                bottomButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
