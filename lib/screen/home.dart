import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note/colors.dart';
import 'package:note/data/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: CustomScrollView(
            slivers: [
              _GetWelcomeRow(),
              _GetSearchBar(),
              _GetCategoryList(),
              _GetTodayTasks(),
            ],
          ),
        ),
      ),
    );
  }
}

class _GetWelcomeRow extends StatelessWidget {
  const _GetWelcomeRow();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Image.asset(
            'assets/images/icons/profile-1.png',
            scale: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'سلام ، ',
                      style: TextStyle(
                          fontFamily: 'sm',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black),
                    ),
                    const Text(
                      'محمد جواد ',
                      style: TextStyle(
                          fontFamily: 'sm',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.green),
                    ),
                    Image.asset(
                      'assets/images/icons/hi.png',
                      scale: 3,
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      '۲ شهریور',
                      style: TextStyle(
                          fontFamily: 'sm',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(13)),
              height: 26,
              width: 85,
              child: const Center(
                child: Text(
                  '۲۰ تسک فعال',
                  style: TextStyle(
                      fontFamily: 'sm',
                      color: AppColors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GetSearchBar extends StatelessWidget {
  const _GetSearchBar();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Container(
          height: 46,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/icons/Search....png',
                  scale: 4,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    'جستجوی تسکات ...',
                    style: TextStyle(
                        fontFamily: 'sm',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/icons/Filter.png',
                  scale: 4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GetCategoryList extends StatelessWidget {
  const _GetCategoryList();

  @override
  Widget build(BuildContext context) {
    final categories = AppDataSource.categories;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'دسته بندی',
                  style: TextStyle(
                      fontFamily: 'sm',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black),
                ),
                Text(
                  'مشاهده بیشتر',
                  style: TextStyle(
                      fontFamily: 'sm',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 163,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Image.asset(
                          category.imageFileName,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 30,
                          width: 100,
                          child: Center(
                            child: Text(
                              category.title,
                              style: const TextStyle(
                                  fontFamily: 'sm',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GetTodayTasks extends StatelessWidget {
  const _GetTodayTasks();

  @override
  Widget build(BuildContext context) {
    final taskTimes = AppDataSource.times;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تسک های امروز',
                  style: TextStyle(
                      fontFamily: 'sm',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black),
                ),
                Text(
                  'مشاهده بیشتر',
                  style: TextStyle(
                      fontFamily: 'sm',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: taskTimes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final tasksTimes = taskTimes[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          tasksTimes.times,
                          style: const TextStyle(
                              fontFamily: 'sm',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.grey),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
