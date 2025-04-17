import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../styles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyles.body.copyWith(color: Colors.white)),
    );
  }
}
