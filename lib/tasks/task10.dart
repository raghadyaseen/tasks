import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Task10 extends StatefulWidget {
  const Task10({super.key});

  @override
  State<Task10> createState() => _Task10State();
}

class _Task10State extends State<Task10> {
  String sample = "";

  // Function to fetch data
  void fetchAllProducts() async {
    var request = http.Request(
        'GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    // Await the response
    http.StreamedResponse response = await request.send();

    // If status is 200, fetch the data and update the state
    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      setState(() {
        sample = data; // Store the data in sample
      });
      print("Data Retrieved: $data"); // For debugging
    } else {
      print("Error: ${response.reasonPhrase}");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts(); // Call async function on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Async Data Fetch Example"),
      ),
      body: Center(
        child: sample.isEmpty
            ? CircularProgressIndicator() // Show loading while fetching
            : SingleChildScrollView(
                child: Text(sample), // Display the fetched data
              ),
      ),
    );
  }
}
