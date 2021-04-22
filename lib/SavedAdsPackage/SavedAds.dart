import 'package:flutter/material.dart';
import 'package:roommates/NewsFeedPackage/PostContainer.dart';
import 'package:roommates/constant/data.dart';

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
      ),
      body: ListView.builder(
        itemCount: postData.length,
        itemBuilder: (context, index) => PostTemplate(index),
      ),
    );
  }
}
