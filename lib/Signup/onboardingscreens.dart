import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: _currentPage > 0
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  if (_currentPage > 0) {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              )
            : null,
      ),
      body: Column(
        children: [
          // Progress Indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              value: (_currentPage + 1) / 9,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics:
                  NeverScrollableScrollPhysics(), // Disable swipe navigation
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                NameInputScreen(onContinue: _nextPage),
                GenderSelectionScreen(onContinue: _nextPage),
                HeightInputScreen(onContinue: _nextPage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < 8) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

class NameInputScreen extends StatefulWidget {
  final VoidCallback onContinue;

  NameInputScreen({required this.onContinue});

  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'How should we call you?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'You can choose whatever name you want. We’ll keep it between you and us.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Your name',
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isNotEmpty) {
                widget.onContinue();
              } else {
                // Show error if name is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter your name.')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderSelectionScreen extends StatefulWidget {
  final VoidCallback onContinue;

  GenderSelectionScreen({required this.onContinue});

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'How do you identify yourself?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'We ask this to make sure your journey is fun, healthy and balanced.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Column(
            children: [
              GenderOption(
                label: 'Male',
                icon: Icons.male,
                isSelected: selectedGender == 'Male',
                onTap: () {
                  setState(() {
                    selectedGender = 'Male';
                  });
                },
              ),
              GenderOption(
                label: 'Female',
                icon: Icons.female,
                isSelected: selectedGender == 'Female',
                onTap: () {
                  setState(() {
                    selectedGender = 'Female';
                  });
                },
              ),
              GenderOption(
                label: 'Non-binary',
                icon: Icons.transgender,
                isSelected: selectedGender == 'Non-binary',
                onTap: () {
                  setState(() {
                    selectedGender = 'Non-binary';
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (selectedGender != null) {
                widget.onContinue();
              } else {
                // Show error if no gender is selected
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select your gender.')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  GenderOption({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.blue : Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeightInputScreen extends StatelessWidget {
  final VoidCallback onContinue;

  HeightInputScreen({required this.onContinue});

  @override
  Widget build(BuildContext context) {
    int currentHeight = 170;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'How tall are you?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'This helps us to define your body shape and calibrate your plan.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Expanded(
              child: Center(
                child: ListWheelScrollView(
                  itemExtent: 50,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    currentHeight = 150 + index;
                  },
                  children: List.generate(
                    101,
                    (index) => Center(
                      child: Text(
                        '${150 + index} cm',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to WeightSelectionScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeightSelectionScreen(
                      onContinue: () {
                        // Define what happens after WeightSelectionScreen
                        print("Weight selection completed");
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightSelectionScreen extends StatefulWidget {
  final VoidCallback onContinue;

  WeightSelectionScreen({required this.onContinue});

  @override
  _WeightSelectionScreenState createState() => _WeightSelectionScreenState();
}

class _WeightSelectionScreenState extends State<WeightSelectionScreen> {
  int selectedWeight = 60; // Default weight value
  final int minWeight = 40; // Minimum weight
  final int maxWeight = 150; // Maximum weight

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearProgressIndicator(
              value: 4 / 9, // Representing screen 4 of 9
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          SizedBox(height: 20),
          // Title and Subtitle
          Text(
            'How much do you weigh?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'This helps us to determine your BMI (body mass index) 😊.',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          // Weight Picker
          Expanded(
            child: ListWheelScrollView.useDelegate(
              physics: FixedExtentScrollPhysics(),
              itemExtent: 50,
              perspective: 0.003,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedWeight = minWeight + index;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  final weight = minWeight + index;
                  return Center(
                    child: Text(
                      '$weight kg',
                      style: TextStyle(
                        fontSize: weight == selectedWeight ? 24 : 18,
                        fontWeight: weight == selectedWeight
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: weight == selectedWeight
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  );
                },
                childCount: maxWeight - minWeight + 1,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Buttons
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BodyTypeSelectionScreen(
                    onContinue: () {
                      // Define what happens after BodyTypeSelectionScreen
                      print("Body type selection completed");
                    },
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              backgroundColor: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () {
              // Action to switch to pounds
            },
            child: Text(
              'Switch to Pound',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class BodyTypeSelectionScreen extends StatefulWidget {
  final VoidCallback onContinue;

  BodyTypeSelectionScreen({required this.onContinue});

  @override
  _BodyTypeSelectionScreenState createState() =>
      _BodyTypeSelectionScreenState();
}

class _BodyTypeSelectionScreenState extends State<BodyTypeSelectionScreen> {
  // List of body types
  final List<Map<String, String>> bodyTypes = [
    {'type': 'Ectomorph', 'description': 'Slim'},
    {'type': 'Mesomorph', 'description': 'Muscular'},
    {'type': 'Endomorph', 'description': 'Curvy'},
  ];

  int selectedIndex = 0; // Default selected body type index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to WeightSelectionScreen
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearProgressIndicator(
              value: 5 / 9, // Representing screen 5 of 9
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          SizedBox(height: 20),
          // Title and Subtitle
          Text(
            'Select your body type',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Swipe left or right to select your body type. Try to be honest, ok?',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          // Body Type Carousel
          Expanded(
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.7),
              itemCount: bodyTypes.length,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemBuilder: (context, index) {
                bool isSelected = index == selectedIndex;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(
                      horizontal: 10, vertical: isSelected ? 0 : 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.blue.shade200,
                              blurRadius: 15,
                              spreadRadius: 5,
                            ),
                          ]
                        : [],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person, // Placeholder icon for body type
                        size: isSelected ? 100 : 80,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 20),
                      Text(
                        bodyTypes[index]['type']!,
                        style: TextStyle(
                          fontSize: isSelected ? 24 : 20,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      Text(
                        bodyTypes[index]['description']!,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // Continue Button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AgeInputScreen(
                    onNext: () {
                      // Define navigation after age input
                      print("Age selection completed");
                    },
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              backgroundColor: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class AgeInputScreen extends StatefulWidget {
  final VoidCallback onNext;

  AgeInputScreen({required this.onNext});

  @override
  _AgeInputScreenState createState() => _AgeInputScreenState();
}

class _AgeInputScreenState extends State<AgeInputScreen> {
  int selectedAge = 27; // Default age value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate to the previous screen
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearProgressIndicator(
              value: 7 / 9, // Representing screen 7 of 9
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          SizedBox(height: 20),
          // Title and Subtitle
          Text(
            'How old are you?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'This helps us personalize your experience.',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          // Age Picker
          Expanded(
            child: Center(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedAge = 18 + index;
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final age = 18 + index;
                    final isSelected = age == selectedAge;
                    return Center(
                      child: Text(
                        '$age Years',
                        style: TextStyle(
                          fontSize: isSelected ? 24 : 20,
                          color: isSelected ? Colors.blue : Colors.grey,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  },
                  childCount: 83, // Age range: 18 to 100
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Next Button
          ElevatedButton(
            onPressed: () {
              widget.onNext(); // Move to the next screen
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              backgroundColor: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Next',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
