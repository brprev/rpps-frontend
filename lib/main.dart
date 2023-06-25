import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes_manager.dart';
import 'core/services/service_locator.dart' as di;
import 'core/theme/managers/theme_manager.dart';
import 'features/auth/presentation/pages/sign_in_page/sign_in_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<SignInCubit>()..onInit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: createTheme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: Routes.signInRoute,
      ),
    );
  }
}
