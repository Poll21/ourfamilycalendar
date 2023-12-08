import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';
import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';

import '../../../../my_app.dart';

bool _obscureText2 = true;
bool _obscureText1 = true;
bool _obscureText3 = true;
String? _errorPassword;

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            drawer: const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Drawer(child: MyDrawer())),
            body: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                                child: Text(
                              S.of(context).change_password,
                              style: Theme.of(context).textTheme.headlineLarge,
                            )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(S.of(context).old_password),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: _obscureText1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  //  Проверяем, не пусто ли это поле
                                  return S.of(context).log_empty;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                errorText: _errorPassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    (_obscureText1)
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText1 = !_obscureText1;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(S.of(context).new_password),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: TextFormField(
                              controller: passwordController1,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: _obscureText2,
                              validator: (value1) {
                                if (value1 == null || value1.isEmpty) {
                                  //  Проверяем, не пусто ли это поле
                                  return S.of(context).log_empty;
                                }
                                if (passwordController1.text !=
                                    passwordController2.text) {
                                  return S
                                      .of(context)
                                      .log_password_incorrect_one;
                                }
                                return null;
                              },
                              decoration: InputDecoration(

                                suffixIcon: IconButton(
                                  icon: Icon(
                                    (_obscureText2)
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText2 = !_obscureText2;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
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
                              validator: (value2) {
                                if (value2 == null || value2.isEmpty) {
                                  //  Проверяем, не пусто ли это поле
                                  return S.of(context).log_empty;
                                }
                                if (passwordController1.text !=
                                    passwordController2.text) {
                                  return S
                                      .of(context)
                                      .log_password_incorrect_one;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    (_obscureText2)
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText3 = !_obscureText3;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state.error != '') {
                                print(state.error);
                              } else {
                                if (state.user != null) {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                            builder: (context, state) {
                              return Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState?.validate() !=
                                            null) {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final _password = await secureStorage
                                                .read(key: 'password');
                                            if (_password ==
                                                passwordController.text) {
                                              if (passwordController1.text ==
                                                  passwordController2.text) {
                                                context.read<AuthBloc>().add(
                                                    AuthUpdateProfileEvent(
                                                        password:
                                                            passwordController1
                                                                .text));
                                              }
                                            } else {
                                              _errorPassword =  S.of(context).error_old_password;
                                              setState(() {

                                              });
                                            }
                                          }
                                        }
                                      },
                                      child: Text(
                                        S.of(context).change_password,
                                        textAlign: TextAlign.justify,
                                      )),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
