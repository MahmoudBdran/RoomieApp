import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ImagesContainerTemplate extends StatelessWidget {
  final List<String>imageList;
  ImagesContainerTemplate({@required this.imageList});
  @override
  Widget build(BuildContext context) {
    if (imageList.length == 1) {
      return Container(
        height: 310,
        width: double.infinity,
        child: Image.network(imageList[0], fit: BoxFit.cover,
          height: 300,
          width: double.infinity,),
      );
    } else if (imageList.length == 2) {
      return Container(
        height: 300,
        width: double.infinity,
        child: Container(
          height: 300,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,2,0),
                  child: Image.network(imageList[0], fit: BoxFit.cover,
                    height: 300,),
                ),
              ),
              Expanded(
                child: Image.network(imageList[1], fit: BoxFit.cover,
                  height: 300,),
              )
            ],
          ),
        ),
      );
    } else if (imageList.length == 3) {
      return Container(
        height: 310,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 150,
              width:MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,2,0),
                      child: Image.network(imageList[0], fit: BoxFit.cover,
                        height: 150,
                        ),
                    ),
                  ),
                  Expanded(
                    child: Image.network(imageList[1], fit: BoxFit.cover,
                      height: 150,
                      ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,2,2,0),
              child: Image.network(imageList[2], fit: BoxFit.cover,
                height: 150,
                width: double.infinity,),
            )
          ],
        ),
      );
    }
    else if (imageList.length == 4) {
      return Container(
        height: 310,
        width: double.infinity,
        child: Column(
          children: [

            Image.network(imageList[0], fit: BoxFit.cover,
              height: 150,
              width: double.infinity,),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,2,2,0),
                    child: Image.network(imageList[1], fit: BoxFit.cover,
                      height: 150,
                      width: MediaQuery.of(context).size.width / 3.2,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,2,2,0),
                    child: Image.network(imageList[2], fit: BoxFit.cover,
                      height: 150,
                      width: MediaQuery.of(context).size.width / 3.2,),
                  ),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Image.network(imageList[3], fit: BoxFit.cover,
                      height: 150,
                      width:MediaQuery.of(context).size.width/ 3.2,),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
    else {
      return Container(
        height: 310,
        width: double.infinity,
        child: Column(
          children: [

            Image.network(imageList[0], fit: BoxFit.cover,
              height: 150,
              width: double.infinity,),
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,2,2,0),
                    child: Image.network(imageList[1], fit: BoxFit.cover,
                      height: 150,
                      width: MediaQuery.of(context).size.width / 3.2,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,2,2,0),
                    child: Image.network(imageList[2], fit: BoxFit.cover,
                      height: 150,
                      width: MediaQuery.of(context).size.width / 3.2,),
                  ),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Stack(
                      children: [
                        Image.network(imageList[3], fit: BoxFit.cover,
                          height: 150,
                          width:MediaQuery.of(context).size.width/ 3.2,),
                        Container(height: 150,width:MediaQuery.of(context).size.width/ 3.2,color: Colors.black.withOpacity(0.5),alignment: Alignment.center,child: Text("+${imageList.length-4}",style: TextStyle(
                            color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                        ),),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}