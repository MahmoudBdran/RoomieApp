import 'package:flutter/material.dart';

class PostPhotosOnly extends StatefulWidget {
  List<String>imagesList;
  PostPhotosOnly(this.imagesList);
  @override
  _PostPhotosOnlyState createState() => _PostPhotosOnlyState();
}

class _PostPhotosOnlyState extends State<PostPhotosOnly> {

  List<String> get imagesList => widget.imagesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: imagesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Image.asset(imagesList[index],fit: BoxFit.cover,),
                );
              },
            ),
          )
          ),
        ),
      );

  }
}
