import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Center(
                  child: Icon(
                    Icons.list_alt,
                    size: 100,
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: const Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 5),
                      Text(
                        "Settings",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/settings_page_screen');
                },
              )
              // ElevatedButton(
              //     style: ButtonStyle(),
              //     onPressed: () {
              //       Navigator.popAndPushNamed(context, '/settings_page_screen');
              //     },
              //     child: const Text("Settings")),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Supabase.instance.client.auth.signOut();
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/log_page_screen',
              (route) => false,
            );
          },
          style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
          child: const Text(
            'Выход',
            // style: theme.textTheme.titleSmall,
          ),
        )
      ],
    );
  }
}
