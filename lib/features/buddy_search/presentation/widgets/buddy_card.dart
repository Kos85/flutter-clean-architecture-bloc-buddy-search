import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/widgets/network_avatar.dart';
import '../../domain/entities/user_entity.dart';

class BuddyCard extends StatelessWidget {
  final UserEntity user;

  const BuddyCard({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      child: ListTile(
        leading: NetworkAvatar(url: user.avatarUrl),
        title: Text(user.name, style: AppTextStyles.title),
        subtitle: Text('${user.age}, ${user.city}', style: AppTextStyles.subtitle),
      ),
    );
  }
}
