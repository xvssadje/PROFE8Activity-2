import '../models/sign_lesson.dart';

// Task 1: Services folder - Service for managing lessons
class LessonService {
  List<SignLesson> getAllLessons() {
    return SignLesson.getSampleLessons();
  }

  SignLesson? getLessonById(String id) {
    final lessons = SignLesson.getSampleLessons();
    try {
      return lessons.firstWhere((lesson) => lesson.id == id);
    } catch (e) {
      return null;
    }
  }

  List<SignLesson> getLessonsByCategory(String category) {
    final lessons = SignLesson.getSampleLessons();
    return lessons.where((lesson) => lesson.category == category).toList();
  }
}
