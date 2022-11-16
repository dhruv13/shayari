import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shayari/second.dart';

import 'names.dart';



class page2 extends StatefulWidget {

    int index;
    List<String> name;
    List<String> image;

   page2( this.index,this.name, this.image);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {

  List<String> temp=[];

  @override
  void initState(){
    super.initState();

    switch(widget.index){
      case 0:
        temp=names().love;
        break;

      case 1:
        temp=names().sad;
        break;

      case 2:
        temp=names().sorry;
        break;

      case 3:
        temp=names().hurt;
        break;

      case 4:
        temp=names().nafrat;
        break;

      case 5:
        temp=names().funny;
        break;

      case 6:
        temp=names().goodnight;
        break;

      case 7:
        temp=names().yaad;
        break;

      case 8:
        temp=names().birthday;
        break;

      case 9:
        temp=names().two;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("${widget.name[widget.index]}"),
    centerTitle: true,
    ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          margin: EdgeInsets.all(10),
          shadowColor: Colors.deepPurple,
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(widget.image[widget.index]),
                  fit: BoxFit.contain,
                )),
            ),
            trailing: IconButton(onPressed: (){
              Clipboard.setData(ClipboardData(text: "${temp[index]}"));
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied Text. . .")));
            },icon: Icon(Icons.arrow_forward_sharp)),
            title: Text("${temp[index].toString().substring(0,temp[index].length~/2)}",maxLines: 1,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return last(index,widget.name[widget.index],temp);
              },));
            },
          ));
      },
        itemCount: temp.length,
      ),
    );
  }

}
