import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/task/widgets/task_card.dart';

class TaskListSection extends StatelessWidget {
  const TaskListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Semua Tugas',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '12 Tugas',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            TaskCard(
              title: 'Belajar Flutter State Management',
              category: 'Programming',
              time: '10:00 AM',
              date: 'Hari Ini',
              isDone: false,
              priority: 'Tinggi',
            ),
            const SizedBox(height: 12),
            TaskCard(
              title: 'Meeting dengan Tim Development',
              category: 'Work',
              time: '02:00 PM',
              date: 'Hari Ini',
              isDone: true,
              priority: 'Sedang',
            ),
            const SizedBox(height: 12),
            TaskCard(
              title: 'Olahraga Sore',
              category: 'Health',
              time: '05:00 PM',
              date: 'Hari Ini',
              isDone: false,
              priority: 'Rendah',
            ),
            const SizedBox(height: 12),
            TaskCard(
              title: 'Buat Laporan Bulanan',
              category: 'Work',
              time: '09:00 AM',
              date: 'Besok',
              isDone: false,
              priority: 'Tinggi',
            ),
            const SizedBox(height: 12),
            TaskCard(
              title: 'Belajar Dart Advanced',
              category: 'Programming',
              time: '11:00 AM',
              date: 'Besok',
              isDone: false,
              priority: 'Sedang',
            ),
            const SizedBox(height: 12),
            TaskCard(
              title: 'Review Code Project',
              category: 'Programming',
              time: '03:00 PM',
              date: 'Besok',
              isDone: true,
              priority: 'Tinggi',
            ),
          ],
        ),
      ],
    );
  }
}
