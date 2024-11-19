import 'package:flutter/material.dart';
import 'package:merc/LoginScreen/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/welcome.png',
            fit: BoxFit.cover,
          ),
          // Semi-transparent Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0988F1).withOpacity(0.7), // #0988F1
                  Color(0xFF19BCEE).withOpacity(0.7), // #19BCEE
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Image.asset(
                  'assets/logo.png',
                  height: 200,
                ),
              ),
              // Welcome Text
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Subtext
              Text(
                'Lorem Ipsum lorem ipsum dorem Ipsum\nlorem ipsum dorem.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              // Google Button
              SocialButton(
                icon: Icons.g_mobiledata,
                text: 'Continue with Google',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  // Google login logic
                },
              ),
              const SizedBox(height: 10),
              // Facebook Button
              SocialButton(
                icon: Icons.facebook,
                text: 'Continue with Facebook',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  // Facebook login logic
                },
              ),
              const SizedBox(height: 10),
              // Email Button
              SocialButton(
                icon: Icons.email,
                text: 'Continue with Email',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  // Navigate to LoginScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const SocialButton({
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: textColor),
        label: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
