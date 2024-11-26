import 'package:flutter/material.dart';
import 'package:merc/LoginScreen/login.dart';
import 'package:merc/Signup/CaptainRegisterForm.dart';
import 'package:merc/Signup/RegisterMemberForm.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Let's sign you in",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Sign in to your account",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Sign Up As",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Member Card
                _buildSignUpCard(
                  context,
                  image: "assets/runingmen.png",
                  label: "Member",
                  onTap: () {
                    // Action for Member card (if needed)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterMemberFormScreen(),
                      ),
                    );
                  },
                ),
                // Captain Card
                _buildSignUpCard(
                  context,
                  image: "assets/runingmen2.png",
                  label: "Captain",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterCaptainFormScreen(),
                      ),
                    ); // Navigate to LoginScreen
                  },
                ),
              ],
            ),
            const Spacer(),
            // Gradient Button
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 249, 225, 118),
                    Color.fromARGB(255, 255, 234, 0)
                  ],
                ),
              ),
              child: TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Text(
                  "Select",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Continue with text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have account",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Handle sign up navigation
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpCard(BuildContext context,
      {required String image,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue.withOpacity(0.5), width: 2),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
