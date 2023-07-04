import 'package:flutter/material.dart';
import 'package:rpps/features/root/presentation/widget/drawer_header_widget.dart';
import 'package:rpps/features/root/presentation/widget/vertical_divider_widget.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/theme/constants/app_colors.dart';
import '../../../../core/theme/constants/app_sizes.dart';

class AdaptiveScaffoldDestination {
  const AdaptiveScaffoldDestination({
    required this.title,
    required this.icon,
  });

  final IconData icon;
  final String title;
}

class AdaptiveScaffold extends StatefulWidget {
  const AdaptiveScaffold({
    required this.currentIndex,
    required this.destinations,
    this.title,
    this.body,
    this.onNavigationIndexChange,
    super.key,
  });

  final Widget? body;
  final int currentIndex;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int>? onNavigationIndexChange;
  final Widget? title;

  @override
  State<AdaptiveScaffold> createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  void _destinationTapped(AdaptiveScaffoldDestination destination) {
    final index = widget.destinations.indexOf(destination);
    if (index != widget.currentIndex) widget.onNavigationIndexChange!(index);
  }

  bool get _isLargeScreen => context.mediaQuery.size.width > 960.0;

  bool get _isMediumScreen => context.mediaQuery.size.width > 640.0;

  @override
  Widget build(BuildContext context) {
    if (_isLargeScreen) {
      return Row(
        children: [
          Drawer(
            width: AppSizes.s232,
            backgroundColor: AppColors.primary,
            child: Column(
              children: [
                const DrawerHeaderWidget(),
                ...List.generate(
                  widget.destinations.length,
                  (index) {
                    final destination = widget.destinations[index];

                    final isSelected =
                        widget.destinations.indexOf(destination) ==
                            widget.currentIndex;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.s2,
                      ).copyWith(bottom: AppSizes.s2),
                      child: ListTile(
                        title: Text(destination.title),
                        leading: Icon(destination.icon),
                        selectedColor: Colors.white,
                        iconColor: Colors.black,
                        textColor: Colors.black,
                        tileColor: Colors.white,
                        selectedTileColor: Colors.grey.shade500,
                        selected: isSelected,
                        onTap: () => _destinationTapped(destination),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const VerticalDividerWidget(),
          Expanded(
            child: Scaffold(body: widget.body),
          ),
        ],
      );
    }

    if (_isMediumScreen) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              useIndicator: true,
              unselectedIconTheme: const IconThemeData(color: Colors.black),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: AppColors.primary,
              destinations: [
                ...widget.destinations.map(
                  (d) => NavigationRailDestination(
                    icon: Icon(d.icon),
                    label: Text(d.title),
                  ),
                ),
              ],
              selectedIndex: widget.currentIndex,
              onDestinationSelected: widget.onNavigationIndexChange,
            ),
            const VerticalDividerWidget(),
            Expanded(child: widget.body ?? const SizedBox.shrink()),
          ],
        ),
      );
    }

    return Scaffold(
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: context.bodySmall?.copyWith(color: Colors.black),
        unselectedLabelStyle: context.bodySmall?.copyWith(color: Colors.black),
        items: [
          ...widget.destinations.map(
            (d) => BottomNavigationBarItem(
              icon: Icon(d.icon),
              label: d.title,
            ),
          ),
        ],
        currentIndex: widget.currentIndex,
        onTap: widget.onNavigationIndexChange,
      ),
    );
  }
}
