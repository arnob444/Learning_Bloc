import 'package:ecommerce/src/bloc/authentication/remember_switch_cubit.dart';
import 'package:ecommerce/src/bloc/blocs.dart';
import 'package:ecommerce/src/data/repositiories/auth_repository.dart';
import 'package:ecommerce/src/routes/route_pages.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocEcommerceApp extends StatelessWidget {
  const BlocEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => AuthRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashCubit()..startSplash()),
          BlocProvider(create: (context) => RememberSwitchCubit()),
          BlocProvider(create: (context) => SignupBloc()),
          BlocProvider(create: (context) => LoginBloc(context.read<AuthRepository>())),
        ],
        child: ScreenUtilInit(
          designSize: Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              theme: const MaterialTheme(TextTheme()).light(),
              darkTheme: const MaterialTheme(TextTheme()).dark(),
              debugShowCheckedModeBanner: false,
              routerConfig: RoutePages.ROUTER,
            );
          },
        ),
      ),
    );
  }
}
