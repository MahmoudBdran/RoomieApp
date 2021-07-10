import 'package:flutter/material.dart';

import 'image_only_page.dart';

class PostPhotosOnly extends StatefulWidget {
  List imagesList;
  PostPhotosOnly(this.imagesList);
  @override
  _PostPhotosOnlyState createState() => _PostPhotosOnlyState();
}

class _PostPhotosOnlyState extends State<PostPhotosOnly> {

  List get imagesList => widget.imagesList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(imagesList[0]);
  }
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
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ImageOnlyPage(imagesList[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Image.network(imagesList[index],fit: BoxFit.cover,),
                    ),
                  );
                },
              ),
            )
        ),
      ),
    );

  }
}