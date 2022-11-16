import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/text_edit.dart';

class last extends StatefulWidget {
  int index;
  String name;
  List<String> temp;
  last(this.index, this.name, this.temp);

  @override
  State<last> createState() => _lastState();
}

class _lastState extends State<last> {
  PageController pageController=PageController();

  void initstate(){
    super.initState();
    pageController=PageController(initialPage: widget.index);
  }

  String myemoji=" 😊 😇 🥰 ✌ 👍 👎😝 😜 🤪";

  TextAlign t=TextAlign.center;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.name}"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value){
                  setState((){
                    widget.index=value;
                  });
                },
                itemCount: widget.temp.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFD1C4E9),Color(0xFFD1C4E9)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(21),
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: t,
                      "${myemoji}\n${widget.temp[widget.index]}\n${myemoji}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3A3838),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              )),
          Spacer(
            flex: 1,
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: LinearGradient(
                colors: [Color(0xffD9AFD9),Color(0xFF64B5F6)],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            height: double.infinity,
            margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: () {
                          Clipboard.setData(ClipboardData(text:"${widget.temp[widget.index]}"));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied Text. . .")));

                        }, icon: Icon(Icons.copy)),
                        IconButton(onPressed: () {

                          if(widget.index>0)
                            {
                              widget.index--;
                            }
                          setState(() {});

                        }, icon: Icon(Icons.keyboard_double_arrow_left)),
                              IconButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return text_edit(widget.index,widget.temp);
                                },));
                              }, icon: Icon(Icons.edit)),
                                  IconButton(onPressed: () {

                                    if(widget.index < widget.temp.length-1)
                                      {
                                        widget.index++;
                                      }
                                    setState((){});
                                  }, icon: Icon(Icons.keyboard_double_arrow_right)),
                        IconButton(onPressed: () {

                          Share.share("${myemoji}\n${widget.temp[widget.index]}\n${myemoji}");
                        }, icon: Icon(Icons.share)),
                      ],
                    ),
                  )),
                ],
         ),
      );
  }

}
