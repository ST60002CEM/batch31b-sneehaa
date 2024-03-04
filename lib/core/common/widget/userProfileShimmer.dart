import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: 20.0,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 8.0),
          Container(
            width: double.infinity,
            height: 20.0,
            color: Colors.grey[300],
          ),
          // Add more placeholders as needed
        ],
      ),
    );
  }
}