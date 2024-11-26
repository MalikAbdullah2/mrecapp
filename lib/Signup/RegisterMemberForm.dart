import 'package:flutter/material.dart';
import 'package:merc/Signup/PaymentMain.dart';

class RegisterMemberFormScreen extends StatelessWidget {
  const RegisterMemberFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Multi Ethnic Running Club CIC Membership Registration Form",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Complete the form below to sign up for our membership service.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField(label: "First Name"),
              const SizedBox(height: 16),
              _buildTextField(label: "Last Name"),
              const SizedBox(height: 16),
              _buildTextField(label: "Email Address"),
              const SizedBox(height: 16),
              _buildTextField(
                  label: "Phone Number", keyboardType: TextInputType.phone),
              const SizedBox(height: 16),
              _buildTextField(label: "Address"),
              const SizedBox(height: 16),
              _buildTextField(label: "City"),
              const SizedBox(height: 16),
              _buildTextField(label: "Country"),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: Container(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      TextInputType keyboardType = TextInputType.text,
      int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black26),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black26),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black54),
            ),
            fillColor: Colors.grey[200],
            filled: true,
          ),
        ),
      ],
    );
  }
}
