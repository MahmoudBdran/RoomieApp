import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

//import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:roommates/APIServices/shared_service.dart';
import 'package:roommates/AddAdPackage/add_image.dart';
import 'package:roommates/HomePackage/HomePage.dart';
import 'package:roommates/Maps_package/adAdd_Map_screen.dart';
import 'package:roommates/theme/colors.dart';
import 'package:path/path.dart' as Path;
class AddAd extends StatefulWidget {

  @override
  _AddAdState createState() => _AddAdState();
}
enum SingingCharacter { Separated_persons, family }
class _AddAdState extends State<AddAd> {
  String character="separated_persons";
  SingingCharacter _character = SingingCharacter.Separated_persons;


  //Add ad functions and variables
  RangeValues _currentRangeValues = const RangeValues(0, 10000);
  final _formKey = GlobalKey<FormState>();
  String SelectedRegion="Alexandria";
  //var photos_selected=9;
  String desc="",add="",phone="",price="",type="",pets="",guests="",smoking="",gender="";
  String selectedTypeOption="flat";
  String selectedGuestsOption="accept guests";
  String selectedSmokingOption="smoking";
  String selectedGenderOption="male";
  String selectedPetsOption="pets";
  Widget regionWidget(){
    List<DropdownMenuItem> regionList=[
      DropdownMenuItem(value: "Alexandria", child: Text("Alexandria"),),
      DropdownMenuItem(value: "Aswan",child: Text("Aswan"),),
      DropdownMenuItem(value: "Asyut", child: Text("Asyut"),),
      DropdownMenuItem(value: "Beheira",child: Text("Beheira"),),
      DropdownMenuItem(value: "Beni suef", child: Text("Beni suef"),),
      DropdownMenuItem(value: "Cairo",child: Text("Cairo"),),
      DropdownMenuItem(value: "Dakahlia", child: Text("Dakahlia"),),
      DropdownMenuItem(value: "Demietta",child: Text("Demietta"),),
      DropdownMenuItem(value: "Faiyum", child: Text("Faiyum"),),
      DropdownMenuItem(value: "Gharbia",child: Text("Gharbia"),),
      DropdownMenuItem(value: "Giza", child: Text("Giza"),),
      DropdownMenuItem(value: "Ismaillia",child: Text("Ismaillia"),),
      DropdownMenuItem(value: "Kafr El Sheikh", child: Text("Kafr El Sheikh"),),
      DropdownMenuItem(value: "Luxor",child: Text("Luxor"),),
      DropdownMenuItem(value: "Matrouh", child: Text("Matrouh"),),
      DropdownMenuItem(value: "Minya",child: Text("Minya"),),
      DropdownMenuItem(value: "Monufia", child: Text("Monufia"),),
      DropdownMenuItem(value: "New Valley",child: Text("New Valley"),),
      DropdownMenuItem(value: "North Sinai", child: Text("North Sinai"),),
      DropdownMenuItem(value: "Port Said",child: Text("Port Said"),),
      DropdownMenuItem(value: "Qalyubia", child: Text("Qalyubia"),),
      DropdownMenuItem(value: "Qena",child: Text("Qena"),),
      DropdownMenuItem(value: "Red Sea", child: Text("Red Sea"),),
      DropdownMenuItem(value: "Sharqia",child: Text("Sharqia"),),
      DropdownMenuItem(value: "Sohag",child: Text("Sohag"),),
      DropdownMenuItem(value: "South Sinai", child: Text("South Sinai"),),
      DropdownMenuItem(value: "Suez",child: Text("Suez"),),];
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Text("Address :",style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey[500],
              ),),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0,0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: DropdownButton(
                value: SelectedRegion,
                items: regionList, onChanged: (value) { setState(() {
                SelectedRegion=value;
              });},

              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget typeWidget(){
    List<DropdownMenuItem> Typeoptions=[
      DropdownMenuItem(value: "flat", child: Text("flat"),),
      DropdownMenuItem(value: "room",child: Text("room"),),
      DropdownMenuItem(value: "bed", child: Text("bed"),),];
    return Visibility(
      visible: (character=="family")?false:true,
      child: Container(
        width: MediaQuery.of(context).size.width,

        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Type :",style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[500],
                ),),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0,0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: DropdownButton(
                  value: selectedTypeOption,
                  items: Typeoptions, onChanged: (value) { setState(() {
                  selectedTypeOption=value;
                });},

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget petsWidget(){
    List<DropdownMenuItem> petsoptions=[DropdownMenuItem(value: "pets", child: Text("pets"),),
      DropdownMenuItem(value: "no pets",child: Text("no pets"),)];
    return Visibility(
      visible: (character=="family")?false:true,
      child: Container(
        width: MediaQuery.of(context).size.width,

        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Pets :",style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),),
              ),
            ),

            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0,0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: DropdownButton(
                  value: selectedPetsOption,
                  items: petsoptions, onChanged: (value) { setState(() {
                  selectedPetsOption=value;
                });},

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget acceptGuestsWidget(){
    List<DropdownMenuItem> Guestsoptions=[DropdownMenuItem(value: "accept guests", child: Text("accept guests"),),
      DropdownMenuItem(value: "don't accept guests",child: Text("don't accept guests"),)];
    return Visibility(
      visible: (character=="family")?false:true,
      child: Container(
        width: MediaQuery.of(context).size.width,

        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Guests :",style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[500],
                ),),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0,0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButton(

                  value: selectedGuestsOption,
                  items: Guestsoptions, onChanged: (value) { setState(() {
                  selectedGuestsOption=value;
                });},

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget smokingWdiget(){
    List<DropdownMenuItem> smokingoptions=[DropdownMenuItem(value: "smoking", child: Text("smoking"),),
      DropdownMenuItem(value: "no smoking",child: Text("no smoking"),)];
    return Visibility(
      visible: (character=="family")?false:true,
      child: Container(
        width: MediaQuery.of(context).size.width,

        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Smoking :",style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[500],
                ),),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0,0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButton(
                  value: selectedSmokingOption,
                  items: smokingoptions, onChanged: (value) { setState(() {
                  selectedSmokingOption=value;
                });},

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget genderWidget(){
    List<DropdownMenuItem> genderoptions=[DropdownMenuItem(value: "male", child: Text("male"),),
      DropdownMenuItem(value: "female",child: Text("female"),)];
    return Visibility(
      visible: (character=="family")?false:true,
      child: Container(
        width: MediaQuery.of(context).size.width,

        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Gender :",style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[500],
                ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0,0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButton(
                  value: selectedGenderOption,
                  items: genderoptions, onChanged: (value) { setState(() {
                  selectedGenderOption=value;
                });},

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget adSubmitButton(){
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
      decoration: BoxDecoration(
          color: applicationColor,
          borderRadius: BorderRadius.circular(8)
      ),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        child: Text("Done",style: GoogleFonts.actor(
          fontSize: 18,
          color: Colors.white,
        ),),
        onPressed: (){
          sendPost(
            guests: selectedGuestsOption,
            address: SelectedRegion,
            character: character,
            desc: desc,
            gender: selectedGenderOption,
            pets: selectedPetsOption,
            phone: phone,
            price: price,
            smoking: selectedSmokingOption,
            sub_address: subaddress,
            type: selectedTypeOption
          );
          sendPostToPublic(guests: selectedGuestsOption,
              address: SelectedRegion,
              character: character,
              desc: desc,
              gender: selectedGenderOption,
              pets: selectedPetsOption,
              phone: phone,
              price: price,
              smoking: selectedSmokingOption,
              sub_address: subaddress,
              type: selectedTypeOption);

          print(
            '''data is :
                   $desc,
                   $SelectedRegion,
                   $subaddress,
                   $phone,
                   $price,
                   $character,
                   $selectedTypeOption,
                   $selectedPetsOption,
                   $selectedSmokingOption,
                   $selectedGuestsOption,
                   $selectedGenderOption'''
        );

          if (_formKey.currentState.validate()) {

          }
        },
      ),
    );
  }

  //switch between map and add ad page variables
  bool _isMap=false;
  bool _isAddAd=true;

  //map functions and variables
  double userLocation_latitude =0;
  double userLocation_longtude =0;
  String subaddress="";
  double target_latitude=0,tareget_longtude=0;
  var mapAddress;
  var mapAddressLatitude;
  var mapAddressLongtude;
  Marker _marker;
  Marker _homeMarker;
  var homeMarkerIcon;
  static var _initialCameraPosition =
  CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);
  GoogleMapController _googleMapController;
  Future<CameraPosition> getCurrentLocation()async{
    final geoPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      userLocation_latitude=geoPosition.latitude;
      userLocation_longtude=geoPosition.longitude;
      _initialCameraPosition =
          CameraPosition(target: LatLng(userLocation_latitude,userLocation_longtude), zoom: 15.5);
    });
    _homeMarker = Marker(markerId: MarkerId("home"),
        position: _initialCameraPosition.target,
        icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(title: "current Location"));
    return _initialCameraPosition;
  }
  getMarkLocation(double lat,double lon)async{
    final coordinates =Coordinates(lat,lon);
    var addresses =  await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      subaddress = addresses.first.addressLine;
      target_latitude=lat;
      tareget_longtude=lon;
      print("address is "+subaddress);
      print("cordnts is : "+target_latitude.toString()+" , "+tareget_longtude.toString());
    });
  }
  void _addMarker(LatLng pos) {
    if(_marker==null){
      setState(() {
        _marker=Marker(markerId: MarkerId('address'),
          draggable: true,
          onDragEnd: (value) => getMarkLocation(value.latitude, value.longitude),
          position: pos,
        );
        getMarkLocation(pos.latitude,pos.longitude);
      }
      );
    }else{
      _marker=null;
      subaddress="";
      setState(() {
        _marker=Marker(markerId: MarkerId('address'),
          draggable: true,
          onDragEnd: (value) => getMarkLocation(value.latitude, value.longitude),
          position: pos,
        );
        getMarkLocation(pos.latitude,pos.longitude);

      }
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getMapData();
    getCurrentLocation();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _googleMapController.dispose();
    super.dispose();

  }
  final postImagePicker= ImagePicker();
  FirebaseAuth auth = FirebaseAuth.instance;
  String imagePostLink;
  String formattedDate = DateFormat('kk:mm:ss EEE d MMM').format(DateTime.now());
  CollectionReference postCol= FirebaseFirestore.instance.collection("posts");

  Future<void>sendPostToPublic(
      {
        String desc,
        String address,
        String sub_address,
        String phone,
        String price,
        String character,
        String type,
        String pets,
        String guests,
        String smoking,
        String gender
      })async{
    List urls=[];
    FirebaseFirestore.instance
      .collection('posts').doc(auth.currentUser.uid).collection("posts")
      .get()
      .then((QuerySnapshot querySnapshot) {
    int postId = 0;
    postId = querySnapshot.docs.length + 1;
    FirebaseFirestore.instance.collection('all_posts').doc(formattedDate).set({

      "postId": postId,
      "user_Id": auth.currentUser.uid,
      "image": urls,
      "description": desc,
      "address": SelectedRegion,
      "sub_address":sub_address,
      "phone": phone,
      "price": price,
      "character": character,
      "type": type,
      "pets": pets,
      "guests": guests,
      "smoking": smoking,
      "gender": gender,
      "time": formattedDate,
      "availability": true
    }).then((_) {
      for (var img in _image) {
        firebase_storage.FirebaseStorage.instance
            .ref()
            .child('posts/${auth.currentUser.uid}/${postId.toString()}/${Path
            .basename(img.path)}').putFile(img).then((value) {
          value.ref.getDownloadURL().then((val) {
            urls.insert(0, val);
            FirebaseFirestore.instance.collection('all_posts').doc(formattedDate).update({
              "image": urls
            }).then((_){
              FirebaseFirestore.instance.collection("users").doc(auth.currentUser.uid).get().then((value){
                FirebaseFirestore.instance.collection('all_posts').doc(formattedDate).update(
                    {
                      "avatar":value.data()['profile_image'],
                      "username":value.data()['username'],
                    }).then((_) => Navigator.pop(context));
              });
            });
          });
        });
      }
    });
  });

  }
  Future<void>sendPost({String desc, String address, String sub_address,
        String phone, String price, String character,
        String type, String pets, String guests,
        String smoking, String gender})async{
    List urls=[];
    int postId=0;
    await FirebaseFirestore.instance
        .collection('posts').doc(auth.currentUser.uid).collection("posts")
        .get()
        .then((QuerySnapshot querySnapshot) {
            postId=querySnapshot.docs.length+1;
            postCol.doc(auth.currentUser.uid).collection("posts").doc(postId.toString()).set({
              "postId": postId, "image":urls, "description":desc,
              "address":SelectedRegion, "sub_address":sub_address, "phone":phone,
              "price":price, "character":character, "type":type,
              "pets":pets, "guests":guests, "smoking":smoking,
              "gender":gender, "time":formattedDate, "availability":true
            }).then((_) {
                for (var img in _image) {
                   firebase_storage.FirebaseStorage.instance
                      .ref()
                      .child('posts/${auth.currentUser.uid}/${postId.toString()}/${Path.basename(img.path)}').putFile(img).then((value) {
                     value.ref.getDownloadURL().then((val) {
                        urls.insert(0, val);
                       postCol.doc(auth.currentUser.uid).collection("posts").doc(postId.toString()).update({
                         "image":urls
                       }).then((_){
                         FirebaseFirestore.instance.collection("users").doc(auth.currentUser.uid).get().then((value){
                           postCol.doc(auth.currentUser.uid).collection("posts").doc(postId.toString()).update(
                               {
                                 "avatar":value.data()['profile_image'],
                                 "username":value.data()['username'],
                               });
                         });
                       });
                     });
                   } );
                }


    });



      });
  }
    var _scaffoldKey= GlobalKey<ScaffoldState>();
  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile.path));
    });
    if (pickedFile.path == null) retrieveLostData();
  }
  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file.path));
      });
    } else {
      print(response.file);
    }
  }
  List<File> _image = [];
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return _isAddAd?
    Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
        backgroundColor: applicationColor,
        automaticallyImplyLeading: false,
        title: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  top: 0,
                  left: 2,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(
                        EvaIcons.arrowIosBack
                    ),
                    color: Colors.white,
                  )
              ),
              Container(alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,child: Text("Add ad"))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //add photo button
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40
                            ,decoration: BoxDecoration(
                            color: applicationColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                            child: FlatButton(
                              onPressed: () {
                                _scaffoldKey.currentState.showBottomSheet((context) {
                                  return Scaffold(
                                      appBar: AppBar(
                                        actions: [
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Done',
                                                style: TextStyle(color: Colors.white),
                                              ))
                                        ],
                                      ),
                                      body: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            child: GridView.builder(
                                                itemCount: _image.length + 1,
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3),
                                                itemBuilder: (context, index) {
                                                  return index == 0
                                                      ? Center(
                                                    child: IconButton(
                                                        icon: Icon(Icons.add),
                                                        onPressed: () =>chooseImage()),
                                                  )
                                                      : Container(
                                                    margin: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(_image[index - 1]),
                                                            fit: BoxFit.cover)),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ));
                                });
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) => AddImage()));
                              },
                              child: Text("Add photo",style:TextStyle(
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Spacer(flex:1),
                          // Text("$photos_selected photos selected.",style: TextStyle(
                          //   color: Colors.blueAccent,
                          // ),)
                        ],
                      ),
                    ),
                    //photos added
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _image.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [

                              Image.file(_image[index],width: 150,height: 150,),
                              SizedBox(width: 20,)
                            ],
                          );
                        },
                      ),
                    ),
                    //ad description
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Description",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              maxLines: 10,
                              initialValue: desc,
                              onChanged: (val){
                                desc=val;
                              },
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'please fill this field';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true))
                        ],
                      ),
                    ),
                    //address drop down
                    regionWidget(),
                    //specific address in selected region
                    Container(
                      width:MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Specific address",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              Expanded(
                                  flex: 10,
                                  child: Stack(
                                    children: [
                                      TextFormField(
                                          enabled: false
                                          ,validator: (val) {
                                        if (val.isEmpty) {
                                          return 'please fill this field';
                                        } else {
                                          return null;
                                        }
                                      },
                                          decoration: InputDecoration(
                                            // prefixIcon: Icon(
                                            //   Icons.location_on,
                                            //   color: Colors.teal,
                                            // ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide.none,
                                              ),
                                              fillColor: Color(0xfff3f3f4),
                                              filled: true)
                                      ),
                                      Text(subaddress!=null?subaddress:""),
                                    ],
                                  )
                                // TextFormField(
                                //     validator: (val) {
                                //       if (val.isEmpty) {
                                //         return 'please fill this field';
                                //       } else {
                                //         return null;
                                //       }
                                //     },
                                //     decoration: InputDecoration(
                                //         prefixIcon: Icon(
                                //           Icons.location_on,
                                //           color: Colors.teal,
                                //         ),
                                //         border: OutlineInputBorder(
                                //           borderRadius: BorderRadius.circular(10),
                                //           borderSide: BorderSide.none,
                                //         ),
                                //         fillColor: Color(0xfff3f3f4),
                                //         filled: true)
                                // ),
                              ),
                              Expanded(flex:1,child: SizedBox()),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: applicationColor,
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    child: IconButton(
                                        icon: Icon(Icons.pin_drop_outlined,color: Colors.white,), onPressed: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => AdAddMapScreen(),));
                                      setState(() {
                                        _isAddAd=false;
                                        _isMap=true;
                                      });
                                    }),
                                  ))
                            ],
                          ),

                        ],
                      ),
                    ),
                    //phone
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Phone",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              initialValue: phone,
                              onChanged: (val){
                                phone=val;
                              },
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'please fill this field';
                                } else if (val.contains('-') ||
                                    val.contains(' ') ||
                                    val.contains(',') ||
                                    val.contains('.') ||
                                    val.length!=11) {
                                  return 'enter valid phone number';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone_iphone,
                                    color: applicationColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true))
                        ],
                      ),
                    ),
                    //price
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Price",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              onChanged: (val){
                                price=val;
                              },
                              initialValue: price,
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'please fill this field';
                                } else if (val.contains('-') ||
                                    val.contains(' ') ||
                                    val.contains(',') ||
                                    val.contains('.')) {
                                  return 'enter valid price';
                                } else if (int.parse(val)>100000) {
                                  return 'enter price between 1 and 100,000';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.money_outlined,
                                    color: applicationColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true))
                        ],
                      ),
                    ),
                    //ad product type
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,15,0,0),
                          child: Text("NOTE: Choose type of these 2 types to continue",style: TextStyle(
                              color: Colors.grey
                          ),),
                        ),
                        ListTile(
                          title: const Text('Separated persons'),
                          leading: Radio(
                            value: "separated_persons",
                            groupValue: character,
                            onChanged: ( value) {
                              setState(() {
                                character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Family'),
                          leading: Radio(
                            value: "family",
                            groupValue: character,
                            onChanged: (value) {
                              setState(() {
                                character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    typeWidget(),
                    petsWidget(),
                    acceptGuestsWidget(),
                    smokingWdiget(),
                    genderWidget(),
                    Divider(),
                    adSubmitButton(),

                    // Text('Error: $_error'),
                    // buildGridView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ):
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Google Maps",style: TextStyle(color: Colors.black),),
        actions: [

          if(_marker!=null)
            IconButton(
              tooltip: "Remove marker",
              icon: Icon(Icons.location_off_outlined,color: Colors.red,),
              onPressed: (){
                _marker=null;
                subaddress="";
              },

            ),
          if(_marker!=null)
            IconButton(
              tooltip: "Save address",
              icon: Icon(Icons.save,color: Colors.black38,),
              onPressed: (){
                setState(() {
                  _isMap=false;
                  _isAddAd=true;
                });
              },
            )
        ],
      ),
      body: FutureBuilder(
        future: getCurrentLocation(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return SafeArea(
              child: Stack(
                children: [
                  GoogleMap(
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: true,
                    mapType: MapType.hybrid,
                    onLongPress: _addMarker,
                    onTap: _addMarker,
                    markers: {
                      if(_homeMarker!=null)_homeMarker,
                      if(_marker!=null)_marker
                    },
                    initialCameraPosition: snapshot.data,
                    onMapCreated: (controller)=> _googleMapController=controller,
                  ),
                  Positioned(
                    top: 30.0,
                    right: 15,
                    left: 15.0,
                    child:Container(

                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 7, // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Center(child: Text(subaddress,style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),)),
                    ),
                  ),
                  Positioned(
                      left: 15,
                      bottom: 15,
                      child: FloatingActionButton(
                        tooltip: "Get your location",
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        onPressed: ()=>_googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(userLocation_latitude,userLocation_longtude),zoom:18.5,tilt: 50.0))),
                        child: Icon(Icons.center_focus_strong),
                      ))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}