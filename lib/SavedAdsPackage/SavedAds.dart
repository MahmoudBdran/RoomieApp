import 'package:flutter/material.dart';
import 'package:roommates/NewsFeedPackage/PostContainer.dart';

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
        itemCount: 10,
        itemBuilder: (context, index) => PostTemplate("images/user_avatar.png", "Israa Hamdy"),
      ),
    );
  }
}
