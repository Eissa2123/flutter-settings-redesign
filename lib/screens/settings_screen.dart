import 'package:flutter/material.dart';
import 'package:flutter_settings_redesign/controllers/theme_controller.dart';
import 'package:flutter_settings_redesign/widgets/settings_row.dart';
import 'package:flutter_settings_redesign/widgets/settings_section.dart';
import 'package:flutter_settings_redesign/widgets/settings_switch.dart';
import 'package:flutter_settings_redesign/widgets/settings_profile.dart';
import 'package:get/get.dart';
import '../core/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isAutoLogin = false;
  bool isRememberLogin = false;
  bool isOnline = true;
  bool activePIN = false;

  _SettingsScreenState() {
    print('=== _SettingsScreenState created ===');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        //== Header ===//
        Padding(
          padding: const EdgeInsets.all(Constants.screenPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //== Back Button ===//
              InkWell(
                onTap: () {
                  //Get.offAllNamed('/');
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Constants.grayIconColor,
                ),
              ),

              SizedBox(width: 10),

              //== Title ===//
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: Constants.defaultSpacing),

        //== Profile Setting Section ===//
        SettingsProfile(
          name: 'Eissa Ba Awaidhan',
          email: 'baawaidhane@gmail.com',
          imageUrl: 'assets/images/eissa-pic.png',
          isOnline: isOnline,
        ),

        //== Account Settings Section ===//
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Security & Privacy',
                style: TextStyle(
                  fontSize: 12,
                  color: Constants.subTextColor,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: Constants.defaultSpacing / 2),

        //== Security & Privacy Card ===//
        SettingsSection(
          children: [
            //== Active Status Setting ===//
            SettingsRow(
              title: "Active Status",
              icon: Icons.circle,
              iconColor: isOnline ? Colors.green : Constants.grayIconColor,
              trailing: SettingsSwitch(
                value: isOnline,
                onChanged: (value) {
                  setState(() {
                    isOnline = value;
                  });
                },
                activeTrackColor: Colors.green,
              ),
            ),

            //== Auto Login ===//
            SettingsRow(
              title: "Auto Login",
              icon: Icons.auto_awesome_outlined,
              trailing: SettingsSwitch(
                value: isAutoLogin,
                onChanged: (value) {
                  setState(() {
                    isAutoLogin = value;
                  });
                },
                activeTrackColor: Colors.green,
              ),
            ),

            //== Remember Login ===//
            SettingsRow(
              title: "Remember Login Details",
              icon: Icons.password_rounded,
              trailing: SettingsSwitch(
                value: isRememberLogin,
                onChanged: (value) {
                  setState(() {
                    isRememberLogin = value;
                  });
                },
                activeTrackColor: Colors.green,
              ),
            ),

            //== PIN Code ===//
            SettingsRow(
              title: "PIN Code",
              icon: Icons.lock_outline,
              trailing: SettingsSwitch(
                value: activePIN,
                onChanged: (value) {
                  setState(() {
                    activePIN = value;
                  });
                },
                activeTrackColor: Colors.green,
              ),
              showDivider: false,
            ),
          ],
        ),

        SizedBox(height: Constants.defaultSpacing),

        //== Account Settings Section ===//
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 12,
                  color: Constants.subTextColor,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: Constants.defaultSpacing / 2),

        //== Settings Card ===//
        SettingsSection(
          children: [
            //== Dark Mode ==//
            SettingsRow(
              title: 'Dark Mode',
              icon: Icons.brightness_4_outlined,
              trailing: Obx(() {
                final themeController = Get.find<ThemeController>();
                return SettingsSwitch(
                  value: themeController.isDark.value,
                  showThumbIcon: true,
                  onChanged: (value) {
                    themeController.toggleTheme(value);
                  },
                  activeTrackColor: Colors.green,
                  activeColor: Constants.darkMode,
                  inactiveThumbColor: Constants.lightMode,
                );
              }),
            ),

            //== Language ==//
            SettingsRow(
              title: 'Language',
              icon: Icons.language_outlined,
              trailing: Icon(
                Icons.chevron_right,
                color: Constants.grayIconColor,
                size: 18,
              ),
            ),

            //== Logout ==//
            SettingsRow(
              title: 'Sign Out',
              icon: Icons.logout,
              trailing: Icon(
                Icons.chevron_right,
                color: Constants.grayIconColor,
                size: 18,
              ),
              showDivider: false,
            ),
          ],
        ),
      ],
    ));
  }
}
