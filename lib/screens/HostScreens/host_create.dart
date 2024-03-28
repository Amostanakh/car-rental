import 'package:dashkai/services/auth_Services.dart';
import 'package:dashkai/services/host_services.dart';
import 'package:flutter/material.dart';

class CreateHost extends StatefulWidget {
  const CreateHost({super.key});

  @override
  State<CreateHost> createState() => _CreateHostState();
}

class _CreateHostState extends State<CreateHost> {
  HostServices createHost = HostServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.red,
            )),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Add Host',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              color: Colors.grey.shade200,
              child: TextField(
                controller: createHost.hostNameController,
                style:
                    const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  labelText: 'Host Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 200,
              color: Colors.grey.shade200,
              child: TextField(
                controller: createHost.numberOfCarsController,
                style:
                    const TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  labelText: 'Number of cars',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  createHost.addHostData(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => const Size(180, 40)),
                  shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                )),
          ],
        ),
      ),
    ));
  }
}
