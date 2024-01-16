import 'package:flutter/material.dart';
import 'package:our_family_calendar/generated/l10n.dart';

applicationVersion(BuildContext context) {
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
            Text(S.of(context).application_version, style:  Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 16),
            Text(S.of(context).about_app,  style:  Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),

    ),
  );
}