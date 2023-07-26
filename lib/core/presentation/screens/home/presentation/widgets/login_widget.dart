import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginItem extends StatelessWidget {
  const LoginItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextButton(
              onPressed: () => Get.toNamed('/sign_in'),
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
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 10.0),
            child: InkWell(
              onTap: () => Get.toNamed('/profile'),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser?.photoURL ?? '',
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextButton(
              onPressed: () => Get.toNamed('/sign_in'),
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
      },
    );
  }
}
