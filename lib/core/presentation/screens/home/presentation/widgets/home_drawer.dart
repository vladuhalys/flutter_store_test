import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  String getTimeMessage() {
    DateTime now = DateTime.now();
    if (now.hour >= 0 && now.hour < 12) {
      return 'good_morning';
    } else if (now.hour >= 12 && now.hour < 18) {
      return 'good_afternoon';
    } else {
      return 'good_evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String timeMessage = getTimeMessage();
    String userInfo = (user != null)
        ? ((user.displayName == null) ? user.email : user.displayName)!
        : 'unknown_user';
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF5566FF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'store'.tr,
                  style: GoogleFonts.montserrat(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  (userInfo == 'unknown_user')
                      ? '${timeMessage.tr}!'
                      : '${timeMessage.tr}, $userInfo!',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_rounded),
            title: Text('shopping_cart'.tr,
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                )),
            onTap: () => Get.toNamed('/shopping_cart'),
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: Text('settings'.tr,
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                )),
            onTap: () => Get.toNamed('/settings'),
          ),
        ],
      ),
    );
  }
}
