import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roommates/SearchResultPackage/SearchResult.dart';

class AreaSearchPage extends StatefulWidget {
  @override
  _AreaSearchPageState createState() => _AreaSearchPageState();
}

class _AreaSearchPageState extends State<AreaSearchPage> {
  Widget Search(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[400],width: 1),),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon:Icon(EvaIcons.searchOutline,color: Colors.grey,size: 28,),
            hintText: "Search in Specific area..",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
            )
          ),
        ),
      ),
    );
  }
  List<String> Regions=["Alexandria","Aswan","Asyut","Beheira",
    "Beni suef","Cairo","Dakahlia","Demietta",
    "Faiyum","Gharbia","Giza","Ismaillia","Kafr El Sheikh","Luxor","Matrouh","Minya","Monufia","New Valley","North Sinai","Port Said",
    "Qalyubia","Qena","Red Sea","Sharqia","Sohag","South Sinai","Suez"
  ];
  Widget RegionsWidget(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 27,
          itemBuilder: (context, index) {
            return  GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: Colors.grey[300],width: 1
                        )
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(Regions[index],style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  ),
                ),
              )),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResult(Regions[index]),));
              },
            );
          }
          ),

        ),

    );
  }
  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Search(),
              RegionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
