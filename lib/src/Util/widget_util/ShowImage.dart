import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// ignore: must_be_immutable
class ShowImage extends StatefulWidget {
  ShowImage({Key key,@required this.initialIndex,this.imageList}) : super(key : key);
  int initialIndex;
  List<String> imageList;
  @override
  _ShowImageState createState() => _ShowImageState(initialIndex,imageList);
}

class _ShowImageState extends State<ShowImage> {
  final imageList;

  _ShowImageState(this.requestIndex,this.imageList);
  var _pageController;
  final int requestIndex;
  int _currentIndex ;
  int _totalIndex;

  @override
  void initState() {
     _pageController = PageController(initialPage: requestIndex);
    _currentIndex = _pageController.initialPage+1;
    _totalIndex = imageList.length;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
              title: Text(
                '$_currentIndex / $_totalIndex',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              backgroundColor: HexColor("#af40e8"),
              centerTitle: true,
            ),
          ),
          body: Container(
            child: PhotoViewGallery.builder(
              itemCount: imageList.length,
              builder: (context,index){
                return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(
                      imageList[index],
                    ),
                    initialScale: PhotoViewComputedScale.contained * 0.9,
                    minScale: PhotoViewComputedScale.contained * 0.9 ,
                    maxScale: PhotoViewComputedScale.covered * 1.6,
                );
              },
              scrollPhysics: BouncingScrollPhysics(),
              pageController: _pageController,
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

              onPageChanged: (index){
                setState(() {
                  _currentIndex = index+1;

                });
              },
              scrollDirection: Axis.vertical,

              enableRotation: true,
            ),
          ),
        ),
      );
  }
}
