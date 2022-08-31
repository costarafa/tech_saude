import 'package:flutter/material.dart';
import 'package:saude_tech/app/injection.dart';
import 'app/my_app.dart';

void main() {
  setupInjection();
  runApp(MyApp());
}