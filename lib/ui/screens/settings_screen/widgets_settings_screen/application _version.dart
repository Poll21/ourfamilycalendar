import 'package:flutter/material.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class ApplicationVersion extends StatelessWidget {
  const ApplicationVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              backgroundColor: const Color(0x00ffffff),
              insetPadding: const EdgeInsets.symmetric(
                  horizontal: 0, vertical: 0),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0, vertical: 0),
              content:
                Container(
                  padding: const EdgeInsets.all(16),
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                    maxHeight: 200
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Text(S.of(context).application_version),
                      SizedBox(height: 16),
                      Text(S.of(context).about_app),
                     ],
                  ),
                ),

            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(S.of(context).about_app),
          ],
        ));
  }
}