import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart'; // Import for confetti animations

// StatefulWidget to display exercise results
class ExerciseResultPage extends StatefulWidget {
  final String exerciseName; // The name of the exercise being displayed

  // Constructor to accept exercise name
  const ExerciseResultPage({required this.exerciseName, super.key});

  @override
  _ExerciseResultPageState createState() => _ExerciseResultPageState();
}

class _ExerciseResultPageState extends State<ExerciseResultPage> {
  late ConfettiController _confettiController; // Controller for confetti animation

  @override
  void initState() {
    super.initState();
    // Initialize ConfettiController with a duration of 3 seconds
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play(); // Start confetti animation
  }

  @override
  void dispose() {
    _confettiController.dispose(); // Dispose of the ConfettiController when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define custom text styles
    const headlineStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    final bodyTextStyle = TextStyle(
      fontSize: 18,
      color: Colors.grey[700], // Use a grey color for the body text
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.exerciseName} Result'), // Set the app bar title with the exercise name
        backgroundColor: Colors.teal, // Set the app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            const Text(
              'Congratulations!', // Title text
              style: headlineStyle, // Apply custom headline style
            ),
            const SizedBox(height: 20), // Space between the title and body text
            Text(
              'You have completed the exercise. Well done!', // Body text
              style: bodyTextStyle, // Apply custom body text style
            ),
            const SizedBox(height: 30), // Space before the confetti
            ConfettiWidget(
              confettiController: _confettiController, // Link the confetti controller
              blastDirectionality: BlastDirectionality.explosive, // Set the confetti blast direction
              shouldLoop: false, // Do not loop the confetti animation
              colors: const [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.yellow,
              ], // Colors for the confetti
            ),
          ],
        ),
      ),
    );
  }
}


