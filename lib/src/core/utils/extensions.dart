import 'package:flutter/material.dart';

extension SizedBoxFromNum on num {
  SizedBox get w => SizedBox(
        width: toDouble(),
      );
  SizedBox get h => SizedBox(
        height: toDouble(),
      );
}
