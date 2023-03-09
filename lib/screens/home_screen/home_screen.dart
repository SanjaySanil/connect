import 'package:connect/pages/call_page.dart';
import 'package:connect/pages/contact_page.dart';
import 'package:connect/pages/message_pages.dart';
import 'package:connect/pages/notifications_page.dart';
import 'package:connect/screens/home_screen/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:connect/widgets/avatar.dart';
import 'package:connect/widgets/helpers.dart';
import 'package:connect/widgets/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier("Messages");
  final pages = const [
    MessagesPage(),
    NotificationPage(),
    CallPage(),
    ContactPage(),
  ];
  final pageTitles = ['Messages', 'Notifications', 'Calls', 'Contacts'];

  void onNavigationItemSelected(index) {
    pageIndex.value = index;
    title.value = pageTitles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      appBar: AppBar(
        iconTheme:Theme.of(context).iconTheme,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            );
          },
        ),
        leadingWidth:54,
        leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(icon: Icons.search, onTap: () {})),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Avatar.small(
              url: Helper.randomPictureUrl(),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBarCreated(onItemSelected: onNavigationItemSelected),
    );
  }
}
