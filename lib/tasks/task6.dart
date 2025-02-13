// task6 signup page
import 'package:flutter/material.dart';

class Task6 extends StatefulWidget {
  const Task6({super.key});

  @override
  State<Task6> createState() => _Task6State();
}

class _Task6State extends State<Task6> {
  // name controller
  final TextEditingController _nameController = TextEditingController();

  // mobile number controller
  final TextEditingController _mobileController = TextEditingController();

  // email controller
  final TextEditingController _emailController = TextEditingController();

  // password controller
  final TextEditingController _passwordController = TextEditingController();

  // confirm password controller
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // form key
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  // text form field name
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      // prefix: Text('+962'),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepOrange,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // text form field email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      //prefix: Text('+962'),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepOrange,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // text form field password
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      //prefix: Text('+962'),
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.deepOrange,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // text form field confirm password
                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      // prefix: Text('+962'),
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.deepOrange,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.deepOrange,
                              content: Text(
                                'Sign Up  Successfuly',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error'),
                            ),
                          );
                        }
                      },
                      // button style -> backgroundColor deep orange and padding vertical 15 horizontal 30 radius 20
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.white,
                        backgroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Sign Up ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}