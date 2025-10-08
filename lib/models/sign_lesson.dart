// Task 1: Models folder - Data model for sign language lessons
class SignLesson {
  final String id;
  final String title;
  final String description;
  final String category;

  SignLesson({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  static List<SignLesson> getSampleLessons() {
    return [
      SignLesson(
        id: '1',
        title: 'Alphabet A-Z',
        description: 'Learn the sign language alphabet',
        category: 'Basics',
      ),
      SignLesson(
        id: '2',
        title: 'Numbers 1-10',
        description: 'Learn to sign numbers',
        category: 'Basics',
      ),
      SignLesson(
        id: '3',
        title: 'Greetings',
        description: 'Common greeting signs',
        category: 'Communication',
      ),
      SignLesson(
        id: '4',
        title: 'Family Members',
        description: 'Signs for family',
        category: 'Vocabulary',
      ),
      SignLesson(
        id: '5',
        title: 'Colors',
        description: 'Learn color signs',
        category: 'Vocabulary',
      ),
      SignLesson(
        id: '6',
        title: 'Days of Week',
        description: 'Sign the days',
        category: 'Time',
      ),
    ];
  }
}
