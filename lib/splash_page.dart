import 'package:flutter/material.dart';
import 'package:exercise_app/sign_up_page.dart'; // Adjust import as needed

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with translucency
          Positioned.fill(
            child: Opacity(
              opacity: 0.8, // Slightly less opacity for better contrast
              child: Image.asset(
                'assets/images/dumbell3.png', // Ensure this image exists in your assets
                fit: BoxFit.cover, // Cover the entire screen while maintaining aspect ratio
              ),
            ),
          ),
          // Overlay content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
              children: [
                // Title text with improved styling
                Text(
                  'Your Workout Companion',
                  style: TextStyle(
                    fontSize: 28, // Increased font size for prominence
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15), // Increased space below the title
                // Subtitle text with improved styling
                Text(
                  'Track your daily workout and watch your progress!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18, // Slightly larger font size for readability
                    color: Colors.white.withOpacity(0.9),
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30), // Increased space below the subtitle
                // Sign Up button with improved styling
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Button color
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8, // Added elevation for a shadow effect
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20, // Larger font size for better readability
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


  