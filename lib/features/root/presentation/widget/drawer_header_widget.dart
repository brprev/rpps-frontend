import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/theme/constants/app_sizes.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.s32),
      child: Column(
        children: [
          const CircleAvatar(
            radius: AppSizes.s48,
            backgroundColor: Colors.white,
          ),
          VerticalSpace.s16,
          Text(
            'User12345',
            style: context.bodySmall?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
