import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profileAppBar(BuildContext context) {
  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  return AppBar(
    title: Text('profile_titel'.tr,
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
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: TextButton(
          onPressed: () => signOut(),
          child: Text(
            'sign_out'.tr,
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    ],
    backgroundColor: Colors.transparent,
  );
}
