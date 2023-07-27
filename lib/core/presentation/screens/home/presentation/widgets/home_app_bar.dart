import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/home/presentation/widgets/login_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';

Widget homeAppBar() => AppBar(
      title: Text('store'.tr,
          style: GoogleFonts.montserrat(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          )),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions: const [
        LoginItem(),
      ],
    );
