import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roommates/APIServices/shared_service.dart';

class AdAddMapScreen extends StatefulWidget {
  @override
  _AdAddMapScreenState createState() => _AdAddMapScreenState();
}

class _AdAddMapScreenState extends State<AdAddMapScreen> {
  Marker _marker;
  Marker _homeMarker;
  // var addresses;
  var homeMarkerIcon;

  String addr1="",addr2="";
  double target_latitude=0,tareget_longtude=0;
  static var _initialCameraPosition =
  CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);
  GoogleMapController _googleMapController;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
  double userLocation_latitude =0;
  double userLocation_longtude =0;
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
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(title: "current Location"));
    return _initialCameraPosition;
  }

  getAddressLocation()async{
    final geoPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates =Coordinates(geoPosition.latitude,geoPosition.longitude);
    var addresses =  await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      addr1 = addresses.first.featureName;
      addr2 = addresses.first.addressLine;
    });
  }

  getMarkLocation(double lat,double lon)async{
    //final geoPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates =Coordinates(lat,lon);
    var addresses =  await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      addr1 = addresses.first.featureName;
      addr2 = addresses.first.addressLine;
      target_latitude=lat;
      tareget_longtude=lon;
      print("address is "+addr2);
      print("cordnts is : "+target_latitude.toString()+" , "+tareget_longtude.toString());
    });
  }
  var toolbarHeight=60.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();

    //getAddressLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Bdran Google Maps",style: TextStyle(color: Colors.black),),
        actions: [

          if(_marker!=null)
            IconButton(
              tooltip: "Remove marker",
              icon: Icon(Icons.location_off_outlined,color: Colors.red,),
              onPressed: (){
                _marker=null;
                addr2="";
              },

            ),
          if(_marker!=null)
            IconButton(
              tooltip: "Save address",
              icon: Icon(Icons.save,color: Colors.black38,),
              onPressed: (){
                // AddAd(subAddressGeneratedFromMap: addr2,subAddressLatitude: target_latitude,subAddressLongtude: tareget_longtude);
                //     Navigator.of(context).restorablePush((context, arguments) =>  AddAd(subAddressGeneratedFromMap: addr2,subAddressLatitude: target_latitude,subAddressLongtude: tareget_longtude);)
                //SharedService.setMapDetails(addr2, target_latitude, tareget_longtude);
                Navigator.pop(context);
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
                    onLongPress: _addMarker,
                    mapType: MapType.hybrid,
                    onTap: _addMarker,
                    markers: {
                       if(_homeMarker!=null)_homeMarker,
                       if(_marker!=null)_marker
                    },
                    initialCameraPosition:CameraPosition(target: LatLng(12.342,12.233)),
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
                      child: Center(child: Text(addr2,style: TextStyle(
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //
      //   foregroundColor: Colors.black,
      //   onPressed: ()=>_googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(userLocation_latitude,userLocation_longtude),zoom:18.5,tilt: 50.0))),
      //   child: Icon(Icons.center_focus_strong),
      // ),




      /*appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Google Maps",style: TextStyle(color: Colors.black),),
          actions: [
            if(_marker !=null)
              TextButton(onPressed: (){
                _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: _marker.position,
                            zoom: 14.5,
                            tilt: 50.0
                        )
                    )
                );
                final coordinates = new Coordinates(1.10, 45.50);
                addresses = Geocoder.local.findAddressesFromCoordinates(coordinates);
                var first = addresses.first;
                print("${first.featureName} : ${first.addressLine}");
            },
                child: Text("ORIGIN"),style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600)
    ),)
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.hybrid,
                markers: {
                  if(_marker!=null)_marker,
                },
                onLongPress: _addMarker,
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (controller)=> _googleMapController=controller,
              )
              // Positioned(
              //   top: 30.0,
              //     right: 15,
              //     left: 15.0,
              //     child:Container(
              //       height: 50.0,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10.0),
              //         color: Colors.white,
              //       ),
              //       child: TextField(
              //         decoration: InputDecoration(
              //           hintText: "Enter Address",
              //           border: InputBorder.none,
              //           contentPadding: EdgeInsets.only(left: 15.0,top: 15.0),
              //           suffixIcon: IconButton(
              //             icon: Icon(Icons.search),
              //             iconSize: 30.0, onPressed: () {  },
              //           ),
              //         ),
              //         // onChanged: (val){
              //         //   setState(() {
              //         //     searchAddr=val;
              //         //   });
              //         // },
              //       ),
              //     ),
              // ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: ()=>_googleMapController.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: Icon(Icons.center_focus_strong),
      ),*/
    );
  }


  void _addMarker(LatLng pos) {
    if(_marker==null){
      //Origin is not set OR origin & destination are both set
      //set Origin

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
      addr2="";
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
}
