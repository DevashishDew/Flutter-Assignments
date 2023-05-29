import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-3/model/travel_model.dart';
import 'package:transparent_image/transparent_image.dart';

class QuickLinkComponent extends StatelessWidget {
  const QuickLinkComponent({super.key, required this.quickLink});

  final QuickLink quickLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: quickLink.quickLinkSubItem.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(
                      quickLink.quickLinkSubItem[index].imageUrl),
                  fit: BoxFit.cover,
                  height: 70,
                  width: 70,
                ),
              ),
              Text(
                quickLink.quickLinkSubItem[index].title,
                style: const TextStyle(
                    fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
