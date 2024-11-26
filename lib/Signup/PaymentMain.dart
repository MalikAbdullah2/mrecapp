import 'package:flutter/material.dart';
import 'package:merc/Signup/paymentsecond.dart';

void main() => runApp(const PaymentScreenApp());

class PaymentScreenApp extends StatelessWidget {
  const PaymentScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = 'Paypal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the last visited screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Information
            const Text(
              'Payment Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Membership Fee: £20.00',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            // User Information
            const Text(
              'User Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            _buildUserInfoRow('Email', 'smith@gmail.com'),
            _buildUserInfoRow('Name', 'James Smith'),
            _buildUserInfoRow('Description', 'Membership'),
            _buildUserInfoRow('Payable Amount', '£20.00'),
            const SizedBox(height: 24),

            // Payment Methods
            Expanded(
              child: ListView(
                children: [
                  _buildPaymentOption(
                      'Master Card', 'assets/master.png', 'MasterCard'),
                  _buildPaymentOption('Paypal', 'assets/paypaal.png', 'Paypal'),
                  _buildPaymentOption(
                      'Credit / Debit Card', 'assets/paypaal.png', 'Card'),
                ],
              ),
            ),

            // Next Button
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.yellow, Colors.orange],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: () {
                  // Navigate to LoginScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecurePaymentScreen(),
                    ),
                  );

                  print('Selected Payment Method: $selectedPaymentMethod');
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 14, color: Colors.black)),
          Text(value,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, String iconPath, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: RadioListTile(
        value: value,
        groupValue: selectedPaymentMethod,
        onChanged: (value) {
          setState(() {
            selectedPaymentMethod = value.toString();
          });
        },
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        secondary: Image.asset(iconPath, width: 30),
        activeColor: Colors.blue,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: const Text(
          'This is the Login Screen.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
