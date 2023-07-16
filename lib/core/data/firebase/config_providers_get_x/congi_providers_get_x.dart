import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class FirebaseConfigProvidersGetX extends GetxController {
  var providers = [
    EmailAuthProvider(),
    GoogleProvider(clientId: dotenv.get('GOOGLE_CLIENT_ID')),
  ].obs;
}
