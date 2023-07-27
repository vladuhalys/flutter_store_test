import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/profile/presentation/widgets/profile_app_bar.dart';
import 'package:flutter_store_test/core/presentation/screens/profile/presentation/widgets/profile_body.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: profileAppBar(context) as PreferredSizeWidget?,
      body: const ProfileBody(),
    );
  }
}
