import 'package:flutter/material.dart';

import '../../extensions/sized_box_extension.dart';
import '../../theme/constants/app_sizes.dart';
import '../atoms/button_widget.dart';
import '../molecules/page_header_widget.dart';

class PageWithFormTemplate extends StatelessWidget {
  const PageWithFormTemplate({
    super.key,
    required this.title,
    required this.actions,
    required this.formWidget,
  });

  final String title;
  final List<ButtonWidget> actions;
  final Widget formWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.s32),
          child: Column(
            children: [
              PageHeaderWidget(title: title, actions: actions),
              VerticalSpace.s40,
              Card(
                elevation: AppSizes.s24,
                child: formWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
