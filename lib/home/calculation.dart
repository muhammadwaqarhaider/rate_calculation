import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

import 'package:share/share.dart';


class Calculation extends StatefulWidget {
  const Calculation({Key? key}) : super(key: key);

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {

  // This key is used for the RepaintBoundary widget
  final GlobalKey _key = GlobalKey();

  String _message = 'Press the button to take a screenshot';

  // This function will be triggered when the button is pressed
  void _takeScreenshot() async {
    RenderRepaintBoundary boundary =
    _key.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // Saving the screenshot to the gallery
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(pngBytes),
          quality: 90,
          name: 'screenshot-${DateTime.now()}.png');

      if (kDebugMode) {
        print(result);
      }
      setState(() {
        _message = 'screenshot successfully saved!';
      });
    }
  }
  final rateText = TextEditingController();
  final ghantyText = TextEditingController();
  final mintText = TextEditingController();
  void clearText() {
    rateText.clear();
    ghantyText.clear();
    mintText.clear();
  }

  String userrate="";
  //time
  String ghanty="";
  String mint="";
  // Given
  String totalamount="";
  //eror
  String fillraet="";
  String filltime="";
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Rate Calculation",style: TextStyle(fontWeight: FontWeight.bold),),
          elevation: 0,
          actions: [
            Padding(padding: EdgeInsets.all(10),
              child: IconButton(
                icon: Icon(Icons.share_outlined),
                onPressed: (){
                  Share.share('raowaqar2622@gmail.com');
                },
              ),
            )
          ],
        ),
        drawer:Drawer(
          width: 300,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const <Widget>[
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage("assets/images/rao.jpg"),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Muhammad Waqar',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'raowaqar2622@gmail.com',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.pageview,size: 30,),
                title: Text('Percentage App',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  Get.to(Percentage());
                },
              ),
              ListTile(
                leading: Icon(Icons.pageview,size: 30,),
                title: Text('Calculation App',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  Get.to(HomePage());
                },
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 40,
                //       width: 250,
                //       child: TextField(
                //         //controller: rateText,
                //         decoration: InputDecoration(
                //           //hintText: "Add Name",
                //             label: Text("Name",style: TextStyle(color: Colors.black),),
                //             border: OutlineInputBorder(
                //               // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                //                 borderRadius: BorderRadius.circular(10)
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                //               borderSide: BorderSide(color: Colors.black),
                //             ),
                //             focusedBorder: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(10),
                //                 // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                //                 borderSide: BorderSide(color: Colors.black)
                //             )
                //         ),
                //         keyboardType: TextInputType.name,
                //         cursorColor: Colors.black,
                //         onChanged: (val){userrate=val;},
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Rate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(width: 2,),
                    Text(fillraet,style: TextStyle(color: Colors.black),),
                    Spacer(),
                    Text("Total Amount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(width: 30,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 165,
                      child: TextField(
                        controller: rateText,
                        decoration: InputDecoration(
                          //hintText: "Add Name",
                            label: Text("Rate",style: TextStyle(color: Colors.black),),
                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                                borderSide: BorderSide(color: Colors.black)
                            )
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (val){userrate=val;},
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                        height: 40,
                        width: 165,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.8,color: Colors.black,style: BorderStyle.solid),
                        ),
                        child: Text(totalamount,style: TextStyle(fontSize: 20),)),

                  ],
                ),
                SizedBox(height: 10,),

                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Time",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(width: 2,),
                    Text(filltime,style: TextStyle(color: Colors.black),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 165,
                      child: TextField(
                        controller: ghantyText,
                        decoration: InputDecoration(
                          //hintText: "Add Name",
                            label: Text("Ghanty",style: TextStyle(color: Colors.black),),
                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                                borderSide: BorderSide(color: Colors.black)
                            )
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (val){ghanty=val;},
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 165,
                      child: TextField(
                        controller: mintText,
                        decoration: InputDecoration(
                          //hintText: "Add Name",
                            label: Text("Mint",style: TextStyle(color: Colors.black),),
                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                                borderSide: BorderSide(color: Colors.black)
                            )
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (val){mint=val;},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 350,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: ()  {
                        setState(() {});
                        if(userrate==""){
                          fillraet="Please Enter Rate!";
                        }
                        else if(ghanty=="" && mint==""){
                          fillraet="";
                          filltime="Please Enter Time!";
                        }else {
                          setState(() {});
                          fillraet="";
                          filltime="";

                          int ighanty=int.tryParse(ghanty)??0;
                          int imint=int.tryParse(mint)??0;
                          int iuserraet=int.parse(userrate);

                          int converghanty=ighanty*60;
                          //int convertmint=imint;

                          int convertintime=converghanty+imint;
                          var result=iuserraet/60;
                          var finelresult=result*convertintime;
                          totalamount=finelresult.floor().toString();
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          // gradient: const LinearGradient(
                          //     begin:
                          //     Alignment.centerRight,
                          //     end: Alignment.centerLeft,
                          //     colors: [Colors.limeAccent,Colors.deepOrange]),
                          // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                          borderRadius: BorderRadius.circular(10),
                          //border: Border.all(width: 0.8,color: Colors.black,)
                        ),
                        child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.white),),
                      ),
                    ),
                    SizedBox(width: 60,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          rateText.clear();
                          ghantyText.clear();
                          mintText.clear();
                          totalamount="";
                          _message="";
                          fillraet="";
                          filltime="";
                        });

                      },
                      child: Container(
                        //padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          height: 25,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(width: 0.8,color: Colors.red,style: BorderStyle.solid),
                          ),
                          child: Text("Clear",style: TextStyle(fontSize: 15,color: Colors.white),)),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: _takeScreenshot,
                    child: const Text('Take Screenshot')),
                const SizedBox(
                  height: 5,
                ),
                Text(_message),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
