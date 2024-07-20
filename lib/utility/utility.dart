import '../../data/task_type.dart';
import '../../data/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'assets/images/meditate.png',
        title: 'تمرکز',
        taskTypeEnum: TaskTypeEnum.focus),
    TaskType(
        image: 'assets/images/hard_working.png',
        title: 'کار زیاد',
        taskTypeEnum: TaskTypeEnum.working),
    TaskType(
        image: 'assets/images/social_frends.png',
        title: 'دیدار دوستان',
        taskTypeEnum: TaskTypeEnum.date),
    TaskType(
        image: 'assets/images/banking.png',
        title: 'امور بانکی',
        taskTypeEnum: TaskTypeEnum.working),
    TaskType(
        image: 'assets/images/Dictionary_pana.png',
        title: 'درس خواندن',
        taskTypeEnum: TaskTypeEnum.working),
    TaskType(
        image: 'assets/images/Programmer_pana.png',
        title: 'کار کردن',
        taskTypeEnum: TaskTypeEnum.working),
    TaskType(
        image: 'assets/images/work_meeting.png',
        title: 'ملاقات کاری',
        taskTypeEnum: TaskTypeEnum.working),
    TaskType(
        image: 'assets/images/workout.png',
        title: 'ورزش',
        taskTypeEnum: TaskTypeEnum.focus),
  ];
  return list;
}
