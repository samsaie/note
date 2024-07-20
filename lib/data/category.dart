class Category {
  final String title;
  final String imageFileName;

  Category({required this.title, required this.imageFileName});
}

class TaskTimes {
  final String times;

  TaskTimes({required this.times});
}

class AppDataSource {
  static List<Category> get categories {
    return [
      Category(title: 'آموزش', imageFileName: 'assets/images/icons/teach.png'),
      Category(title: 'ورزش', imageFileName: 'assets/images/icons/sport.png'),
      Category(title: 'خرید', imageFileName: 'assets/images/icons/buy.png')
    ];
  }

  static List<TaskTimes> get times {
    return [
      TaskTimes(times: 'همه'),
      TaskTimes(times: '۸:۳۰-۱۰'),
      TaskTimes(times: '۱۰-۱۲'),
      TaskTimes(times: '۱۲-۱۴:۳۰'),
      TaskTimes(times: '۱۴:۳۰-۱۶'),
      TaskTimes(times: '۱۶:۳۰-۱۸'),
      TaskTimes(times: '۱۸-۲۰'),
      TaskTimes(times: '۲۰-۲۲'),
    ];
  }
}
