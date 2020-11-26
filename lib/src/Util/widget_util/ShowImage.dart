import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// ignore: must_be_immutable
class ShowImage extends StatefulWidget {
  ShowImage({Key key,@required this.initialIndex}) : super(key : key);
  int initialIndex;

  @override
  _ShowImageState createState() => _ShowImageState(initialIndex);
}

class _ShowImageState extends State<ShowImage> {
  final imageList = [
    'https://mblogthumb-phinf.pstatic.net/MjAxODA0MjRfNDkg/MDAxNTI0NTM2NjAwNTQw.IddxA8-dF1o5mTaOwiJqesGQwyEDYYXYiYKmdV-WSMUg.1Rm40HP8qmd2PMAVhm5cyKtlHeifbI2GSnT6FTOncJsg.JPEG.dmm_korea/%ED%92%8D%EA%B2%BD%EC%98%81%EC%96%B4%EB%A1%9C_%EC%97%94%EA%B5%AC%ED%99%94%EC%83%81%EC%98%81%EC%96%B41.jpg?type=w800',
    'https://i.pinimg.com/736x/5f/f3/d7/5ff3d71b5834971c30af475c99f67c02.jpg',
    'https://www.sjpost.co.kr/news/photo/202007/53199_48342_4214.jpg',
    'https://cdn.pixabay.com/photo/2019/08/01/12/36/illustration-4377408_960_720.png',
    'https://ojsfile.ohmynews.com/STD_IMG_FILE/2016/0516/IE001963941_STD.jpg'
  ];

  _ShowImageState(this.requestIndex);
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
