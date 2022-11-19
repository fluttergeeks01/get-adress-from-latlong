import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class GetAdress extends StatefulWidget {
  const GetAdress({Key? key}) : super(key: key);
  @override
  _GetAdressState createState() => _GetAdressState();
}

class _GetAdressState extends State<GetAdress> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  String stAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Adress From LatLong'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Get Address from LatLong',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),

              // Taking input as latitude
              TextField(
                controller: latitudeController,
                decoration: InputDecoration(
                    hintText: 'Latitude',
                    border: OutlineInputBorder(
                      // Given border to textfield
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(height: 10),

              // Taking input as longitude
              TextField(
                controller: longitudeController,
                decoration: InputDecoration(
                    hintText: 'Longitude',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  child: Center(
                    child: Text(stAddress),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () async {
                  // stored the value of latitude in lat from textfield
                  String lat = latitudeController.text;
                  // stored the value of longitude in lon from textfield
                  String lon = longitudeController.text;

                  // converted the lat from string to double
                  double latData = double.parse(lat);
                  // converted the lon from string to double
                  double lonData = double.parse(lon);

                  // Passed the coordinates of latitude and longitude
                  final coordinates = Coordinates(latData, lonData);
                  var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                  var first = address.first;

                  setState(() {
                    stAddress = first.addressLine.toString();
                  });
                },
                child: const Text(
                  'Convert',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
