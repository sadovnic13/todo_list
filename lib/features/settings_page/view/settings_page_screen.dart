import 'package:flutter/material.dart';

class SettingsPageScreen extends StatefulWidget {
  const SettingsPageScreen({super.key});

  @override
  State<SettingsPageScreen> createState() => SettingsStatePageScreen();
}

class SettingsStatePageScreen extends State<SettingsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Column(
        children: [
          Expanded(
              child: Column(
            children: [
              LanguageSelector(),
            ],
          )),
        ],
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  List<String> items = ["English", "Русский", "中文", "العربية", "Español"];
  String? selectedItem = "English";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Select language"),
        const SizedBox(width: 5),
        DropdownButton<String>(
          value: selectedItem,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (item) => setState(() => selectedItem = item),
        ),
      ],
    );
  }
}
