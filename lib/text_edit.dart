import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/names.dart';

class text_edit extends StatefulWidget {
  int index;
  List<String> temp;
  text_edit(this.index,this.temp);

  @override
  State<text_edit> createState() => _text_editState();
}

class _text_editState extends State<text_edit> {

  int colortype = 1;
   Color bgcolor=Color(0xFFD1C4E9);
   Color bgcolor2=Color(0xFFD1C4E9);
   Color Textcolor=Color(0xFF323538);
   String myemoji=" 😊 😇 🥰 ✌ 👍 👎😝 😜 🤪";
   TextAlign t=TextAlign.center;

   Color pickerColor=Color(0xff443a49);
   Color currentColor=Color(0xff443a49);
   double textsize = 20;

  List<Color> currentgradient = [
    Color(0xff8EC5FC),
    Color(0xffE0C3FC),
  ];
  String fontlist1 = "";
  GlobalKey _globalKey = GlobalKey();

   void changeColor(Color color){
     setState(() => pickerColor=color);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCAE2DE),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        shadowColor: Colors.blueGrey,
        elevation: 10,
        title: Text("${widget.index+1} / ${widget.temp.length}",
              style: TextStyle(fontSize: 25,color: Colors.white),
        )),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      RepaintBoundary(
                        key: _globalKey,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: colortype == 1 ? bgcolor : null,
                            gradient: colortype == 2 ? LinearGradient(colors: currentgradient) : null,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(20),
                          height: 250,
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: t,
                            "${myemoji}\n${widget.temp[widget.index]}\n${myemoji}",
                            style: TextStyle(
                              fontSize: textsize,
                              color: Textcolor,
                              fontFamily: fontlist1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Container(
              height: 130,
              child: Expanded(
                // flex: 5,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    // color: Colors.redAccent,
                    gradient: LinearGradient(
                      colors: [Color(0xFF64B5F6),Color(0xffD9AFD9)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                    IconButton(
                                        onPressed: () {
                                          t=TextAlign.center;
                                          setState((){});
                                        },
                                        icon: Icon(
                                          Icons.format_align_center_rounded,
                                          size: 30,
                                          color: Colors.black,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          t=TextAlign.justify;
                                          setState((){});
                                        },
                                        icon: Icon(
                                          Icons.format_align_justify_rounded,
                                          size: 30,
                                          color: Colors.black,
                                        )),

                                IconButton(
                                    onPressed: () {

                                      colortype = 1;
                                      int R = names.r.nextInt(names.color.length);
                                      bgcolor = names.color[R];
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.wifi_protected_setup_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    )),

                                    IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height: 200,
                                                child: GridView.builder(
                                                  itemCount: names.rang.length,
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 5,
                                                      crossAxisSpacing: 5,
                                                      childAspectRatio: 3),
                                                  itemBuilder: (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        colortype = 2;
                                                        currentgradient = names.rang[index];
                                                        setState(() {});

                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            gradient:
                                                            LinearGradient(colors: names.rang[index])),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );

                                      setState((){});
                                    }, icon: Icon(
                                      Icons.zoom_out_map_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    )),

                                    IconButton(
                                        onPressed: () {
                                          t=TextAlign.left;
                                          setState((){});
                                        },
                                        icon: Icon(
                                          Icons.format_align_left_rounded,
                                          size: 30,
                                          color: Colors.black,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          t=TextAlign.right;
                                          setState((){});
                                        },
                                        icon: Icon(
                                          Icons.format_align_right_rounded,
                                          size: 30,
                                          color: Colors.black,
                                        )),
                              ],
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(15),
                            height: 50,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  color: Color(0xFF586167),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffCAE2DE),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                fixedSize: Size(110,50),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Color(0xFF9894A8),
                                    isScrollControlled: true,
                                    isDismissible: false,
                                    barrierColor: Colors.transparent,
                                    builder: (context) {
                                      return Container(
                                        height: 600,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: AlertDialog(
                                                title: const Text('Choose Your Color!'),
                                                content: SingleChildScrollView(
                                                  child: ColorPicker(
                                                    pickerColor: pickerColor,
                                                    onColorChanged:
                                                    changeColor,
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    child:
                                                    const Text('Got it'),
                                                    onPressed: () {
                                                      bgcolor = pickerColor;
                                                      setState(() =>
                                                      currentColor = pickerColor);
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    context: context);
                              },
                              child: Text(
                                "Backgound",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),

                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffCAE2DE),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                fixedSize: Size(110,50),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Color(0xFF9894A8),
                                    isScrollControlled: true,
                                    isDismissible: false,
                                    barrierColor: Colors.transparent,
                                    builder: (context) {
                                      return Container(
                                        height: 600,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: AlertDialog(
                                                title: const Text('Choose Your Color!'),
                                                content: SingleChildScrollView(
                                                  child: ColorPicker(
                                                    pickerColor: pickerColor,
                                                    onColorChanged: changeColor,
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    child: const Text('Got it'),
                                                    onPressed: () {
                                                      Textcolor = pickerColor;
                                                      setState(() => currentColor = pickerColor);
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    context: context);
                              },
                              child: Text(
                                "Text Color",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),

                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurpleAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                fixedSize: Size(110,50),
                              ),
                              onPressed: () {
                                Share.share("${myemoji}\n${widget.temp[widget.index]}\n${myemoji}");
                              },
                              child: Text("Share", style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               primary: Color(0xffCAE2DE),
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(5.0)),
                               fixedSize: Size(110,50),
                             ),
                             onPressed: () {

                               showModalBottomSheet(
                                   context: context,
                                   builder: (context) {
                                 return Container(
                                   height: 110,
                                   color: Theme.of(context).backgroundColor,
                                   child: ListView.builder(
                                     scrollDirection: Axis.horizontal,
                                     itemCount: names.fontlist.length,
                                     itemBuilder: (context, index) {
                                       return InkWell(
                                           onTap: () {
                                             setState(() {
                                               fontlist1 = names.fontlist[index];
                                             });
                                           },
                                           child: Padding(
                                             padding: const EdgeInsets.only(
                                                 left: 20, top: 30, right: 20),
                                             child: Text(
                                               "Shayri Text",
                                               style: TextStyle(
                                                   fontSize: 30,
                                                   fontFamily: names.fontlist[index]),
                                             ),
                                           ));
                                     },
                                   ),
                                 );
                               },
                               );
                             },
                             child: Text("Font", style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,),
                             )),

                         ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               shadowColor: Color(0xffCAE2DE),
                               primary: Color(0xffCAE2DE),
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(5.0)),
                               fixedSize: Size(110,50),
                             ),
                             onPressed: () {
                               showModalBottomSheet(
                                   backgroundColor: Color(0xFF9894A8),
                                   isDismissible: false,
                                   barrierColor: Colors.transparent,
                                   builder: (context) {
                                     return Container(
                                       height: 120,
                                       child: Row(
                                         children: [
                                           Expanded(
                                             child: GridView.builder(
                                                 scrollDirection:
                                                 Axis.vertical,
                                                 itemCount:
                                                 names.myemoji.length,
                                                 itemBuilder:
                                                     (context, index) {
                                                   return InkWell(
                                                     onTap: () {
                                                       setState(() {
                                                         myemoji = names.myemoji[index];
                                                       });
                                                     },
                                                     child: Container(
                                                       height: 20,
                                                       child: Text(
                                                           textAlign:TextAlign.center, "${names.myemoji[index]}\n"),
                                                       margin: EdgeInsets.all(10),color: Color(0xffd2d9d6), alignment: Alignment.center,
                                                     ),
                                                   );
                                                 },
                                                 gridDelegate:
                                                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5)),
                                           ),
                                           Row(
                                             children: [
                                               Container(
                                                 height: 50,
                                                 width: 50,
                                                 child: IconButton(
                                                     onPressed: () {
                                                       return Navigator.pop(context);
                                                     },
                                                     icon: Icon(Icons.close_rounded)),
                                               )
                                             ],
                                           )
                                         ],
                                       ),
                                     );
                                   },
                                   context: context);
                             },
                             child: Text(
                               "Emoji", style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,
                               ),
                             )),

                         ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               primary: Color(0xffCAE2DE),
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(5)),
                               fixedSize: Size(110,50),
                             ),
                             onPressed: () {


                               showModalBottomSheet(
                                   elevation: 10,
                                   backgroundColor: Color(0xffCAE2DE),
                                   builder: (context) {
                                     return Container(
                                         height: 90,
                                         child: StatefulBuilder(
                                           builder: (context, setState1) {
                                             return Slider(
                                               inactiveColor: Color(0xFF9894A8),
                                               activeColor: Color(0xff706e77),
                                               thumbColor: Color(0xFF8E81BD),
                                               min: 20,
                                               max: 70,
                                               onChanged: (value) {
                                                 print(value);
                                                 setState1(() {});

                                                 setState(() {
                                                   textsize = value;
                                                 });
                                               },
                                               value: textsize,
                                             );
                                           },
                                         ));
                                   },
                                   context: context);
                             },
                             child: Text(
                               "Text Size",
                               style: TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold, // light
                               ),
                             )),
                       ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
