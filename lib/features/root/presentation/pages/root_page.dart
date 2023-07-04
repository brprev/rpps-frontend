import 'package:flutter/material.dart';

import '../../../business_entities/presentation/pages/business_entity_page/business_entities_page.dart';
import '../../../general_data/presentation/pages/general_data_page.dart';
import '../../../laws/presentation/pages/laws_entity_page/laws_entities_page.dart';
import '../../../upload_data/presentation/pages/upload_data_page.dart';
import '../../../users/presentation/pages/manage_users_page.dart';
import '../widget/adaptive_scaffold.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _pageIndex = 0;

  static Widget _pageAtIndex(int index) {
    final pagesMap = <int, Widget>{
      0: const GeneralDataPage(),
      1: const BusinessEntitiesPage(),
      2: const ManageLawsPage(),
      3: const ManageUsersPage(),
      4: const UploadDataPage(),
    };

    return pagesMap[index] ?? const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: const Text('Dashboard App'),
      currentIndex: _pageIndex,
      destinations: const [
        AdaptiveScaffoldDestination(
          title: 'Dados gerais',
          icon: Icons.info,
        ),
        AdaptiveScaffoldDestination(
          title: 'Gerenciar entes',
          icon: Icons.business,
        ),
        AdaptiveScaffoldDestination(
          title: 'Gerenciar leis',
          icon: Icons.gavel,
        ),
        AdaptiveScaffoldDestination(
          title: 'Gerenciar usuários',
          icon: Icons.people,
        ),
        AdaptiveScaffoldDestination(
          title: 'Alimentar sistema',
          icon: Icons.add,
        ),
      ],
      body: _pageAtIndex(_pageIndex),
      onNavigationIndexChange: (index) => setState(() => _pageIndex = index),
    );
  }
}
