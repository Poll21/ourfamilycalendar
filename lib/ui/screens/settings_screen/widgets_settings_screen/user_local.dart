import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/ui/screens/components_screens/colors_button.dart';

class UserLocale extends StatelessWidget {
  final bool mobile;

  const UserLocale({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingAppBloc, SettingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: (mobile) ? 75 : 50,
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Theme.of(context).shadowColor, offset: const Offset(1,1)),],
              color: Colors.black87,
              borderRadius: BorderRadius.circular(12)),
          child: (mobile)
              ?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).Language, style: Theme.of(context).textTheme.bodyLarge,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            backgroundColor: const Color(0x00ffffff),
                            insetPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            actionsPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            actions: const [ChangeLanguageWidget()],
                          ),
                        );
                      },
                      child: Text((state.locale == 'ru')
                          ? S.of(context).Language_R
                          : S.of(context).Language_E,
                        style: Theme.of(context).textTheme.bodySmall,),

                  ),
                ],
              ),
            ],
          )
              :Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).Language, style: Theme.of(context).textTheme.bodyLarge,),
              InkWell(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        backgroundColor: const Color(0x00ffffff),
                        insetPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        actionsPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        actions: const [ChangeLanguageWidget()],
                      ),
                    );
                  },
                  child: Text((state.locale == 'ru')
                      ? S.of(context).Language_R
                      : S.of(context).Language_E,style: Theme.of(context).textTheme.bodySmall,)),
            ],
          ),
        );
      },
    );
  }
}

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingAppBloc, SettingAppState>(
      builder: (context, state) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context.read<SettingAppBloc>().add(SettingAppSetEvent(
                      locale: 'ru',
                      isAuthorized: null,
                      appTheme: null,
                      socialRole: null));
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color:
                        (state.locale == 'ru') ? Colors.white : Colors.black38,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Center(
                    child: Text(S.of(context).Language_R,
                        style: (state.locale == 'ru')
                            ? TextStyle(color: Colors.black)
                            : TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 4,
                color: const Color(0x00ffffff),
              ),
              InkWell(
                onTap: () {
                  context.read<SettingAppBloc>().add(SettingAppSetEvent(
                      locale: 'en',
                      isAuthorized: null,
                      appTheme: null,
                      socialRole: null));
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:
                        (state.locale == 'en') ? Colors.white : Colors.black38,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24)),
                  ),
                  child: Center(
                    child: Text(S.of(context).Language_E,
                        style: (state.locale == 'en')
                            ? TextStyle(color: Colors.black)
                            : TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ]);
      },
    );
  }
}
