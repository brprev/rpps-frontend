import 'package:flutter/material.dart';

import '../../../../core/widgets/atoms/button_widget.dart';
import '../../../../core/widgets/templates/page_with_form_template.dart';
import '../../domain/entities/business_entity.dart';
import 'business_entity_form_widget.dart';

class BusinessEntityEntryWidget extends StatefulWidget {
  const BusinessEntityEntryWidget({
    super.key,
    this.entity,
    required this.onPressedCancel,
    required this.onPressedCreateEntity,
  });

  final BusinessEntity? entity;
  final VoidCallback onPressedCancel;
  final VoidCallback onPressedCreateEntity;

  @override
  State<BusinessEntityEntryWidget> createState() =>
      _BusinessEntityEntryWidgetState();
}

class _BusinessEntityEntryWidgetState extends State<BusinessEntityEntryWidget> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController entityNameTextController;
  late final TextEditingController ownerNameTextController;
  late final TextEditingController ownerPhoneTextController;
  late final TextEditingController managementUnitTextController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    entityNameTextController = TextEditingController(
      text: widget.entity?.name,
    );
    ownerNameTextController = TextEditingController(
      text: widget.entity?.ownerName,
    );
    ownerPhoneTextController = TextEditingController(
      text: widget.entity?.ownerPhone,
    );
    managementUnitTextController = TextEditingController(
      text: widget.entity?.managementUnit,
    );
  }

  @override
  void dispose() async {
    entityNameTextController.dispose();
    ownerNameTextController.dispose();
    ownerPhoneTextController.dispose();
    managementUnitTextController.dispose();
    super.dispose();
  }

  bool _validateBusinessEntityForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PageWithFormTemplate(
      title: widget.entity == null ? 'Criar novo ente' : 'Detalhe do ente',
      formWidget: BusinessEntityFormWidget(
        formKey: formKey,
        entityNameTextController: entityNameTextController,
        ownerNameTextController: ownerNameTextController,
        ownerPhoneTextController: ownerPhoneTextController,
        managementUnitTextController: managementUnitTextController,
      ),
      actions: [
        ButtonWidget(
          text: 'cancelar',
          onPressed: widget.onPressedCancel,
        ),
        ButtonWidget.info(
          text: 'criar ente',
          onPressed: widget.onPressedCreateEntity,
        ),
      ],
    );
  }
}
