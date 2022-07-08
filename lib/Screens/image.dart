import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';


class Images extends StatelessWidget {
  String image;
   Images({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:"image",
      transitionOnUserGestures: true,
      child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,
          placeholder: (context, url) => loder,
          errorWidget: (context, url, error) => const Center(child: Icon(Icons.error))
          // Image.network(
          //     "https://i.gifer.com/DKke.gif"),
          ),
    );
  }
}