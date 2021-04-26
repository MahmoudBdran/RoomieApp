import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Image_Carousel extends StatefulWidget {
  List<String>imagesList;
  Image_Carousel(this.imagesList);
  @override
  _Image_CarouselState createState() => _Image_CarouselState();

}

class _Image_CarouselState extends State<Image_Carousel> {

  List<String> get imagesList => widget.imagesList;
  // List<Image> images(){
  //   List<Image> myImages=[Image.asset("images/post_image.png"),Image.asset("images/post_image.png"),Image.asset("images/post_image.png"),];
  //   for(int i ;i<imagesList.length;i++){
  //     myImages.add(Image.network(imagesList[i],fit: BoxFit.cover,));
  //   }
  //   return myImages;
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Carousel(
        boxFit: BoxFit.cover,
        images: List.generate(imagesList.length, (index) {
          return Image.network(imagesList[index],fit: BoxFit.cover,);
        }),
    autoplay: false,
    dotSize: 4,
    animationDuration: Duration(microseconds: 1000),
    animationCurve: Curves.fastOutSlowIn,

    ));
  }
}
