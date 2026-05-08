import 'package:flutter/material.dart';
import '../core/constants.dart';

class SettingsSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final double scale;
  final bool showThumbIcon;

  const SettingsSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Constants.cardColor,
    this.activeTrackColor = Constants.greenColor,
    this.inactiveThumbColor = Constants.cardColor,
    this.scale = 0.6,
    this.showThumbIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Switch(
        value: value,
        onChanged: onChanged,
        //== Toggle Circle Colors on Active ==//
        activeColor: activeColor,
        //== Toggle Track Colors on Active ==//
        activeTrackColor: activeTrackColor,
        //== Toggle Circle Colors on Inactive ==//
        inactiveThumbColor: inactiveThumbColor,
        //== Toggle Track Colors on Inactive ==//
        inactiveTrackColor: const Color(0xFFD9D9D9),
        //== Size for better touch target ==//
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

        //== Show Icons on the Toggle Circle ==//
        thumbIcon: showThumbIcon
            ? MaterialStateProperty.resolveWith<Icon?>(
                (states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Icon(
                      Icons.dark_mode,
                      size: 16,
                      color: Color(0xff8a8889),
                    );
                  }
                  return const Icon(
                    Icons.light_mode,
                    size: 16,
                    color: Constants.textColor,
                  );
                },
              )
            : null,
      ),
    );
  }
}
