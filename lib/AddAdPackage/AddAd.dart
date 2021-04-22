import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAd extends StatefulWidget {
  @override
  _AddAdState createState() => _AddAdState();
}

class _AddAdState extends State<AddAd> {
  RangeValues _currentRangeValues = const RangeValues(0, 10000);
final _formKey = GlobalKey<FormState>();
  String SelectedRegion="Alexandria";
  var photos_selected=9;
  String selectedTypeOption="flat";
  String selectedGuestsOption="default";
  String selectedSmokingOption="default";
  String selectedGenderOption="default";
  String selectedPetsOption="default";
  Widget RegionWidget(){
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
  Widget TypeWidget(){
    List<DropdownMenuItem> Typeoptions=[
      DropdownMenuItem(value: "flat", child: Text("flat"),),
      DropdownMenuItem(value: "room",child: Text("room"),),
      DropdownMenuItem(value: "bed", child: Text("bed"),),];
    return Container(
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
    );
  }
  Widget PetsWidget(){
    List<DropdownMenuItem> petsoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "pets", child: Text("pets"),),
      DropdownMenuItem(value: "no pets",child: Text("no pets"),)];
    return Container(
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
    );
  }
  Widget AcceptGuestsWidget(){
    List<DropdownMenuItem> Guestsoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "accept guests", child: Text("accept guests"),),
      DropdownMenuItem(value: "don't accept guests",child: Text("don't accept guests"),)];
    return Container(
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
  Widget SmokingWdiget(){
    List<DropdownMenuItem> smokingoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "smoking", child: Text("smoking"),),
      DropdownMenuItem(value: "no smoking",child: Text("no smoking"),)];
    return Container(
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
    );
  }
  Widget GenderWidget(){
    List<DropdownMenuItem> genderoptions=[DropdownMenuItem(value: "default", child: Text("default"),),
      DropdownMenuItem(value: "male", child: Text("male"),),
      DropdownMenuItem(value: "female",child: Text("female"),)];
    return Container(
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
              ),),
            ),
          ),Expanded(
            flex: 5,
            child: Container(
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
    );
  }
  Widget AdSubmitButton(){
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
      decoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.circular(8)
      ),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        child: Text("Done",style: GoogleFonts.actor(
          fontSize: 18,
          color: Colors.white,
        ),),
        onPressed: (){
          if (_formKey.currentState.validate()&& photos_selected>=1) {
            // If the form is valid, display a Snackbar.
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(5),
                          ),
                            child: FlatButton(
                              onPressed: () {  },
                              child: Text("Add photo",style:TextStyle(
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Spacer(flex:1),
                          Text("$photos_selected photos selected.",style: TextStyle(
                            color: Colors.blueAccent,
                          ),)
                        ],
                      ),
                    ),
                    //photos added
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [

                              Image.asset("images/post_image.png",width: 150,height: 150,),
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
                    RegionWidget(),
                    //specific address in selected region
                    Container(
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
                          TextFormField(
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'please fill this field';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    color: Colors.teal,
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
                                    color: Colors.teal,
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
                                    Icons.attach_money,
                                    color: Colors.teal,
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
                    TypeWidget(),
                    PetsWidget(),
                    AcceptGuestsWidget(),
                    SmokingWdiget(),
                    GenderWidget(),
                    Divider(),
                    AdSubmitButton(),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
