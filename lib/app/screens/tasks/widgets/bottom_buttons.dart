import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/strings.dart';

Widget bottomButtons(
  BuildContext context,
) {
  bool isupdated = false;
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment:
          isupdated ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
      children: [
        isupdated
            ? Container(
                width: 150,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minWidth: 150,
                  height: 55,
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.close,
                        color: MyColors.primaryColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        MyString.deleteTask,
                        style: TextStyle(
                          color: MyColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Container(),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          minWidth: 150,
          height: 55,
          onPressed: () async {
            // bool fieldsAreEmpty = taskTitleController.text.isEmpty ||
            //     taskDescriptionController.text.isEmpty;
          },
          color: MyColors.primaryColor,
          child: Text(
            isupdated ? MyString.addTaskString : MyString.updateTaskString,
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        )
      ],
    ),
  );
}
