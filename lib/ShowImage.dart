import 'dart:convert';
import 'dart:io'; // Import the 'dart:io' library

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:novalabs/Detials.dart';

import 'camera.dart';

class ShowImage extends StatefulWidget {
  final String imagePath;

  const ShowImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(widget
                      .imagePath), // Use Image.file to display the local image
                  height: 500,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var request;

                      request = http.MultipartRequest(
                          'POST', Uri.parse('http://192.168.91.24:8000/upload'))
                        ..files.add(await http.MultipartFile.fromPath(
                            'image', widget.imagePath));

                      var response = await request.send();

                      if (response.statusCode == 200) {
                        // Handle success

                        Map<String, dynamic>? dataMap = (await response.stream
                            .transform(utf8.decoder)
                            .transform(json.decoder)
                            .first) as Map<String, dynamic>?;

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Details(
                                imagePath: widget.imagePath, result: dataMap)));
                      } else {
                        // Handle error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.greenAccent,
                            content: Text('Failed to get result, try again!'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      primary: Colors.deepPurpleAccent,
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "Confirm Image",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      primary: Colors.deepPurpleAccent,
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "Retake",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
