import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/custom_button.dart';
import '../models/sign_lesson.dart';

// Task 5: Material Design and Cupertino Widgets
class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  bool useMaterialDesign = true;

  @override
  Widget build(BuildContext context) {
    return useMaterialDesign ? _buildMaterialDesign() : _buildCupertinoDesign();
  }

  // Material Design Implementation
  Widget _buildMaterialDesign() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Signs'),
        actions: [
          Switch(
            value: useMaterialDesign,
            onChanged: (value) {
              setState(() {
                useMaterialDesign = value;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Material Design',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: LessonGrid()),
        ],
      ),
    );
  }

  // Cupertino Design Implementation
  Widget _buildCupertinoDesign() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Learn Signs'),
        trailing: CupertinoSwitch(
          value: useMaterialDesign,
          onChanged: (value) {
            setState(() {
              useMaterialDesign = value;
            });
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cupertino Design',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: LessonGrid()),
          ],
        ),
      ),
    );
  }
}

// Task 9: Third-party package usage (flutter_staggered_grid_view)
class LessonGrid extends StatelessWidget {
  const LessonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = SignLesson.getSampleLessons();

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(16),
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return LessonCard(lesson: lessons[index]);
      },
    );
  }
}

class LessonCard extends StatelessWidget {
  final SignLesson lesson;

  const LessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(lesson.description),
            const SizedBox(height: 8),
            CustomButton(
              text: 'Start',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
