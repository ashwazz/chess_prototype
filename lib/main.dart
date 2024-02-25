import 'dart:io';
import 'dart:typed_data';
import 'package:chess_prototype/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

// Use the correct import for sqflite

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Copy the database from assets to a usable path
 
  // Pass the database instance to your HomePage (if needed)
  runApp(const ChessApp());
}

class ChessApp extends StatefulWidget {
  // Add a database property

  const ChessApp({super.key});

  @override
  State<ChessApp> createState() => _ChessAppState();
}

class _ChessAppState extends State<ChessApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(), // Pass the database to MyHomePage if needed
    );
  }
}