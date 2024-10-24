import 'package:flutter/material.dart';
import 'package:rickandmorty/src/core/constants/app_text_styles.dart';
import 'package:rickandmorty/src/core/utils/extensions.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  final String title;
  final bool value;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child:
                Icon(value ? Icons.check_box : Icons.check_box_outline_blank),
          ),
          16.w,
          Text(title, style: AppTextStyles.bodyLarge),
        ],
      ),
    );
  }
}
