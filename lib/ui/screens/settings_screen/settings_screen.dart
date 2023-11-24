import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                          ),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.black26,
                            child: InkWell(
                              child: Icon(Icons.add),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                      Text("${S.of(context).prof_name}:"),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Colors.black87),
                              textAlignVertical: TextAlignVertical.bottom,

                              controller: _displayNameController,
                              keyboardType: TextInputType.name,
                              enabled: _enabledName,
                              decoration: InputDecoration(
                                //contentPadding: EdgeInsets.only( top: 0),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 0, color: Colors.black54),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, color: Color(0xDAE0E2E7)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Icon(
                                (_enabledName) ? Icons.edit_off : Icons.edit, size: 20,),

                            onTap: () {
                              setState(() {
                                _enabledName = !_enabledName;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${S.of(context).log_Email}: "),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Colors.black87),
                              textAlignVertical: TextAlignVertical.bottom,
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                enabled: false,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 0, color: Colors.black54),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, color: Color(0xDAE0E2E7)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(state.user?.tenantId ?? ''),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                      ),
                      Text(state.user?.photoURL ?? ''),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() != null) {
                              context.read<AuthBloc>().add(AuthUpdateProfileEvent(
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
