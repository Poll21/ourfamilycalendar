import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// const ErrorBorder = OutlineInputBorder(
//   gapPadding:50,
//   borderRadius: BorderRadius.all(Radius.circular(8)),
//   borderSide: BorderSide(width: 2, color: errorColorCard),
// );
//
// const FocusedErrorBorder = OutlineInputBorder(
//   gapPadding:50,
//   borderRadius: BorderRadius.all(Radius.circular(8)),
//   borderSide: BorderSide(width: 3, color: errorColorCard),
// );
//
// const EnabledBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(8)),
//   borderSide: BorderSide(width: 2, color: enabledBorderColor),
// );
//
// const DisabledBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(8)),
//   borderSide: BorderSide(width: 2, color: enabledBorderColor),
// );
//
// const FocusedBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(8)),
//   borderSide: BorderSide(width: 2, color: greyTextColor),
// );
//
// const ChatFocusedBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(16)),
//   borderSide: BorderSide(width: 1, color: Colors.white),
// );
//
// const ChatEnabledBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(16)),
//   borderSide: BorderSide(width: 1, color: Colors.white),
// );
//
// const ChatDisabledBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(16)),
//   borderSide: BorderSide(width: 1, color: Colors.white),
// );
//
// List <TextInputFormatter> sumInputFormatter =
// [sunFormatter
//   //   FilteringTextInputFormatter.deny(
//   // RegExp(r'[^\d\.\,]')),
//   // FilteringTextInputFormatter.deny(
//   // RegExp(r','),
//   // replacementString: '.'
//   // )
// ];

final cardNumberFormatter = MaskTextInputFormatter(
  mask: '#### #### #### ####',
  filter: {'#': RegExp(r'[0-9]')},
);

final sunFormatter = MaskTextInputFormatter(
  mask: '### ###.###',
  filter: {'#': RegExp(r'^\d{1,3}(?: \d{3})*(?:\.\d+)?$')},
);