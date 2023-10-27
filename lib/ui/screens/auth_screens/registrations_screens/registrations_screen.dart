import 'package:flutter/material.dart';

class RegistrationsScreens extends StatefulWidget {
  const RegistrationsScreens({super.key});

  @override
  State<RegistrationsScreens> createState() => _RegistrationsScreensState();
}

class _RegistrationsScreensState extends State<RegistrationsScreens> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passvordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Авторизация")),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(

                children: [

                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(

                      border: const OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Вход",
                        textAlign: TextAlign.justify,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
