import 'package:flutter/material.dart';
import 'package:flutter_assignments/Assignment-3/model/travel_model.dart';
import 'package:transparent_image/transparent_image.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key, required this.popular});

  final Popular popular;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              popular.title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popular.poupularSubItem.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 1 / 2.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return PopularItem(
                    popular: popular.poupularSubItem[index],
                    serialNo: '${index + 1}',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
    required this.popular,
    required this.serialNo,
  });

  final PopularSubItem popular;
  final String serialNo;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: width * 0.9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(popular.imageUrl),
                fit: BoxFit.cover,
                height: 120,
                width: 140,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                serialNo,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Spacer(),
                  Text(
                    popular.title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    popular.subTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  const Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
