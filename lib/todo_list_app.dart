import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/home_page/bloc/homepage_bloc.dart';
import 'generated/l10n.dart';
import 'repositories/repositories.dart';
import 'router/router.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomepageBloc(ToDoRepositories()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale('ar'),
        theme: ThemeData(
          fontFamily: 'Sora',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.transparent,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 246, 255, 0)),
          // useMaterial3: true,
        ),
        initialRoute: Supabase.instance.client.auth.currentSession != null ? '/home_page_screen' : '/log_page_screen',
      ),
    );
  }
}
