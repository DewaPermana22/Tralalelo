import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/task/widgets/task_app_bar.dart';
import 'package:tralalelo_pra_ukk/task/widgets/task_list_body.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TaskAppBar(),
      body: const TaskListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createTask');
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
