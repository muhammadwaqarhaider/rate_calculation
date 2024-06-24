import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:rate_caculation/home/calculation.dart';
import 'package:rate_caculation/home/home_page.dart';
import 'package:share/share.dart';

import '../../../model/utils/styles.dart';

class Percentage extends StatefulWidget {
  const Percentage({Key? key}) : super(key: key);

  @override
  State<Percentage> createState() => _PercentageState();
}

class _PercentageState extends State<Percentage> {
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

  final total_ma = TextEditingController();
  final given_ma = TextEditingController();
  void clearText() {
    total_ma.clear();
    given_ma.clear();
  }

  String grade="";
  String fill="";
  String percentage="";
  String total_mark="";
  String given_mark="";

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Percentage App",style: TextStyle(fontWeight: FontWeight.bold),),
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
                title: Text('Rate Calculation App',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  Get.to(HomePage());
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

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: TextField(
                    controller: total_ma,
                    decoration: InputDecoration(
                      //hintText: "Add Name",
                      //prefixIcon: Icon(Icons.menu,color: Colors.black,),
                      label: Text("Total_Marks",style: TextStyle(color: Colors.black),),
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
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    onChanged: (val){total_mark=val;},
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 40,
                  child: TextField(
                    controller: given_ma,
                    decoration: InputDecoration(
                      //hintText: "Add Name",
                        //prefixIcon: Icon(Icons.menu,color: Colors.black,),
                        label: Text("Given_Marks",style: TextStyle(color: Colors.black),),
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
                    onChanged: (val){given_mark=val;},
                  ),
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Percentage",style: interMedium,),
                        SizedBox(height: 5,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            height: 40,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 0.8,color: Colors.black,style: BorderStyle.solid),
                            ),
                            child: Text(percentage,style: TextStyle(fontSize: 20),)),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Text("Grade",style: interMedium,),
                    //     SizedBox(height: 5,),
                    //     Container(
                    //         padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    //         height: 50,
                    //         width: 100,
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           border: Border.all(width: 0.8,color: Colors.black,style: BorderStyle.solid),
                    //         ),
                    //         child: Text(grade,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    //   ],
                    // ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(fill,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.black),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: (){
                        if(total_mark==""){
                          setState(() {
                            fill="Please inter Total_Marks!!";
                            percentage="";
                            grade="";
                          });
                        }else if(given_mark==""){
                          setState(() {
                            fill="Please inter given_Marks!!";
                            percentage="";
                            grade="";
                          });
                        }else {

                          var itotal_mark=int.parse(total_mark);
                          var igiven_mark=int.parse(given_mark);


                          var result=igiven_mark/itotal_mark*100;

                          percentage=result.toStringAsFixed(2);

                          if(result==100){
                            grade="Full";
                          }else if(result>=80){
                            grade="A+";
                          }else if(result>=70){
                            grade="A";
                          }else if(result>=60){
                            grade="C";
                          }else if(result>=40){
                            grade="D";
                          }else if(result>=33){
                            grade="E";
                          }else{
                            grade="Fail";
                          }
                          setState(() {});
                           fill="";
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // gradient: const LinearGradient(
                          //     begin:
                          //     Alignment.centerRight,
                          //     end: Alignment.centerLeft,
                          //     colors: [Colors.limeAccent,Colors.deepOrange]),
                          // borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(40),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(40)),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0.8,color: Colors.black,)
                        ),
                        child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                      ),
                    ),
                    SizedBox(width: 60,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          total_ma.clear();
                          given_ma.clear();
                          _message="";
                          grade="";
                          percentage="";
                          fill="";
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
                SizedBox(height: 250,),
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
