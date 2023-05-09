import 'package:flutter/material.dart';

class DashBoardGridItem {
  DashBoardGridItem(
      {required this.icon,
      required this.title,
      required this.subTitle,
      required this.cardBackgroundColor});

  final Icon icon;
  final String title;
  final String subTitle;
  final Color cardBackgroundColor;
}

final gridItemData = [
  DashBoardGridItem(
    icon: const Icon(Icons.insert_chart_outlined_rounded),
    title: 'Pay Someone',
    subTitle: 'To wallet, Bank or mobile number',
    cardBackgroundColor: const Color.fromARGB(140, 110, 243, 142),
  ),
  DashBoardGridItem(
    icon: const Icon(Icons.assistant_outlined),
    title: 'Request money',
    subTitle: 'To wallet, Bank or mobile number',
    cardBackgroundColor: const Color.fromARGB(129, 144, 138, 225),
  ),
  DashBoardGridItem(
    icon: const Icon(Icons.phone_android),
    title: 'Buy airtime',
    subTitle: 'To wallet, Bank or mobile number',
    cardBackgroundColor: const Color.fromARGB(136, 246, 229, 126),
  ),
  DashBoardGridItem(
    icon: const Icon(Icons.wallet),
    title: 'Pay bill',
    subTitle: 'To wallet, Bank or mobile number',
    cardBackgroundColor: const Color.fromARGB(119, 233, 137, 245),
  ),
];
