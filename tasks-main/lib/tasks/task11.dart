import 'package:flutter/material.dart';

// Model for Product
class Product {
  final String? title;
  final double? price;
  final String? image;
  final Rating? rating;

  Product({this.title, this.price, this.image, this.rating});

  // Factory method to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'],
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }
}

// Model for Rating
class Rating {
  final double? rate;

  Rating({this.rate});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num?)?.toDouble(),
    );
  }
}

// Product List Screen
class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> futureProducts;

  // Simulate fetching products (use dummy data for testing)
  Future<List<Product>> fetchAllProducts() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Dummy product data
    return [
      Product(
        title: "Sample Product 1",
        price: 20.0,
        image: "https://via.placeholder.com/150",
        rating: Rating(rate: 4.5),
      ),
      Product(
        title: "Sample Product 2",
        price: 35.0,
        image: "https://via.placeholder.com/150",
        rating: Rating(rate: 4.0),
      ),
      Product(
        title: "Sample Product 3",
        price: 50.0,
        image: "https://via.placeholder.com/150",
        rating: Rating(rate: 4.7),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    futureProducts = fetchAllProducts(); // Initialize the Future
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}'); // Log error for debugging
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No products available"));
          }

          List<Product> products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    products[index].image ?? "",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image, size: 50);
                    },
                  ),
                  title: Text(products[index].title ?? "No Title"),
                  subtitle:
                      Text("\$${products[index].price?.toStringAsFixed(2)}"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Text(products[index].rating?.rate?.toStringAsFixed(1) ??
                          "N/A"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductListScreen(),
  ));
}
