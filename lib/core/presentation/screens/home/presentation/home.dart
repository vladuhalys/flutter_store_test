import 'package:flutter/material.dart';
import 'package:flutter_store_test/core/presentation/screens/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter_store_test/core/presentation/screens/home/presentation/widgets/home_body.dart';
import 'package:flutter_store_test/core/presentation/screens/home/presentation/widgets/home_drawer.dart';
import 'package:flutter_store_test/core/presentation/screens/home/presentation/widgets/home_floating_button.dart';
import 'package:flutter_store_test/core/presentation/screens/settings/domain/theme_get_x.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeGetXController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              drawer: const HomeDrawer(),
              appBar: homeAppBar() as PreferredSizeWidget?,
              body: const HomeBody(),
              floatingActionButton: const HomeFloatingActionButton()));
    });
  }
}
