import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ShowImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PinchZoom(
        image: Image.network('http://placerabbit.com/200/333'),
        zoomedBackgroundColor: Colors.black.withOpacity(0.5),
        resetDuration: const Duration(milliseconds: 100),
        maxScale: 2.5,
      ),
    );
  }
}
