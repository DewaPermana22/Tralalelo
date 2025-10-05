import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/task/widgets/task_app_bar.dart';
import 'package:tralalelo_pra_ukk/task/widgets/task_list_body.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TaskAppBar(),
      body: const TaskListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}