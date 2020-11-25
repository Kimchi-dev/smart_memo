import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ShowImages extends StatefulWidget {
  List galleryItems = [];
  @override
  _ShowImagesState createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(widget.galleryItems[index].image),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
            );
          },
          itemCount: galleryItems.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
          backgroundDecoration: widget.backgroundDecoration,
          pageController: widget.pageController,
          onPageChanged: onPageChanged,
        )
    );;
  }
}

