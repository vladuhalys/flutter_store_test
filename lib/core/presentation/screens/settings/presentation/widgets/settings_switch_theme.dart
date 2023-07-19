import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchSettingsTheme extends StatelessWidget {
  const SwitchSettingsTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeGetXController>(
      builder: (controller) {
        return SwitchListTile(
          activeColor: Colors.indigo,
          title: Text('settings_theme'.tr,
              style: GoogleFonts.montserrat(
                  fontSize: 18.0, fontWeight: FontWeight.w400)),
          value: controller.isDarkTheme.value,
          onChanged: (value) {
            controller.toggleTheme();
            controller.update();
          },
          secondary: const Icon(Icons.brightness_6_rounded),
        );
      },
    );
  }
}
