import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-2/model/dashbord_item.dart';

const kLightGreyColor = Color.fromARGB(207, 23, 22, 22);

class DashBoardItemWidget extends StatelessWidget {
  const DashBoardItemWidget({
    super.key,
    required this.dashboardItem,
  });

  final DashBoardGridItem dashboardItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: dashboardItem.cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dashboardItem.icon,
              const SizedBox(height: 12),
              Text(
                dashboardItem.title,
                style:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              Text(
                dashboardItem.subTitle,
                style: const TextStyle(fontSize: 12.0, color: kLightGreyColor, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}