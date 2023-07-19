import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginItem extends StatelessWidget {
  const LoginItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: TextButton(
        onPressed: () => Get.toNamed('/settings'),
        child: Text(
          'sign_in'.tr,
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
