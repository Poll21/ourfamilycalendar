import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool _regOrLog = true;
bool _obscureText2 = true;
bool _obscureText1 = true;

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(S.of(context).log_title),
              Text((_regOrLog)
                  ? S.of(context).log_Registration
                  : S.of(context).log_Authorization),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          S.of(context).log_Email,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value1) {
                            if (value1 == null || value1.isEmpty) {
                              //  Проверяем, не пусто ли это поле
                              return S.of(context).log_empty;
                            }
                            if (!RegExp(// используя регулярное выражение
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value1)) {
                              return S.of(context).log_email_incorrect;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(S.of(context).log_Password1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: TextFormField(
                          controller: passwordController1,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: _obscureText1,
                          validator: (value2) {
                            if (value2 == null || value2.isEmpty) {
                              //  Проверяем, не пусто ли это поле
                              return S.of(context).log_empty;
                            }
                            if (!RegExp(// используя регулярное выражение
                                r'[0-9a-zA-Z!@#$%^&*]{6,}').hasMatch(value2)) {
                              return S.of(context).log_password_incorrect;
                            }
                            if(_regOrLog){
                              if (passwordController1.text != passwordController2.text) {
                                return S.of(context).log_password_incorrect_one;
                              }
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon((_obscureText1)
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: (_regOrLog),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(S.of(context).log_Password2),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: TextFormField(
                            controller: passwordController2,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: _obscureText2,
                            validator: (value3) {
                              if (value3 == null || value3.isEmpty) {
                                //  Проверяем, не пусто ли это поле
                                return S.of(context).log_empty;
                              }
                              if (!RegExp(// используя регулярное выражение
                                  r'[0-9a-zA-Z!@#$%^&*]{6,}').hasMatch(value3)) {
                                return S.of(context).log_password_incorrect;
                              }
                              if(_regOrLog){
                                if (passwordController1.text != passwordController2.text) {
                                  return S.of(context).log_password_incorrect_one;
                                }
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon((_obscureText2)
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                onPressed: () {
                                  setState(() {
                                    _obscureText2 = !_obscureText2;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() != null) {
                              (_regOrLog)
                                  ? context.read<AuthBloc>().add(AuthRegistrationEmailEvent(
                                  email: emailController.text, password: passwordController1.text)
                                     )
                                  : context.read<AuthBloc>().add( AuthSingInEmailEvent(
                                  email: emailController.text, password: passwordController1.text)
                                      );
                            }
                          },
                          child: Text(
                            (_regOrLog) ? S.of(context).log_Registration : S.of(context).log_Login,
                            textAlign: TextAlign.justify,
                          ));
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _regOrLog = !_regOrLog;
                        });
                      },
                      child: Text(
                        (_regOrLog) ? S.of(context).log_Login : S.of(context).log_Registration,
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
