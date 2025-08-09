import 'package:enzomir/core/common/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:enzomir/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:enzomir/init_dependencies.dart';
import 'package:enzomir/presentation/root/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppUserCubit, AppUserState, bool>(
      selector: (state) {
        return state is AppUserLoggedIn;
      },
      builder: (context, isLoggedIn) {
        if (isLoggedIn) {
          return MainMaterialApp(true);
        } else {
          return MainMaterialApp(false);
        }
      },
    );
  }
}

class MainMaterialApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainMaterialApp(this.isLoggedIn, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter(isLoggedIn).router,
      debugShowCheckedModeBanner: false,
    );
  }
}
