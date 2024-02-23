import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String mth = "";

class Server extends StatefulWidget {
  final String method;
  Server({required this.method}) {
    mth = method;
  }

  // ignore: non_constant_identifier_names
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _ServerState createState() => _ServerState();
}

class _ServerState extends State<Server> {
  _ServerState();
  String serverData = "Loading...";
  bool isLoading = true;
  bool connectionFound = false;
  int retryCounter = 0;

  static const int maxRetries = 3;

  @override
  void initState() {
    super.initState();
    fetchDataFromServer(mth);
  }

  Future<void> fetchDataFromServer(String feature) async {
    const baseUrl = 'http://172.22.133.253:5000/';
    const timeoutDuration = Duration(seconds: 10);
    print("Method is : " + mth);

    while (!connectionFound && retryCounter < maxRetries) {
      DateTime startTime = DateTime.now();

      try {
        late http.Response response;
        // Choose the endpoint based on the selected feature
        String url;
        if (feature == 'Feed') {
          url = '$baseUrl/feed'; // Specify the 'feed' endpoint
          response = await http.post(Uri.parse(url)).timeout(timeoutDuration);
        } else if (feature == 'Track') {
          url = '$baseUrl/track'; // Specify the 'track' endpoint
          response = await http.post(Uri.parse(url)).timeout(timeoutDuration);
        } else if (feature == 'Stream') {
          url = '$baseUrl/stream'; // Specify the 'stream' endpoint
          response = await http.post(Uri.parse(url)).timeout(timeoutDuration);
        } else {
          throw ArgumentError('Invalid feature');
        }

        if (response.statusCode == 200) {
          // If the server returns a 200 OK response, parse the data
          setState(() {
            serverData = response.body.toString();
            isLoading = false;
            connectionFound = true;
          });
        } else {
          serverData = "Connection Time Out";
          throw Exception('Failed to load data');
        }
      } catch (error) {
        print('Error: $error');
        DateTime endTime = DateTime.now();
        Duration elapsedTime = endTime.difference(startTime);

        if (elapsedTime.inSeconds >= timeoutDuration.inSeconds) {
          serverData = "Connection Time Out";
          setState(() {
            isLoading = false;
            retryCounter++;
          });
        }
      }

      // Wait for a short duration before the next iteration
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mth),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(serverData),
                ],
              ),
      ),
    );
  }
}
