import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/strings.dart';
import 'custom_text_form_field.dart';
import 'date_picker_widget.dart';
import 'time_picker_widget.dart';

class BuildTextFieldAndDateTimePicker extends StatefulWidget {
  const BuildTextFieldAndDateTimePicker({super.key});

  @override
  _BuildTextFieldAndDateTimePickerState createState() =>
      _BuildTextFieldAndDateTimePickerState();
}

class _BuildTextFieldAndDateTimePickerState
    extends State<BuildTextFieldAndDateTimePicker> {
  // Controllers for managing text input
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime selectedTime = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      height: 495,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              MyString.titleOfTitleTextField,
              style: const TextTheme().headlineMedium,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomTextFormField(
              hintText: '',
              maxLines: 6,
              cursorHeight: 50,
              controller: _titleController, // use controller to manage text
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller:
                    _noteController, // use controller to manage note text
                style:
                    TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  counter: Container(),
                  hintText: MyString.addNote,
                ),
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final selectedTimeFromPicker =
                  await showCupertinoModalPopup<DateTime>(
                context: context,
                builder: (context) {
                  return timePickerWidget(context);
                },
              );
              if (selectedTimeFromPicker != null) {
                setState(() {
                  selectedTime = selectedTimeFromPicker;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.timeString,
                      style: const TextTheme().headlineSmall,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      DateFormat('hh:mm a').format(selectedTime),
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    )),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final selectedDateFromPicker =
                  await showCupertinoModalPopup<DateTime>(
                context: context,
                builder: (BuildContext context) {
                  return datePickerWidget(context);
                },
              );
              if (selectedDateFromPicker != null) {
                setState(() {
                  selectedDate = selectedDateFromPicker;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      MyString.dateString,
                      style: const TextTheme().headlineSmall,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      DateFormat.yMMMd().format(selectedDate),
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
