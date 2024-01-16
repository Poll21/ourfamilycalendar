import 'package:flutter/material.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/metod_setting/application_version.dart';

class ButtonTextWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const ButtonTextWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).shadowColor, offset: const Offset(1, 1)),
      ], color: Colors.black87, borderRadius: BorderRadius.circular(12)),
      child: InkWell(
          onTap: () => applicationVersion(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(S.of(context).about_app,style: Theme.of(context).textTheme.bodyLarge,),
            ],
          )),
    );
  }
}
