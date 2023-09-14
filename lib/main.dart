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
import 'package:sophis/app/story/ui/pages/main.dart';
import 'package:sophis/injection_container.dart';

extension GetThemeMode on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
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
              child: AdviceView(
                adviceEvent: state.extra! as AdviceEvent,
              ),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: BlocProvider(
                  create: (context) => AdviceBloc(locator()),
                  child: AdviceView(
                    adviceEvent: state.extra! as AdviceEvent,
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
        GoRoute(
          path: 'history',
          builder: (context, state) => const PhilosopherHistoryView(),
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
