import 'package:connect/screens/home_screen/NavigationBarItems/navigartion_bar_items.dart';
import 'package:connect/theme/theme.dart';
import 'package:connect/widgets/glowing_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCreated extends StatefulWidget {
  const BottomNavigationBarCreated({
    required this.onItemSelected,
    super.key,
  });

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavigationBarCreated> createState() =>
      _BottomNavigationBarCreatedState();
}

class _BottomNavigationBarCreatedState
    extends State<BottomNavigationBarCreated> {
  var selectedIndex = 0;

  void handleItemsSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationBarItems(
                  isSelected: (selectedIndex == 0),
                  onTap: handleItemsSelected,
                  index: 0,
                  iconData: CupertinoIcons.bubble_left_bubble_right_fill,
                  label: "Messages"),
              NavigationBarItems(
                  isSelected: (selectedIndex == 1),
                  onTap: handleItemsSelected,
                  index: 1,
                  iconData: CupertinoIcons.bell_solid,
                  label: "Notifications"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8),
                child: GlowingActionButton(
                    color: AppColors.secondary,
                    icon: CupertinoIcons.plus,
                    onTap: () {}),
              ),
              NavigationBarItems(
                  isSelected: (selectedIndex == 2),
                  onTap: handleItemsSelected,
                  index: 2,
                  iconData: CupertinoIcons.phone_fill,
                  label: "Calls"),
              NavigationBarItems(
                  isSelected: (selectedIndex == 3),
                  onTap: handleItemsSelected,
                  index: 3,
                  iconData: CupertinoIcons.person_2_fill,
                  label: "Contacts"),
            ],
          ),
        ),
      ),
    );
  }
}
