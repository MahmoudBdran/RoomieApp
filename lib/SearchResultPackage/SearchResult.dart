import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:roommates/PostDetailsPackage/PostContainer.dart';
import 'package:roommates/constant/data.dart';

class SearchResult extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String selected_region;
  SearchResult(this.selected_region);

  @override
  _SearchResultState createState() => _SearchResultState();
}
class _SearchResultState extends State<SearchResult> {

  String selectedGuestsOption="default";
  String selectedTypeOption="default";
  String selectedSmokingOption="default";
  String selectedGenderOption="default";
  String selectedPetsOption="default";
  RangeValues _currentRangeValues = const RangeValues(0, 100000);
  Widget SpecifiedAddressField() {
    return TextField(
        decoration: InputDecoration(
            prefixIcon:Icon(EvaIcons.searchOutline,color: Colors.grey,size: 28,),
            hintText: "Type a specified area in ${widget.selected_region}",
            hintStyle: GoogleFonts.poppins(
              color: Colors.black54,
            ),
            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            fillColor: Color(0xfff3f3f4),
            filled: true));
  }
  Widget PetsFilter(){
    List<DropdownMenuItem> petsoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "pets", child: Text("pets"),),
      DropdownMenuItem(value: "no pets",child: Text("no pets"),)];
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(flex: 2,child: Container(
            child: Text("Pets :",style: TextStyle(
              fontSize: 20,
            ),),
          )),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButton(
                value: selectedPetsOption,
                items: petsoptions, onChanged: (dynamic value) { setState(() {
                selectedPetsOption=value;
              });},

              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget TypeFilter(){
    List<DropdownMenuItem> Typeoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "flat", child: Text("flat"),),
      DropdownMenuItem(value: "room",child: Text("room"),),
      DropdownMenuItem(value: "bed", child: Text("bed"),),];
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(flex: 2,child: Container(
            child: Text("Type :",style: TextStyle(
              fontSize: 20,
            ),),
          )),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButton(
                value: selectedTypeOption,
                items: Typeoptions, onChanged: (dynamic value) { setState(() {
                selectedTypeOption=value;
              });},

              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget AcceptGuestsFilter(){
    List<DropdownMenuItem> Guestsoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "accept guests", child: Text("accept guests"),),
      DropdownMenuItem(value: "don't accept guests",child: Text("don't accept guests"),)];
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(flex: 2,child: Container(
            child: Text("Guests :",style: TextStyle(
              fontSize: 20,
            ),),
          )),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButton(
                value: selectedGuestsOption,
                items: Guestsoptions, onChanged: (dynamic value) { setState(() {
                selectedGuestsOption=value;
              });},

              ),
            ),
          ),
        ],
      ),
    );
     /*
      Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Guests:"),
              RadioButton(
                description: "accept guests",
                value: "accept guests",
                groupValue: _acceptGuestsRadioButtonValue,
                onChanged: (value) => setState(
                      () => _acceptGuestsRadioButtonValue = value,
                ),
              ),
              RadioButton(
                description: "don't accept guests",
                value: "don't accept guests",
                groupValue: _acceptGuestsRadioButtonValue,
                onChanged: (value) => setState(
                      () => _acceptGuestsRadioButtonValue = value,
                ),
              ),
              RadioButton(
                description: "default",
                value: "default",
                groupValue: _acceptGuestsRadioButtonValue,
                onChanged: (value) => setState(
                      () => _acceptGuestsRadioButtonValue = value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
      */
  }
  Widget SmokingFilter(){
    List<DropdownMenuItem> smokingoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "smoking", child: Text("smoking"),),
      DropdownMenuItem(value: "no smoking",child: Text("no smoking"),)];
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(flex: 2,child: Container(
            child: Text("Smoking :",style: TextStyle(
              fontSize: 20,
            ),),
          )),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButton(
                value: selectedSmokingOption,
                items: smokingoptions, onChanged: (dynamic value) { setState(() {
                selectedSmokingOption=value;
              });},

              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget GenderFilter(){
    List<DropdownMenuItem> genderoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "male", child: Text("male"),),
      DropdownMenuItem(value: "female",child: Text("female"),)];
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(flex: 2,child: Container(
            child: Text("Gender :",style: TextStyle(
              fontSize: 20,
            ),),
          )),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButton(
                value: selectedGenderOption,
                items: genderoptions, onChanged: (dynamic value) { setState(() {
                selectedGenderOption=value;
              });},

              ),
            ),
          ),
        ],
      ),
    );
  }
    Widget FilterContainer(){
      return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text("Select your request Price range",style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black54,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RangeSlider(
              values: _currentRangeValues,
              min:0,
              max: 100000,
              divisions: 50,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: SpecifiedAddressField(),
          ),
          TypeFilter(),
          PetsFilter(),
          AcceptGuestsFilter(),
          SmokingFilter(),
          GenderFilter(),

        ],
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text(widget.selected_region)),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: FilterContainer(),
          ),
        ),
      ),
      body:  FutureBuilder(
          future: FirebaseFirestore.instance.collection("all_posts").where("address",isEqualTo:widget.selected_region).get(),
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData){
              final List<DocumentSnapshot> documents = snapshot.data.docs;
              return ListView(
                  children: documents.map((doc) =>PostTemplate(
                    user_Id: doc['user_Id'],
                      character: doc['character'],
                      address: doc['address'],
                      sub_address: doc['sub_address'],
                      avatar: doc['avatar'],
                      description: doc['description'],
                      gender: doc['gender'],
                      guests : doc['guests'],
                      pets : doc['pets'],
                      phone : doc['phone'],
                      price : doc['price'],
                      smoke : doc['smoking'],
                      time : doc['time'],
                      type : doc['type'],
                      username: doc['username'],
                      images: doc['image'],
                      availability: doc['availability'].toString(),
                      userId:doc['user_Id']
                  )).toList()
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
            // return ListView.builder(
            //   itemCount:snapshot.data.toString().length,
            //   itemBuilder: (context, index) {
            //     if(snapshot.hasData){
            //       return PostTemplate(index: index,
            //           character: snapshot.data[index].character,
            //           address: snapshot.data[index].address,
            //           sub_address: snapshot.data[index].sub_address,
            //           avatar: snapshot.data[index].avatar,
            //           description: snapshot.data[index].description,
            //           gender:snapshot.data[index].gender,
            //           guests : snapshot.data[index].guests,
            //           pets : snapshot.data[index].pets,
            //           phone : snapshot.data[index].phone,
            //           price : snapshot.data[index].price,
            //           smoke : snapshot.data[index].smoke ,
            //           time : snapshot.data[index].time ,
            //           type : snapshot.data[index].type ,
            //           username: snapshot.data[index].username ,
            //           //images: data['image'],
            //           availability: snapshot.data[index].availability.toString(),
            //           userId:snapshot.data[index].user_Id
            //       );
            //     }else{
            //       return CircularProgressIndicator();
            //     }
            //     // if(index==0){
            //     //   return Header();
            //     // }else if(index==1){
            //     //   return Search();
            //     // }else{
            //       /*
            //       if(snapshot.hasData){
            //                       return PostTemplate(index: index,
            //                           character: snapshot.data[index].character,
            //                           address: snapshot.data[index].address,
            //                           sub_address: snapshot.data[index].sub_address,
            //                           avatar: snapshot.data[index].avatar,
            //                           description: snapshot.data[index].description,
            //                           gender:snapshot.data[index].gender,
            //                           guests : snapshot.data[index].guests,
            //                           pets : snapshot.data[index].pets,
            //                           phone : snapshot.data[index].phone,
            //                           price : snapshot.data[index].price,
            //                           smoke : snapshot.data[index].smoke ,
            //                           time : snapshot.data[index].time ,
            //                           type : snapshot.data[index].type ,
            //                           username: snapshot.data[index].username ,
            //                           //images: data['image'],
            //                           availability: snapshot.data[index].availability.toString(),
            //                           userId:snapshot.data[index].user_Id
            //                       );
            //                     }else{
            //                       return CircularProgressIndicator();
            //                     }
            //        */
            //       // FirebaseFirestore.instance.collection("all_posts").doc("02:09:00 Fri 9 Jul").get().then((value) {
            //       //   print(value.data()['username']);
            //       //   print(value.data()['sub_address']);
            //       //
            //       // });
            //       return Container();
            //       // return PostTemplate(
            //       //     character: postsList[0].character,
            //       //     address: postsList[0].address ,
            //       //     sub_address:postsList[0].sub_address ,
            //       //     avatar: postsList[0].avatar ,
            //       //     description: postsList[0].description ,
            //       //     gender:  postsList[0].gender ,
            //       //     guests : postsList[0].guests ,
            //       //     pets : postsList[0].pets ,
            //       //     phone : postsList[0].phone ,
            //       //     price : postsList[0].price ,
            //       //     smoke : postsList[0].smoking ,
            //       //     time : postsList[0].time ,
            //       //     type : postsList[0].type,
            //       //     username: postsList[0].username ,
            //       //     //images: data['image'],
            //       //     availability: postsList[0].availability.toString(),
            //       //     //userId:postsList[0].user_Id
            //       // );
            //
            //
            //
            //
            //
            //
            //       // if(!snapshot.hasData){
            //       //   Map<String, dynamic> data = snapshot.data.data() as Map<String, dynamic>;
            //       //   return PostTemplate(index: index,
            //       //       character: data['character'],
            //       //       address: data['address'],
            //       //       sub_address: data['sub_address'],
            //       //       avatar: data['avatar'],
            //       //       description: data['description'],
            //       //       gender: data['gender'],
            //       //       guests : data['guests'],
            //       //       pets : data['pets'],
            //       //       phone : data['phone'],
            //       //       price : data['price'],
            //       //       smoke : data['smoke'],
            //       //       time : data['time'],
            //       //       type : data['type'],
            //       //       username: data['username'],
            //       //       //images: data['image'],
            //       //       availability: data['availability'].toString(),
            //       //       userId:data['user_Id']
            //       //   );
            //       // }else{
            //       //   return CircularProgressIndicator();
            //       // }
            //       // return PostTemplate("images/user_avatar.png","Minna Tareq");
            //     }
            //
            //
            // );
          }
      )
    );
  }
}
