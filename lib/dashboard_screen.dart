import 'package:flutter/material.dart';
import 'package:note/colors.dart';
import 'package:note/screen/add_task_screen.dart';
import 'package:note/screen/home.dart';
import 'package:note/screen/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedBottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: IndexedStack(
            index: selectedBottomNavigationIndex,
            children: getScreen(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                selectedBottomNavigationIndex = index;
              });
            },
            currentIndex: selectedBottomNavigationIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.green,
            unselectedItemColor: AppColors.grey,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'sm',
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'sm',
            ),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/Home-grey.png',
                    scale: 3,
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Image.asset(
                      'assets/images/icons/Home-green.png',
                      scale: 3,
                    ),
                  ),
                  label: 'خانه'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/Calendar-grey.png',
                    scale: 3,
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Image.asset(
                      'assets/images/icons/Calendar-green.png',
                      scale: 3,
                    ),
                  ),
                  label: 'تقویم'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/Time-grey.png',
                    scale: 3,
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Image.asset(
                      'assets/images/icons/Time-green.png',
                      scale: 3,
                    ),
                  ),
                  label: 'تایمر'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/icons/Settings-grey.png',
                    scale: 3,
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 1, top: 5),
                    child: Image.asset(
                      'assets/images/icons/Settings-grey.png',
                      scale: 3,
                    ),
                  ),
                  label: 'تنظیمات'),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getScreen() {
  return <Widget>[
    const HomePage(),
    const HomeScreen(),
    const AddTaskScreen(),
    const AddTaskScreen(),
  ];
}
