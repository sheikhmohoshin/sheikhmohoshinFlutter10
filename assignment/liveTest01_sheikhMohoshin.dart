void main() {
  List<Map<String, dynamic>> students = [
    {"name": "Alice", "scores": [85, 90, 78]},
    {"name": "Bob", "scores": [88, 76, 95]},
    {"name": "Charlie", "scores": [90, 92, 85]}
  ];

  List<Map<String, dynamic>> studentAverages = [];

  for (var student in students) {
    try {
      // Validate student data
      if (!student.containsKey('name') || !student.containsKey('scores')) {
        throw FormatException('Invalid student format: Missing name or scores');
      }

      String name = student['name'] as String;
      List<int> scores = List<int>.from(student['scores'] as List);

      // Handle empty scores list
      if (scores.isEmpty) {
        throw ArgumentError('No scores available for $name');
      }

      // Calculate average
      double average = scores.reduce((a, b) => a + b) / scores.length;
      double roundedAverage = double.parse((average).toStringAsFixed(2));

      studentAverages.add({"name": name, "average": roundedAverage});
    } catch (e) {
      print('Error processing student: $e');
    }
  }

  // Sort after handling all possible students
  studentAverages.sort((a, b) => (b['average'] as double).compareTo(a['average'] as double));

  // Create result map
  Map<String, double> result = {
    for (var entry in studentAverages)
      entry['name'] as String: entry['average'] as double
  };

  print(result);
}