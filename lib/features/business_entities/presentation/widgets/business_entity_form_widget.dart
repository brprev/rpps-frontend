import 'package:flutter/material.dart';

import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/theme/constants/app_sizes.dart';

class BusinessEntityFormWidget extends StatelessWidget {
  const BusinessEntityFormWidget({
    super.key,
    required this.formKey,
    required this.entityNameTextController,
    required this.ownerNameTextController,
    required this.ownerPhoneTextController,
    required this.managementUnitTextController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController entityNameTextController;
  final TextEditingController ownerNameTextController;
  final TextEditingController ownerPhoneTextController;
  final TextEditingController managementUnitTextController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.s72),
      width: double.infinity,
      child: Form(
        child: Column(
          children: [
            Row(
              children: [
                _BusinessEntityFormInputWidget(
                  labelText: 'Nome',
                  textController: entityNameTextController,
                ),
                HorizontalSpace.s24,
                _BusinessEntityFormInputWidget(
                  labelText: 'Unidade gestora',
                  textController: managementUnitTextController,
                ),
              ],
            ),
            VerticalSpace.s24,
            Row(
              children: [
                _BusinessEntityFormInputWidget(
                  labelText: 'Responsável',
                  textController: ownerNameTextController,
                ),
                HorizontalSpace.s24,
                _BusinessEntityFormInputWidget(
                  labelText: 'Contato',
                  textController: ownerPhoneTextController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BusinessEntityFormInputWidget extends StatelessWidget {
  const _BusinessEntityFormInputWidget({
    required this.labelText,
    required this.textController,
  });

  final String labelText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(labelText: labelText),
        controller: textController,
      ),
    );
  }
}
