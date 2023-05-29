import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-3/model/travel_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key, required this.mainComponent});

  final MainComponent mainComponent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(mainComponent.imageUrl),
          fit: BoxFit.cover,
          height: 320,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 185,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainComponent.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  mainComponent.subTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: mainComponent.mainComponentSubItem.length,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: NetworkImage(mainComponent
                                  .mainComponentSubItem[index].imageUrl),
                              fit: BoxFit.cover,
                              height: 120,
                              width: 180,
                            ),
                          ),
                          Text(
                            mainComponent.mainComponentSubItem[index].title,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
