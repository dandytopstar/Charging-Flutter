import 'package:flutter/material.dart';
import '../models/category.dart';
// import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(category.video)),
                  ),
                ),
                CachedNetworkImage(
                  width: 140,
                  imageUrl: category.video,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          // ignore: sized_box_for_whitespace
                          child: Container(
                    width: 60,
                    height: 60,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blue), // Set the color of the loading circle
                      // value: downloadProgress.progress,
                    ),
                  )),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10), // Set the desired border radius here
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
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
