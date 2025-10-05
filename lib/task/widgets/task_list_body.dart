import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/task/widgets/search_section.dart';
import 'package:tralalelo_pra_ukk/task/widgets/task_stats_section.dart';
import 'package:tralalelo_pra_ukk/task/widgets/task_list_section.dart';

class TaskListBody extends StatelessWidget {
  const TaskListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          SearchSection(),
          SizedBox(height: 20),
          TaskStatsSection(),
          SizedBox(height: 30),
          TaskListSection(),
        ],
      ),
    );
  }
}
