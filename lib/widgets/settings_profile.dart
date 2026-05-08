import 'package:flutter/material.dart';
import 'package:flutter_settings_redesign/core/constants.dart';

class SettingsProfile extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final bool isOnline;

  const SettingsProfile({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //== Pic + Status ==//
          Stack(
            children: [
              //== Pic ==//
              CircleAvatar(
                radius: 65,
                backgroundColor: Constants.cardColor,
                backgroundImage: AssetImage(imageUrl),
              ),

              //== Online Status ==//
              if (true)
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: isOnline
                          ? Constants.greenColor
                          : Constants.grayIconColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: Constants.defaultSpacing),

          //== Name and Email ==//
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            email,
            style: TextStyle(
              fontSize: 13,
              color: Constants.subTextColor,
            ),
          )
        ],
      ),
    );
  }
}
