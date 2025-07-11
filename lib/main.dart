import 'package:counter_test/screens/counter/counter_functions_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// import 'package:hello_world_app/screens/counter/counter_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed:Colors.blue
      ) ,
      home : CounterFunctionsScreen(),
  );}

}
