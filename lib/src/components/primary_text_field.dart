import 'package:flutter/material.dart';
import 'package:rickandmorty/src/core/constants/app_colors.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({super.key, this.prefixIcon, this.hint, this.obscure});

  final Widget? prefixIcon;
  final String? hint;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.backgroundLight),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(
          obscureText: obscure ?? false,
          decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            prefixIcon: prefixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
