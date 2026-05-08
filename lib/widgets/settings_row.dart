import 'package:flutter/material.dart';

class SettingsRow extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final bool showDivider;
  final IconData icon;
  final Color? iconColor;

  const SettingsRow({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
    this.showDivider = true,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //== Icon ==//
              Icon(
                icon,
                color: iconColor ?? Theme.of(context).colorScheme.secondary,
                size: 18,
              ),
              const SizedBox(width: 12),

              //== Title & Icon or Toggle Right ==//
              Expanded(
                //== Title ==//
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              //== Toggle or Icon ==//
              if (trailing != null) ...[
                const SizedBox(width: 8),
                trailing!,
              ],
            ],
          ),
        ),

        //== Divider ==//
        if (showDivider) ...[
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).colorScheme.outline,
          ),
        ],
      ],
    );
  }
}
