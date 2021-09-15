import 'package:flutter/material.dart';
import 'package:flutter_qrscanner/ui/landing_page.dart';
import 'package:flutter_qrscanner/utils/color_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRScanner App',
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      home: LandingPage(),
    );
  }
}
