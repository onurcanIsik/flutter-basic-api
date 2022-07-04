// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_api/model/usermodel.dart';
import 'package:flutter_api/services/user_service.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserService _service = UserService();
  List<Articles?> data = [];
  bool? isLoading;

  @override
  void initState() {
    super.initState();
    UserService.getData().then((value) {
      setState(() {
        if (value == null) {
          isLoading = false;
        } else {
          data = value;
          isLoading = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api"),
      ),
      body: isLoading == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index]!.title!),
                    subtitle: Text(data[index]!.description!),
                  ),
                );
              },
            ),
    );
  }
}
