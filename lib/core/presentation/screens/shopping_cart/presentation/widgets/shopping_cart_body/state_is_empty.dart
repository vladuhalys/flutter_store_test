import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';

class StateIsEmpty extends StatelessWidget {
  const StateIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('empty_cart'.tr,
            style: GoogleFonts.montserrat(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            )));
  }
}
