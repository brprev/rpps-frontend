import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/routes/routes_manager.dart';
import 'core/services/service_locator.dart' as di;
import 'core/theme/managers/theme_manager.dart';
import 'features/auth/presentation/pages/sign_in_page/sign_in_cubit.dart';
import 'features/business_entities/presentation/pages/business_entity_page/business_entities_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<SignInCubit>()..onInit(context),
        ),
        BlocProvider(create: (context) => di.sl<BusinessEntitiesCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: createTheme(),
        routerConfig: AppRoutes.createRouter(),
      ),
    );
  }
}
