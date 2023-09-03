import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/config/theme/color_schemes.g.dart';
import 'package:sophis/cubit/philosophers_cubit.dart';
import 'package:sophis/ui/pages/details.dart';
import 'package:sophis/ui/pages/main.dart';

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
      ],
    ),
  ],
);

void main() {
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
      ],
      child: MaterialApp.router(
        title: 'Sophis',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routerConfig: _router,
      ),
    );
  }
}
