import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/cubit/note_cubit.dart';
import 'package:todo_app/app/screens/home/widgets/task_widget.dart';
import 'package:todo_app/core/utils/constants.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({super.key});

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final List<String> tasks = ['Task 1', 'Task 2', 'Task 3'];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.dark_mode,
                    color: Colors.blue,
                  ),
                  iconSize: 40,
                ),
              ),
              const Spacer(flex: 4),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<NoteCubit>(context).deleteAllNotes();
                  },
                  icon: const Icon(CupertinoIcons.trash),
                  iconSize: 40,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          width: double.infinity,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: CircularProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                      color: Colors.grey.shade300,
                      strokeWidth: 3,
                      strokeCap: StrokeCap.round,
                      backgroundColor: Colors.grey.shade300,
                      value: 20,
                    ),
                  ),
                  Text(
                    '${(20 * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Main Title', // Replace with your actual title.
                    style: texttheme.displayLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '0 of 0 tasks',
                    style: texttheme.titleMedium,
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Divider(
            thickness: 2,
            indent: 100,
            color: Colors.grey.shade300,
          ),
        ),
        SizedBox(
          height: 500,
          width: double.infinity,
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  taskDeleted(context);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Delete',
                            style: texttheme.titleMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Delete',
                            style: texttheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                child: const TaskWidget(),
              );
            },
          ),
        ),
      ],
    );
  }
}
