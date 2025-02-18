import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(ProviderScope(child: EduPathApp()));
}

class EduPathApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduPath',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GoalListScreen(),
    );
  }
}
Future<int> deleteGoal(int id) async {
  Database db = await database;
  return await db.delete('goals', where: 'id = ?', whereArgs: [id]);
}