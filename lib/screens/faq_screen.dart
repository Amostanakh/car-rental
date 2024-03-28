import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.red,
              )),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Column(
              children: [
                Text(
                  'FAQ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                    'assets/img_7.png',
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FAQTile(
                  question: 'What is Flutter?',
                  answer: 'Flutter is an open-source UI software development toolkit created by Google. '
                      'It allows developers to build natively compiled applications for mobile, web, and desktop from a single codebase.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FAQTile(
                  question: 'How do I install Flutter?',
                  answer: 'To install Flutter, you can follow the installation instructions provided in the official Flutter documentation. '
                      'Make sure to set up the necessary dependencies and configure your development environment.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FAQTile(
                  question: 'Can I use Flutter for web development?',
                  answer: 'Yes, Flutter supports web development. You can use the same codebase to build applications for mobile, web, and desktop platforms.',
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Have something in mind",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  color: Colors.grey.shade300,
                  child: TextFormField(
                    maxLines: 8, // Adjust as needed
                    decoration: InputDecoration(
                      labelText: 'Review',
                      contentPadding: EdgeInsets.only(left: 12, top: 0),
                      border: OutlineInputBorder(borderSide: BorderSide.none
                      ),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    onPressed: (){

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red.shade900),
                      minimumSize: MaterialStateProperty.resolveWith((states) => Size(180, 50)),
                      shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                      ),
                    ),
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),

                    )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  FAQTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Grey background color
        borderRadius: BorderRadius.circular(10.0), // Circular border
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        iconColor: Colors.red,
        collapsedIconColor: Colors.red.shade900,
        title: Text(
          question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}