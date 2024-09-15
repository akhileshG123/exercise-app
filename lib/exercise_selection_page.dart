import 'package:flutter/material.dart';
import 'exercise_details_page.dart'; // Import the ExerciseDetailsPage

class ExerciseSelectionPage extends StatelessWidget {
  const ExerciseSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of exercises to display
    final List<String> exercises = [
      'Push-ups',
      'Squats',
      'Lunges',
      'Planks',
      'Burpees',
      'Mountain Climbers',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Exercises'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the ListView
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical margin between cards
              elevation: 5, // Add elevation to give a shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0), // Add padding inside the ListTile
                leading: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.fitness_center,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  exercises[index],
                  style: const TextStyle(
                    fontSize: 18, // Increase font size for readability
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseDetailsPage(
                        exerciseName: exercises[index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


