import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/ui/screens/components_screens/colors_button.dart';

class UserLocale extends StatelessWidget {
  const UserLocale({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingAppBloc, SettingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).Language),
            InkWell(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertDialog(
                          backgroundColor: Colors.white10,
                          insetPadding:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          actionsPadding:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          actions: [
                            ChangeLanguageWidget(locale: state.locale)
                          ],
                        ),
                  );
                },
                child: Text(
                    (state.locale =='ru')
                        ? S.of(context).Language_R
                        :S.of(context).Language_E
                )),
          ],
        );
      },
    );
  }
}
class ChangeLanguageWidget extends StatefulWidget {
  String locale;
  ChangeLanguageWidget({super.key, required this.locale});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}


class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {

  @override
  Widget build(BuildContext context) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              widget.locale = 'ru';
              setState(() {
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Center(
                child: Text(S.of(context).Language_R,
                    style: (widget.locale == 'ru')
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black12)),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.cyan,
          ),
          InkWell(
            onTap: () {
              widget.locale = 'en';
              setState(() {
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10)),
              ),
              child: Center(
                child: Text(S.of(context).Language_E,
                    style: (widget.locale == 'ru')
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black12)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ColorsButton(
              text: S.of(context).prof_sav,
              onPressed: () async {
                context.read<SettingAppBloc>().add(SettingAppSetEvent(locale: widget.locale, isAuthorized: null, appTheme: null));
                Navigator.pop(context);

              }),
        ]);
  }
}
