import 'package:flutter/material.dart';
import 'package:exercise_app/exercise_selection_page.dart'; // Import the new page for navigation

// StatefulWidget for the sign-up page
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Global key to manage the form state
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for each form field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  
  String? _selectedSex; // Variable to store the selected sex from dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar to display the title of the page
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.teal, // Set the color of the AppBar
      ),
      // Body of the page wrapped in SingleChildScrollView for scrolling
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Welcome text with a slight shadow effect
              Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 24, // Font size for the title
                  fontWeight: FontWeight.bold, // Font weight for bold text
                  color: Colors.teal[800], // Text color
                  shadows: [
                    Shadow(
                      blurRadius: 5.0, // Shadow blur radius
                      color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                      offset: const Offset(1, 2), // Shadow offset
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Space between the title and form

              // Card widget to give a modern look to the form
              Card(
                elevation: 8.0, // Shadow effect for the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey, // Link the form with the global key
                    child: Column(
                      children: [
                        // Name field
                        _buildTextField(_nameController, 'Name',
                            'Please enter your name'),
                        
                        const SizedBox(height: 15), // Space between fields
                        
                        // Email field
                        _buildTextField(_emailController, 'Email',
                            'Please enter your email',
                            keyboardType: TextInputType.emailAddress),
                        
                        const SizedBox(height: 15),
                        
                        // Phone number field
                        _buildTextField(_numberController, 'Phone Number',
                            'Please enter your phone number',
                            keyboardType: TextInputType.phone),
                        
                        const SizedBox(height: 15),
                        
                        // Age field
                        _buildTextField(_ageController, 'Age',
                            'Please enter your age',
                            keyboardType: TextInputType.number),
                        
                        const SizedBox(height: 15),
                        
                        // Height field
                        _buildTextField(_heightController, 'Height (cm)',
                            'Please enter your height',
                            keyboardType: TextInputType.number),
                        
                        const SizedBox(height: 15),
                        
                        // Weight field
                        _buildTextField(_weightController, 'Weight (kg)',
                            'Please enter your weight',
                            keyboardType: TextInputType.number),
                        
                        const SizedBox(height: 15),
                        
                        // Dropdown for selecting sex
                        DropdownButtonFormField<String>(
                          value: _selectedSex,
                          decoration: const InputDecoration(
                            labelText: 'Sex', // Label for the dropdown
                            border: OutlineInputBorder(), // Border style
                          ),
                          items: ['Male', 'Female', 'Other']
                              .map((sex) => DropdownMenuItem(
                                    value: sex,
                                    child: Text(sex),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedSex = value; // Update the selected sex
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select your sex'; // Validation message if no selection
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 30),
                        
                        // Submit button to finalize registration
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // If the form is valid, navigate to ExerciseSelectionPage
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExerciseSelectionPage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal, // Button color
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Rounded corners
                            ),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 18, // Font size for the button text
                              color: Colors.white, // Text color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create reusable text fields with validation
  Widget _buildTextField(TextEditingController controller, String label,
      String validationMessage,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label, // Label for the text field
        border: const OutlineInputBorder(), // Border style
        filled: true, // Fill the background of the text field
        fillColor: Colors.grey[200], // Background color
      ),
      keyboardType: keyboardType, // Type of keyboard to display
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage; // Validation message if field is empty
        }
        return null;
      },
    );
  }
}


