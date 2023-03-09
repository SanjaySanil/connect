import 'package:connect/theme/theme.dart';
import 'package:flutter/material.dart';

class NavigationBarItems extends StatelessWidget {
  NavigationBarItems(
      {Key? key,
      this.isSelected = false,
      required this.onTap,
      required this.iconData,
      required this.label,
      required this.index})
      : super(key: key);
  final ValueChanged<int> onTap;
  final bool isSelected;
  final IconData iconData;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData,
                size: 20, color: isSelected ? AppColors.secondary : null),
            const SizedBox(height: 8),
            Text(
              label,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary)
                  : const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
