import 'package:dashkai/screens/add_car_screen.dart';
import 'package:dashkai/services/host_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCar2Screen extends StatefulWidget {
  const AddCar2Screen({super.key});

  @override
  State<AddCar2Screen> createState() => _AddCar2ScreenState();
}

class _AddCar2ScreenState extends State<AddCar2Screen> {
  HostServices firstScreenCars = HostServices();
  @override
  Widget build(BuildContext context) {
    Future<void> getImage() async {
      final result = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (result != null) {
        firstScreenCars.selectedImage = result.path;
      } else {}
    }

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
              color: Colors.red.shade900,
            )),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            children: [
              Text(
                'Add Car',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '01/02',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Car ID',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: firstScreenCars.carIdController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Registration Book No.',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: firstScreenCars.registrationNumberController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Chasis No.',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: firstScreenCars.chasisNumberController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Engine No.',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: firstScreenCars.engineNumberController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Pictures',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            '01/03',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                        Text(
                          'Upload atleast 3 photos of your choice',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  getImage();
                                  // firstScreenCars.getImage();
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.upload_file,
                                      color: Colors.red.shade900,
                                    ),
                                    const Text('Upload file'),
                                    const SizedBox(width: 50),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.photo_camera_outlined,
                                    color: Colors.red.shade900,
                                  ),
                                  const Text('Take photo')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Car Description',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: firstScreenCars.carDescriptionController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Title',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 370,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: firstScreenCars.titleController,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          // firstScreenCars.hostAddcarFirstScreen();

                          var carsToBeAdded = [];

                          var carData = {
                            'CarId': firstScreenCars.carIdController.text,
                            'registrationBookNumber': firstScreenCars
                                .registrationNumberController.text,
                            'chasisNumber':
                                firstScreenCars.chasisNumberController.text,
                            'engineNumber':
                                firstScreenCars.engineNumberController.text,
                            'carDiscription':
                                firstScreenCars.carDescriptionController.text,
                            'title': firstScreenCars.titleController.text,
                            'image': firstScreenCars.selectedImage
                          };

                          carsToBeAdded.add(carData);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCarScreen(
                                      addingCar: carsToBeAdded,
                                    )),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.red.shade900),
                          minimumSize: MaterialStateProperty.resolveWith(
                              (states) => const Size(150, 40)),
                          shape: MaterialStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
