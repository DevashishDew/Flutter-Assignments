
import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-2/model/profile_item.dart';

class FavouritePeopleItemWidget extends StatelessWidget {
  const FavouritePeopleItemWidget({
    super.key,
    required this.favPeople,
  });

  final FavouritePeople favPeople;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            height: 75,
            width: 75,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                (favPeople.profileUrl != null)
                    ? CircleAvatar(
                  backgroundImage: AssetImage(favPeople.profileUrl!),
                  backgroundColor: Colors.black,
                )
                    : CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: Text(
                      favPeople.userName.substring(0, 2).toUpperCase()),
                ),
                Positioned(
                  right: -4,
                  bottom: 3,
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(favPeople.countryIconUrl),
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(favPeople.userName.length > 10
            ? '${favPeople.userName.substring(0, 10)}...'
            : favPeople.userName),
      ],
    );
  }
}