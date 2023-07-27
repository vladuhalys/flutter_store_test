import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';

Widget settingsAppBar(BuildContext context) => AppBar(
      title: Text('settings'.tr,
          style: GoogleFonts.montserrat(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          )),
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.transparent,
    );
