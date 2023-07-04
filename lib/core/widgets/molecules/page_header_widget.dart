import 'package:flutter/material.dart';

import '../../theme/constants/app_sizes.dart';
import '../atoms/button_widget.dart';
import '../atoms/page_title_widget.dart';

class PageHeaderWidget extends StatelessWidget {
  const PageHeaderWidget({
    super.key,
    required this.title,
    this.actions = const <ButtonWidget>[],
  });

  final String title;
  final List<ButtonWidget> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PageTitleWidget(title: title),
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.s8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              actions.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: AppSizes.s16),
                child: actions[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
