import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkAvatar extends StatelessWidget {
  final String url;
  final double radius;

  const NetworkAvatar({
    super.key,
    required this.url,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[200],
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: url,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
          const CircularProgressIndicator(strokeWidth: 2),
          errorWidget: (context, url, error) =>
          const Icon(Icons.person, size: 24),
        ),
      ),
    );
  }
}
