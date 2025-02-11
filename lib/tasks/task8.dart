import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Task8 extends StatefulWidget {
  const Task8({super.key});

  @override
  State<Task8> createState() => _Task8State();
}

class _Task8State extends State<Task8> {
  List<dynamic> listOfProducts = []; 

  
  Future<void> fetchAllProducts() async {
    try {
     
      final url = Uri.parse("https://fakestoreapi.com/products");
      
      final response = await http.get(url);

      if (response.statusCode == 200) {
       
        final data = json.decode(response.body);
        setState(() {
          listOfProducts = data; 
        });
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async real example using Postman"),
      ),
      body: listOfProducts.isEmpty
          ? const Center(
              child: CircularProgressIndicator(), 
            )
          : ListView.builder(
              itemCount: listOfProducts.length,
              itemBuilder: (context, index) {
                final product = listOfProducts[index];
                return ListTile(
                  title: Text(product['title']), 
                  subtitle: Text("\$${product['price']}"),
                  leading: Image.network(
                    product['image'],
                    width: 50,
                    height: 50,
                  ),
                );
              },
            ),
    );
  }
}
