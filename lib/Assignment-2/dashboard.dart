import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-2/model/dashbord_item.dart';
import 'package:flutter_assignments/Assignment-2/model/profile_item.dart';
import 'package:flutter_assignments/Assignment-2/widgets/dashboard_item.dart';
import 'package:flutter_assignments/Assignment-2/widgets/favourite_people.dart';
import 'package:flutter_assignments/Assignment-2/widgets/notification_icon.dart';
import 'package:google_fonts/google_fonts.dart';

const kLightGreyColor = Color.fromARGB(207, 23, 22, 22);

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Hi Ehi',
                      style: TextStyle(color: kLightGreyColor),
                    ),
                    NotificationIcon(),
                  ],
                ),
                Text(
                  '1,234.00',
                  style: GoogleFonts.albertSans(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Image(
                      image: AssetImage('assets/images/icon_india.png'),
                      width: 18,
                      height: 18,
                    ),
                    SizedBox(width: 4),
                    Text('GHS'),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
                const SizedBox(height: 48),
                const Text(
                  'Here are something you can do',
                  style: TextStyle(color: kLightGreyColor),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: gridItemData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dashboardItem = gridItemData[index];
                        return DashBoardItemWidget(
                            dashboardItem: dashboardItem);
                      }),
                ),
                const Text(
                  'Your Favourite people',
                  style: TextStyle(color: kLightGreyColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors
                            .grey, // replace with your desired background color
                      ),
                      child: const Icon(
                        Icons.add, // replace with your desired icon
                        color: Colors.black45, // repla
                        size: 40, // ce with your desired icon color
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 92, // set fixed height
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dummyPeopleData.length,
                          itemBuilder: (context, index) {
                            final favPeople = dummyPeopleData[index];
                            return FavouritePeopleItemWidget(
                                favPeople: favPeople);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
