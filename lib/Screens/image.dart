import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';


class Images extends StatelessWidget {
  String image;
   Images({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kTransparent,
          foregroundColor: kblackcolor,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
    
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  backgroundColor: kblackcolor,
                  foregroundColor: kwhitecolor,
                  radius: 15,
                  child: Icon(Icons.close)),
              ),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Center(
          child: Hero(
          tag:"image",
          transitionOnUserGestures: true,
          child: CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: image,
              placeholder: (context, url) => loder,
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error))
              // Image.network(
              //     "https://i.gifer.com/DKke.gif"),
              ),
      ),
        ),
      ),
    );
       }
}