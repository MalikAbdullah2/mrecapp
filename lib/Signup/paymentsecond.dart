import 'package:flutter/material.dart';
import 'package:merc/Signup/paymentconfirmationdetail.dart';

class PaymentSecondScreen extends StatelessWidget {
  const PaymentSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecurePaymentScreen(),
    );
  }
}

class SecurePaymentScreen extends StatelessWidget {
  SecurePaymentScreen({Key? key}) : super(key: key);

  final TextStyle labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Secure Payment Setup",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter Card Details",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            buildTextField("Name of Card Holder"),
            const SizedBox(height: 16),
            buildTextField("Card Number"),
            const SizedBox(height: 16),
            buildTextField("CVV"),
            const SizedBox(height: 16),
            buildTextField("Expiry Date"),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // Handle button tap
              },
              child: GestureDetector(
                onTap: () {
                  // Navigate to LoginScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentDetail(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.yellow, Colors.orange],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Proceed to Pay",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            fillColor: Colors.grey[200],
            filled: true,
          ),
        ),
      ],
    );
  }
}
