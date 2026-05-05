import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/class_schedule_data.dart';
import '../models/class_schedule.dart';
import '../widgets/class_schedule_card.dart';
import '../widgets/filter_section.dart';
import '../widgets/schedule_parallax_header.dart';
import '../widgets/section_title.dart';

class ClassSchedulePage extends StatefulWidget {
  const ClassSchedulePage({super.key});

  @override
  State<ClassSchedulePage> createState() => _ClassSchedulePageState();
}

class _ClassSchedulePageState extends State<ClassSchedulePage> {
  String selectedFilter = 'Semua';

  final List<String> filters = const ['Semua', 'Teori', 'Praktikum'];

  List<ClassSchedule> get filteredSchedules {
    if (selectedFilter == 'Semua') {
      return classSchedules;
    }

    return classSchedules.where((schedule) {
      return schedule.type == selectedFilter;
    }).toList();
  }

  void _changeFilter(String value) {
    setState(() {
      selectedFilter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final schedules = filteredSchedules;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: ScheduleParallaxHeader.expandedHeight,
            toolbarHeight: ScheduleParallaxHeader.toolbarHeight,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.headerBlue,
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: null,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            flexibleSpace: ScheduleParallaxHeader(
              totalClasses: schedules.length,
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  FilterSection(
                    filters: filters,
                    selectedFilter: selectedFilter,
                    onSelected: _changeFilter,
                  ),
                  const SizedBox(height: 22),
                  SectionTitle(totalClasses: schedules.length),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final schedule = schedules[index];

                return ClassScheduleCard(schedule: schedule);
              }, childCount: schedules.length),
            ),
          ),
        ],
      ),
    );
  }
}