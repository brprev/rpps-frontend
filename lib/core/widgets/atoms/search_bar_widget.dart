import 'package:flutter/material.dart';

import '../../theme/constants/app_sizes.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.onSearch,
  });

  final String hintText;
  final void Function(String) onSearch;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppSizes.s24);

    final borderDecoration = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: const BorderSide(color: Colors.transparent),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) => widget.onSearch(value),
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: const Icon(Icons.search),
          border: borderDecoration,
          errorBorder: borderDecoration,
          enabledBorder: borderDecoration,
          disabledBorder: borderDecoration,
          focusedBorder: borderDecoration,
          focusedErrorBorder: borderDecoration,
        ),
      ),
    );
  }
}
