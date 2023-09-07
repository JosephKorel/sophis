import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/ui/pages/main.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/home/ui/pages/details.dart';
import 'package:sophis/app/home/ui/pages/main.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';
import 'package:sophis/config/theme/color_schemes.g.dart';
import 'package:sophis/config/theme/dark_scheme.g.dart';
import 'package:sophis/injection_container.dart';

extension GetThemeMode on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) => const PhilosopherDetailsView(),
        ),
        GoRoute(
          path: 'advice',
          builder: (context, state) => const AdviceView(),
        ),
      ],
    ),
  ],
);

Future<void> main() async {
  await dotenv.load();

  setUpLocator();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhilosophersCubit>(create: (_) => PhilosophersCubit()),
        BlocProvider(create: (_) => locator<AdviceBloc>()),
        BlocProvider<SavedAdviceCubit>(create: (_) => SavedAdviceCubit()),
      ],
      child: MaterialApp.router(
        title: 'Sophis',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        darkTheme: ThemeData(
          colorScheme: darkScheme,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routerConfig: _router,
      ),
    );
  }
}
