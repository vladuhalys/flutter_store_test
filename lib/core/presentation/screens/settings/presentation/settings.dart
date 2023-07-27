import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/presentation/widgets/settings_app_bar.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/presentation/widgets/settings_body.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeGetXController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: settingsAppBar(context) as PreferredSizeWidget?,
          body: const SettingsBody(),
        ),
      );
    });
  }
}
