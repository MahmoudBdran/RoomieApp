import 'package:flutter/material.dart';
import 'package:roommates/PostDetailsPackage/PostContainer.dart';
import 'package:roommates/constant/data.dart';
import 'package:roommates/theme/colors.dart';

class SavedAds extends StatefulWidget {
  @override
  _SavedAdsState createState() => _SavedAdsState();
}

class _SavedAdsState extends State<SavedAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Ads"),
        backgroundColor: applicationColor,
      ),
      body: ListView.builder(
        itemCount: postData.length,
        itemBuilder: (context, index) => PostTemplate(index),
      ),
    );
  }
}
