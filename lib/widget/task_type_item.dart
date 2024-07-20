import 'package:flutter/material.dart';
import 'package:note/colors.dart';
import '../data/task_type.dart';

class TaskTypeItemList extends StatelessWidget {
  const TaskTypeItemList({
    super.key,
    required this.taskType,
    required this.index,
    required this.selectedTaskTypeItem,
  });

  final TaskType taskType;
  final int index;
  final int selectedTaskTypeItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: (selectedTaskTypeItem == index)
                ? AppColors.green
                : Colors.transparent,
            width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 140,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(
            taskType.title,
            style: TextStyle(
                fontFamily: 'SM',
                fontSize: (selectedTaskTypeItem == index) ? 18 : 12,
                fontWeight: FontWeight.w700,
                color: (selectedTaskTypeItem == index
                    ? AppColors.green
                    : AppColors.grey)),
          ),
        ],
      ),
    );
  }
}
