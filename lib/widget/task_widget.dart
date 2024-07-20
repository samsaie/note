import 'package:flutter/material.dart';
import 'package:note/colors.dart';
import '../data/task.dart';
import '../data/task_type.dart';
import '../screen/edit_task_screen.dart';
// import 'package:msh_checkbox/msh_checkbox.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.task, required this.taskType});
  final Task task;
  final TaskType taskType;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // MSHCheckbox(
                  //   size: 32,
                  //   value: isDone,
                  //   colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                  //     checkedColor: Color(0xff18DAA3),
                  //   ),
                  //   style: MSHCheckboxStyle.stroke,
                  //   onChanged: (selected) {
                  //     setState(() {
                  //       isDone = selected;
                  //     });
                  //   },
                  // ),
                  Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      activeColor: AppColors.green,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: isBoxChecked,
                      onChanged: (isChecked) {
                        // setState(() {});
                      },
                    ),
                  ),
                  Text(
                    widget.task.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: 'SM',
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Text(
                widget.task.subTitle,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: 'SM',
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              getTimeAndEditBadges()
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(widget.task.taskType.image),
      ],
    );
  }

  Row getTimeAndEditBadges() {
    return Row(
      children: [
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.green,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${getHourUnderTen(widget.task.time)}:${getMinUnderTen(widget.task.time)}',
                style: const TextStyle(
                    fontFamily: 'SM',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 16,
                width: 16,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    'assets/images/icons/Time-white.png',
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(
                  task: widget.task,
                ),
              ),
            );
          },
          child: Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.lightGreen,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'ویرایش',
                    style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(
                        'assets/images/icons/Edit-green.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getMinUnderTen(DateTime time) {
    if (time.minute < 10) {
      return '0${time.minute}';
    } else {
      return time.minute.toString();
    }
  }

  String getHourUnderTen(DateTime time) {
    if (time.hour < 10) {
      return '0${time.hour}';
    } else {
      return time.hour.toString();
    }
  }
}
