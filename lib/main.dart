import 'package:contact_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
    runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute : '/home', 
        routes :{
            '/home' : (context) => Homepage(), 
        }, 
    title: 'Contacts List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    );

}

