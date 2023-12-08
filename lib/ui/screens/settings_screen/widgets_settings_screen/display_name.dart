import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class DisplayName extends StatefulWidget {
  const DisplayName({super.key});

  @override
  State<DisplayName> createState() => _DisplayNameState();
}

bool _enabledName = false;

class _DisplayNameState extends State<DisplayName> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        TextEditingController _displayNameController =
            TextEditingController(text: state.user?.displayName ?? '');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${S.of(context).prof_name}:"),
            SizedBox(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black87),
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: _displayNameController,
                      keyboardType: TextInputType.name,
                      enabled: _enabledName,
                      decoration: const InputDecoration(
                        //contentPadding: EdgeInsets.only( top: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, color: Colors.black54),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, color: Color(0xDAE0E2E7)),
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
                      (_enabledName) ? Icons.save_as : Icons.edit,
                      size: 20,
                    ),
                    onTap: () async {
                      if(_enabledName){
                        context.read<AuthBloc>().add(
                            AuthUpdateProfileEvent(
                              displayName: _displayNameController.text,
                            ));
                      }
                      setState(() {

                        _enabledName = !_enabledName;
                      });
                    },
                  ),

                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
