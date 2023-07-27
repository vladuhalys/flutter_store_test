import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.all(Radius.circular(35)), // Image border
            child: Image.network(FirebaseAuth.instance.currentUser!.photoURL ==
                    null
                ? 'https://thinksport.com.au/wp-content/uploads/2020/01/avatar-.jpg'
                : user!.photoURL.toString().replaceFirst('s96-c', 's400-c')),
          ),
        ),
        const SizedBox(height: 10),
        Text(
            (user!.displayName == null)
                ? 'unknown_user'.tr
                : '${user.displayName}',
            style: GoogleFonts.montserrat(
              fontSize: 26.0,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF5566FF),
            )),
        const SizedBox(height: 10),
        Text('${user.email}', style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
