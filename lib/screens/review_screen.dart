import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
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
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Text(
                  'Review',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                Text(
                    'Fuel Your Trip with Feedback',
                  style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Text(
                'Score',
                style: TextStyle
                (fontSize:20,
                fontWeight: FontWeight.bold,
                ),
                
                ),

               RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              SizedBox(height: 20),
             TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red, // Set the border color to red
                    width: 2.0, // Set the border width
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
              TextFormField(
                maxLines: 8, // Adjust as needed
                decoration: InputDecoration(
              
                  labelText: 'Review',
                  border: OutlineInputBorder(

                borderSide: BorderSide(color:Colors.red )
                  ),
                ),
            ),  
          SizedBox(height: 50),
          Center(
            child: ElevatedButton(
                  onPressed: (){
                    
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
                    'Post Review',
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