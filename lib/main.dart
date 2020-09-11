import 'package:flutter/material.dart';
import 'package:vk_tech_donation/pages/donation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xFF4986CC),
        primaryColor: Color(0xFF4986CC),
      ),
      debugShowCheckedModeBanner: false,
      title: 'VK Donations',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: DonationPage(),
      ),
    );
  }
}
