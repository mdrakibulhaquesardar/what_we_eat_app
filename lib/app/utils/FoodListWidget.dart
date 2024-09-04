import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/get_utils/get_utils.dart';

class FoodListWidget extends StatelessWidget {
  final String title;
  final String description;
  final CachedNetworkImage image;
  final Callback? onTap;
  const FoodListWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            image,
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ).paddingOnly(top: 10),
            ),
            Expanded(
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade500,
                ),
              ).paddingOnly(top: 3),
            ),
          ],
        ).paddingAll(10),
      ),
    );
  }
}