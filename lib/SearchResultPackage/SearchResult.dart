import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:roommates/NewsFeedPackage/PostContainer.dart';

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
  // ignore: non_constant_identifier_names
  // Widget FilterContainer(){
  //   return ExpansionTile(title: Text("Click to add filter on your search"),
  //     trailing: Icon(Icons.keyboard_arrow_down),
  //     children: [
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
  //             child: Text("Select your request Price range",style: GoogleFonts.poppins(
  //               fontSize: 18,
  //               color: Colors.black54,
  //             ),),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: RangeSlider(
  //               values: _currentRangeValues,
  //               min:0,
  //               max: 10000,
  //               divisions: 50,
  //               labels: RangeLabels(
  //                 _currentRangeValues.start.round().toString(),
  //                 _currentRangeValues.end.round().toString(),
  //               ),
  //               onChanged: (RangeValues values) {
  //                 setState(() {
  //                   _currentRangeValues = values;
  //                 });
  //               },
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
  //             child: SpecifiedAddressField(),
  //           ),
  //           PetsRadioGroup(),
  //           AcceptGuestsRadioGroup(),
  //           SmokerRadioGroup(),
  //           GenderRadioGroup(),
  //         ],
  //       )
  //     ],
  //   );
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
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return PostTemplate("images/user_avatar.png", "Aya hany");

        },
      ),
    );
  }
}
