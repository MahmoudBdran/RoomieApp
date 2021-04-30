import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photo_view/photo_view.dart';
import 'package:roommates/theme/colors.dart';

class ImageOnlyPage extends StatefulWidget {
  String image_link;

  ImageOnlyPage(this.image_link);

  @override
  _ImageOnlyPageState createState() => _ImageOnlyPageState();
}

class _ImageOnlyPageState extends State<ImageOnlyPage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Center(
                child: PhotoView(
                  imageProvider: NetworkImage(widget.image_link),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                icon: Icon(Icons.download_sharp,color: Colors.white,),
                onPressed: (){
                 loadImage(widget.image_link);
                },
              ))
            ],
          )
        ),
      ),
    );
  }
  downloadImage(url)async{
    try{
      await ImageDownloader.downloadImage(url).then((_) {
        Fluttertoast.showToast(
            msg: "Downloaded Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }catch(e){
      throw Exception("failed to download image");
    }

  }
  void loadImage(url) async{
    var imageId= await ImageDownloader.downloadImage(url);
    var path = await ImageDownloader.findPath(imageId);
    File image = File(path);
    setState(() {
      _image=image;
      Fluttertoast.showToast(
          msg: "Downloaded Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
