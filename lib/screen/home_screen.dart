import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/colors.dart';
import '../data/task.dart';
import '../screen/add_task_screen.dart';
import '../utility/utility.dart';
import '../widget/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  var taskBox = Hive.box<Task>('taskBox');
  bool isFabVisible = true;
  final int _selectedTaskTypeItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) =>
              NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              setState(() {
                if (notification.direction == ScrollDirection.forward) {
                  isFabVisible = true;
                }
                if (notification.direction == ScrollDirection.reverse) {
                  isFabVisible = false;
                }
              });
              return true;
            },
            child: ListView.builder(
                itemCount: taskBox.values.length,
                itemBuilder: (context, index) {
                  var task = taskBox.values.toList()[index];
                  return getListItem(task);
                }),
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          backgroundColor: AppColors.green,
          onPressed: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTaskScreen(),
              ),
            );
          }),
          child: Image.asset('assets/images/icons/add-white.png'),
        ),
      ),
    );
  }

  Widget getListItem(Task task) => Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) => task.delete(),
        child: TaskWidget(
          task: task,
          taskType: getTaskTypeList()[_selectedTaskTypeItem],
        ),
      );
}
