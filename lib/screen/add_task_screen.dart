import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/colors.dart';
import '../data/task.dart';
import '../utility/utility.dart';
import '../widget/task_type_item.dart';
// import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode controller1 = FocusNode();
  FocusNode controller2 = FocusNode();
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();
  final box = Hive.box<Task>('taskBox');
  DateTime? _time;
  int _selectedTaskTypeItem = 0;

  @override
  void initState() {
    super.initState();
    controller1.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskTitle,
                    focusNode: controller1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 16,
                        color: controller1.hasFocus
                            ? AppColors.green
                            : AppColors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.grey,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.green,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskSubTitle,
                    maxLines: 2,
                    focusNode: controller2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 16,
                        color: controller1.hasFocus
                            ? AppColors.green
                            : AppColors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.grey,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.green,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              timeWidget(),
              // Directionality(
              //   textDirection: TextDirection.rtl,
              //   child: CustomHourPicker(
              //     title: 'زمان تسک را انتخاب کن',
              //     titleStyle: TextStyle(
              //         color: Color(0xff18DAA3),
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18),
              //     elevation: 2,
              //     negativeButtonText: 'حذف کن',
              //     negativeButtonStyle: TextStyle(
              //         color: Color.fromARGB(255, 255, 0, 0),
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18),
              //     positiveButtonText: 'انتخاب کن',
              //     positiveButtonStyle: TextStyle(
              //         color: Color(0xff18DAA3),
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18),
              //     onNegativePressed: (context) {},
              //     onPositivePressed: (context, time) {
              //       _time = time;
              //     },
              //   ),
              // ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getTaskTypeList().length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTaskTypeItem = index;
                        });
                      },
                      child: TaskTypeItemList(
                        taskType: getTaskTypeList()[index],
                        index: index,
                        selectedTaskTypeItem: _selectedTaskTypeItem,
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  String taskTitle = controllerTaskTitle.text;
                  String taskSubTitle = controllerTaskSubTitle.text;
                  addTask(taskTitle, taskSubTitle);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    minimumSize: const Size(200, 40)),
                child: const Text(
                  'اضافه کردن تسک',
                  style: TextStyle(
                      fontFamily: 'SM',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightGreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container timeWidget() {
    return Container(
      margin: const EdgeInsets.all(44),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3, color: AppColors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            const Text(
              'زمان تسک را انتخاب کن',
              style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'sm'),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(
              height: 100,
              width: 170,
              child: CupertinoDatePicker(
                initialDateTime: _time,
                mode: CupertinoDatePickerMode.time,
                use24hFormat: true,
                onDateTimeChanged: (DateTime newTime) {
                  setState(() => _time = newTime);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var task = Task(
      title: taskTitle,
      subTitle: taskSubTitle,
      time: _time!,
      taskType: getTaskTypeList()[_selectedTaskTypeItem],
    );

    box.add(task);
  }
}
