import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/lang_get_x.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchSettingsLang extends StatelessWidget {
  const SwitchSettingsLang({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LangGetXControler>(
      builder: (controller) {
        return SwitchListTile(
          activeColor: Colors.indigo,
          title: Text('settings_lang'.tr,
              style: GoogleFonts.montserrat(
                  fontSize: 18.0, fontWeight: FontWeight.w400)),
          value: controller.isEng.value,
          onChanged: (value) {
            controller.changeLang();
            controller.update();
          },
          secondary: const Icon(Icons.language_rounded),
        );
      },
    );
  }
}
