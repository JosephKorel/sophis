import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/ui/pages/main.dart';
import 'package:sophis/app/core/cubit/theme_cubit.dart';
import 'package:sophis/app/home/cubit/philosophers_cubit.dart';
import 'package:sophis/app/home/ui/pages/details.dart';
import 'package:sophis/app/home/ui/pages/main.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';
import 'package:sophis/app/saved_advices/ui/pages/main.dart';
import 'package:sophis/injection_container.dart';

/* Tenho um aplicativo sobre filosofia, na tela principal tenho uma série de filósofos, quando você clicar num filósofo específico, quero falar sobre a história dele e da escola dele. Estava pensando em dividir a história dele e de sua filosofia em 4 partes. O que você acha? Como poderiam ser as divisões? */

extension GetThemeMode on BuildContext {
  bool get isDark => MediaQuery.of(this).platformBrightness == Brightness.dark;
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeView();
      },
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) => const PhilosopherDetailsView(),
        ),
        GoRoute(
          path: 'advice',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            child: BlocProvider(
              create: (context) => AdviceBloc(locator()),
              child: const AdviceView(
                adviceEvent: null,
              ),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: BlocProvider(
                  create: (context) => AdviceBloc(locator()),
                  child: const AdviceView(
                    adviceEvent: null,
                  ),
                ),
              );
            },
          ),
        ),
        GoRoute(
          path: 'savedAdvices',
          builder: (context, state) => const SavedAdvicesView(),
        ),
      ],
    ),
  ],
);

Future<void> main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();

  await setUpLocator();

  Animate.restartOnHotReload = true;

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
        BlocProvider<PhilosophersCubit>(
          create: (_) => PhilosophersCubit(),
        ),
        BlocProvider<SavedAdviceCubit>(
          create: (_) => locator<SavedAdviceCubit>(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Sophis',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: state.colorScheme.light,
              useMaterial3: true,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            darkTheme: ThemeData(
              colorScheme: state.colorScheme.dark,
              useMaterial3: true,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
