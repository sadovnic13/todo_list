import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/home_page/bloc/homepage_bloc.dart';
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
        theme: ThemeData(
          fontFamily: 'Sora',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.transparent,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 246, 255, 0)),
          // useMaterial3: true,
        ),
        initialRoute: Supabase.instance.client.auth.currentSession != null ? '/home_page_screen' : '/log_page_screen',
      ),
    );
  }
}
