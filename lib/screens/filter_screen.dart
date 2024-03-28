import 'package:dashkai/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _lowerValue = 100;
  double _upperValue = 500;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.red,
              )),
          title: Center(
              child: Column(
                children: [
                  Text('Filter'),
                  Text(
                      'Find your ideal car quickly and effortlessly.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Select Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DatePickerWidget(
                  looping: false,
                  firstDate: DateTime.now(),
                  // lastDate: DateTime(2002, 1, 1),
                  // initialDate: DateTime.now(),
                  dateFormat: "dd/MMMM/yyyy",
                  locale: DatePicker.localeFromString('en'), // Set locale to English
                  onChange: (DateTime newDate, _) {
                    setState(() {
                      // Handle date change if needed
                    });
                  },
                  pickerTheme: DateTimePickerTheme(
                    backgroundColor: Colors.white, // Set date picker background color to grey
                    itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                    dividerColor: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price Range',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    Text(
                      ' \$${_upperValue.toInt()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RangeSlider(
                      values: RangeValues(_lowerValue, _upperValue),
                      min: 0,
                      max: 500,
                      activeColor: Colors.red,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _lowerValue = values.start;
                          _upperValue = values.end;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$0'),
                        Text('\$100'),
                        Text('\$200'),
                        Text('\$300'),
                        Text('\$400'),
                        Text('\$500+'),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Size',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(100, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Compact',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(100, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Standard',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(100, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Large',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(100, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'SUV',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Seats',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(50, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            '2-4',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(50, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Family-friend',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(50, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            '10+',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Transmission',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(50, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Manual',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(50, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Automatic',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Fuel',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(100, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Diesel',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(100, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Petrol',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(100, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Hybrid',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            side: MaterialStateProperty.resolveWith((states) => BorderSide(color: Colors.red)), // Red border
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(100, 40)),
                            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                            ),
                          ),
                          child: Text(
                            'Electric',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),

                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultsScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                      minimumSize: MaterialStateProperty.resolveWith((states) => Size(180, 40)),
                      shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                      ),
                    ),
                    child: Text(
                      'Show Results',
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
