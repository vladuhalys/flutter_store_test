import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/presentation/widgets/settings_switch_lang.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/presentation/widgets/settings_switch_theme.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SwitchSettingsTheme(),
          SwitchSettingsLang(),
        ],
      ),
    );
  }
}
