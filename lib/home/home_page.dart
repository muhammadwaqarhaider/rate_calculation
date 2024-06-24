import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:rate_caculation/home/calculation.dart';
import 'package:share/share.dart';

import 'percentage_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
  final tonnText = TextEditingController();
  final mandText = TextEditingController();
  final kgText = TextEditingController();
  final katText = TextEditingController();
  final perkatText = TextEditingController();
  void clearText() {
    rateText.clear();
    tonnText.clear();
    mandText.clear();
    kgText.clear();
    katText.clear();
    perkatText.clear();
  }
  //userraet
  String userrate="";
  //wheat
  String tonn="";
  String mand="";
  String kg="";
  //Kat
  String kat="";
  String perwheat="";
  //Given
  String totalwheat="";
  String totalkat="";
  String totalamount="";
  //Show eror
  String fillraet="";
  String fillWheat="";
  String fillperWheat="";
  String fillkat="";

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          //leading: Icon(Icons.menu),
          centerTitle: true,
          title: Text("Rate Calculation",style: TextStyle(fontWeight: FontWeight.bold),),
          elevation: 0,
          actions: [
            Padding(padding: EdgeInsets.all(10),
             child: IconButton(
              icon: Icon(Icons.share_outlined),
              onPressed: (){
                Share.share("Email:raowaqar2622@gmail.com\nContact No:03085287503",);
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
                  Get.to(Calculation());
                },
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Rate ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
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
                Row(
                  children: [
                    Text("Wheat",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(width: 10,),
                    Text(fillWheat,style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 165,
                      child: TextField(
                        controller: tonnText,
                        decoration: InputDecoration(
                          //hintText: "Add Name",
                            label: Text("Ton",style: TextStyle(color: Colors.black),),
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
                        onChanged: (val){tonn=val;},
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 165,
                      child: TextField(
                        controller: mandText,
                        decoration: InputDecoration(
                          //hintText: "Add Name",
                            label: Text("Man",style: TextStyle(color: Colors.black),),
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
                        onChanged: (val){mand=val;},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  width: 165,
                  child: TextField(
                    controller: kgText,
                    decoration: InputDecoration(
                      //hintText: "Add Name",
                        label: Text("Kg",style: TextStyle(color: Colors.black),),
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
                    onChanged: (val){kg=val;},
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Kat",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(width: 10,),
                    Text(fillkat,style: TextStyle(color: Colors.black)),
                    Spacer(),
                    Text(fillperWheat,style: TextStyle(color: Colors.black)),
                    SizedBox(width: 15,),

                  ],
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 165,
                      child: TextField(
                        controller: katText,
                        decoration: InputDecoration(
                          //hintText: "Add Name",
                            label: Text("Kat",style: TextStyle(color: Colors.black),),
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
                        onChanged: (val){kat=val;},
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 165,
                      child: TextField(
                        controller: perkatText,
                        decoration: InputDecoration(
                          //hintText: "Add Name",
                            label: Text("Per Wheat",style: TextStyle(color: Colors.black),),
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
                        onChanged: (val){perwheat=val;},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Total Wheat",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Spacer(),
                    Text("Total Kat",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(width: 80,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                        height: 40,
                        width: 165,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.8,color: Colors.black,style: BorderStyle.solid),
                        ),
                        child: Text(totalwheat,style: TextStyle(fontSize: 20),)),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                        height: 40,
                        width: 165,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.8,color: Colors.black,style: BorderStyle.solid),
                        ),
                        child: Text(totalkat,style: TextStyle(fontSize: 20),)),
                  ],
                ),
                SizedBox(height: 40,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: ()  {
                        setState(() {});
                        if(userrate==""){
                          fillraet="Please Enter Rate!";
                        }
                        else if(tonn=="" && mand=="" && kg==""){
                          fillraet="";
                          fillWheat="Please Enter Wheat!";
                        }else if(kat==""){
                          fillWheat="";
                          fillkat="Please Enter Kat!";

                        }else if(perwheat==""){
                          setState(() {});
                          fillperWheat="Please Inter PerWheat!";
                          fillkat="";
                        }else {
                          setState(() {});
                          fillraet="";
                          fillWheat="";
                          fillkat="";
                          fillperWheat="";

                          int itonn=int.tryParse(tonn)??0;
                          int imand=int.tryParse(mand)??0;
                          int ikg=int.tryParse(kg)??0;
                          double ikat=double.parse(kat);
                          int iperwheat=int.parse(perwheat);
                          int iuserraet=int.parse(userrate);

                          int convertonn=itonn*1000;
                          int convertmand=imand*40;
                          int convertkg=ikg;

                          int convertinkg=convertonn+convertmand+convertkg;
                          double result=convertinkg/iperwheat;
                          double per=result*ikat;
                          double perfct=convertinkg-per;
                          totalwheat="${(perfct/40).floor()} mn ${(perfct%40).toInt()} Kg";
                          totalkat="${(per/40).floor()} mn ${(per%40).toInt()} kg";

                          double kol=iuserraet/40*perfct;
                          totalamount=kol.round().toString();

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
                          tonnText.clear();
                          mandText.clear();
                          kgText.clear();
                          katText.clear();
                          perkatText.clear();
                          totalamount="";
                          totalwheat="";
                          totalkat="";
                          _message="";
                          fillraet="";
                          fillWheat="";
                          fillperWheat="";
                          fillkat="";
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
                SizedBox(height: 100,),
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
