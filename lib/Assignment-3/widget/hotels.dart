import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-3/model/travel_model.dart';
import 'package:transparent_image/transparent_image.dart';

class HotelsComponent extends StatelessWidget {
  const HotelsComponent({super.key, required this.hotels});

  final Hotels hotels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hotels.title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: hotels.hotelsSubItem.length,
              itemBuilder: (_, index) => HotelItem(
                hotelsSubItem: hotels.hotelsSubItem[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelItem extends StatelessWidget {
  final HotelsSubItem hotelsSubItem;

  const HotelItem({super.key, required this.hotelsSubItem});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.75,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)), // THIS NOT APPLYING !!!
        elevation: 6,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(hotelsSubItem.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: width * 0.75,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelsSubItem.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      hotelsSubItem.location,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 18,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 18,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 18,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 18,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          hotelsSubItem.rating,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotelsSubItem.distance,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all( Radius.circular(10.0),),
                          ),
                          child: Text(
                            hotelsSubItem.rate,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
