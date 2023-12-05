import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{

  await dotenv.load();

  var app = App();
  runApp(app);
}

