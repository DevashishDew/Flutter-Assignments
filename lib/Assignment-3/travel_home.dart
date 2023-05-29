import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-3/model/travel_model.dart';
import 'package:flutter_assignments/Assignment-3/widget/SearchWidget.dart';
import 'package:flutter_assignments/Assignment-3/widget/hotels.dart';
import 'package:flutter_assignments/Assignment-3/widget/main_component.dart';
import 'package:flutter_assignments/Assignment-3/widget/popular.dart';
import 'package:flutter_assignments/Assignment-3/widget/quick_link.dart';
import 'package:flutter_assignments/Assignment-3/widget/stories.dart';
import 'package:flutter/rendering.dart';

class TravelHome extends StatelessWidget {
  const TravelHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  debugPaintSizeEnabled = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Explore',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.notifications,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: dummyHotelData.length,
                    itemBuilder: (_, index) {
                      final componentData = dummyHotelData[index];
                      if (componentData is QuickLink) {
                        return QuickLinkComponent(quickLink: componentData);
                      } else if (componentData is SearchComponent) {
                        return const SearchItem();
                      } else if (componentData is Stories) {
                        return StoryComponent(stories: componentData);
                      } else if (componentData is Popular) {
                        return PopularComponent(popular: componentData);
                      } else if (componentData is MainComponent) {
                        return MainWidget(mainComponent: componentData);
                      } else if (componentData is Hotels) {
                        return HotelsComponent(hotels: componentData);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
