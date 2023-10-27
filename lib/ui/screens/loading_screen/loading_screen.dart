import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(child: Scaffold(
      body: Container(
        color: Colors.deepPurple,
      )
    ));
  }
}
