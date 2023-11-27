import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/costants/colors.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_avatar.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_email.dart';

import 'widgets_settings_screen/display_name.dart';
import 'widgets_settings_screen/user_local.dart';
import 'widgets_settings_screen/user_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

bool _enabledName = false;

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        TextEditingController _emailController =
                TextEditingController(text: state.user?.email ?? ''),
            _phoneController =
                TextEditingController(text: state.user?.email ?? ''),
            _displayNameController =
                TextEditingController(text: state.user?.displayName ?? '');
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(),
          drawer: const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Drawer(child: MyDrawer())),
          body: Form(
            key: _formKey,
            child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const UserAvatar(),
                      const SizedBox(
                        height: 30,
                      ),
                      const DisplayName(),
                      const SizedBox(
                        height: 20,
                      ),
                     const UserEmail(),
                      const UserTheme(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Язык"),
                      //     InkWell(
                      //         onTap: () {
                      //           showDialog<String>(
                      //             context: context,
                      //             builder: (BuildContext context) =>
                      //                 AlertDialog(
                      //               contentPadding: EdgeInsets.all(0),
                      //               content: Container(
                      //                 height: 60,
                      //                 width: 200,
                      //                 child: Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.start,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.center,
                      //                   children: [
                      //                     InkWell(
                      //                       onTap: () {
                      //                         context
                      //                             .read<SettingAppBloc>()
                      //                             .add(SettingAppSetEvent(
                      //                                 isAuthorized: null,
                      //                                 locale: 'ru',
                      //                                 appTheme: null));
                      //                         Navigator.of(context).pop();
                      //                       },
                      //                       child: Container(
                      //                           color: Colors.cyan,
                      //                           child: Text(
                      //
                      //                             'Русский',
                      //                           )),
                      //                     ),
                      //                     InkWell(
                      //                       onTap: () {
                      //                         context
                      //                             .read<SettingAppBloc>()
                      //                             .add(SettingAppSetEvent(
                      //                                 isAuthorized: null,
                      //                                 locale: 'en',
                      //                                 appTheme: null));
                      //                         Navigator.of(context).pop();
                      //                       },
                      //                       child: const Text('Английский'),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //         child: Text("Русский")),
                      //   ],
                      // ),
                      UserLocale(),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() != null) {
                              context.read<AuthBloc>().add(
                                  AuthUpdateProfileEvent(
                                      displayName: _displayNameController.text,
                                      photoURL: '',
                                      email: _emailController.text,
                                      password: '',
                                      phoneNumber: _phoneController.text));
                            }
                          },
                          child: Text(
                            S.of(context).prof_sav,
                            textAlign: TextAlign.justify,
                          )),
                    ]),
              ),
            ),
          ),
        ));
      },
    );
  }
}
