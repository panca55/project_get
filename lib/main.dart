import 'package:flutter/material.dart';
import 'package:project_get/screen/home_page.dart';
import 'package:provider/provider.dart';

import 'models/http_providers.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> HttpProvider(),
      child: MaterialApp(
        title: 'Project GET',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        home:const HomePage(),
      ),
    );
  }
}