import 'package:flutter/material.dart';

class MenuItem {
  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Riverpod counter',
    subTitle: 'Riverpod introduction',
    link: '/counter-river',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Buttons',
    subTitle: 'Several Flutter Buttons',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'Styled Container',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'General and Controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars',
    subTitle: 'Snackbars',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Animated Stateful Widget',
    link: '/animated',
    icon: Icons.check_box_outlined,
  ),
  MenuItem(
    title: 'Ui Controls and Tiles',
    subTitle: 'A series of controls',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Application Intro',
    subTitle: 'Tutorial',
    link: '/tutorial',
    icon: Icons.accessibility_rounded,
  ),
  MenuItem(
    title: 'Infinite Scroll and Pull',
    subTitle: 'Infinite lists and pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Change Theme',
    subTitle: 'Change Application Theme',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),

];
