import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class DisplayName extends StatefulWidget {
  final bool mobile;

  const DisplayName({super.key, required this.mobile});

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
        return Container(
            height: (widget.mobile)?75: 50,
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 6),
            width: double.infinity,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  offset: const Offset(1, 1)),
            ], color: Colors.black87, borderRadius: BorderRadius.circular(12)),
            child: (widget.mobile)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${S.of(context).prof_name}:",  style: Theme.of(context).textTheme.bodyLarge,),
                      SizedBox(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                                child: TextFormField(
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlignVertical: TextAlignVertical.bottom,
                              controller: _displayNameController,
                              keyboardType: TextInputType.name,
                              enabled: _enabledName,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .enabledBorder!
                                          .borderSide
                                          .color),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .disabledBorder!
                                          .borderSide
                                          .color),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.white),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .errorBorder!
                                          .borderSide
                                          .color),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            )),
                            InkWell(
                              child: Icon(
                                (_enabledName) ? Icons.save_as : Icons.edit,
                                size: 20,
                              ),
                              onTap: () async {
                                if (_enabledName) {
                                  context
                                      .read<AuthBloc>()
                                      .add(AuthUpdateProfileEvent(
                                        displayName:
                                            _displayNameController.text,
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
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${S.of(context).prof_name}:", style: Theme.of(context).textTheme.bodyLarge,),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _displayNameController,
                                  keyboardType: TextInputType.name,
                                  enabled: _enabledName,
                                  decoration: InputDecoration(
                                    //contentPadding: EdgeInsets.only( top: 0),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5,
                                          color: Theme.of(context)
                                              .inputDecorationTheme
                                              .enabledBorder!
                                              .borderSide
                                              .color),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5,
                                          color: Theme.of(context)
                                              .inputDecorationTheme
                                              .disabledBorder!
                                              .borderSide
                                              .color),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.white),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5,
                                          color: Theme.of(context)
                                              .inputDecorationTheme
                                              .errorBorder!
                                              .borderSide
                                              .color),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.5,
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
                                  if (_enabledName) {
                                    context
                                        .read<AuthBloc>()
                                        .add(AuthUpdateProfileEvent(
                                          displayName:
                                              _displayNameController.text,
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
                      ),
                    ],
                  ));
      },
    );
  }
}
