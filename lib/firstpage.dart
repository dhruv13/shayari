import 'package:flutter/material.dart';
import 'package:shayari/names.dart';
import 'package:shayari/page2.dart';

class first extends StatefulWidget {

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  List<String> image = [
    "myphoto/love.jpg",
    "myphoto/sad.png",
    "myphoto/sorry.jpg",
    "myphoto/hurt.jpg",
    "myphoto/nafrat.jpg",
    "myphoto/funny.png",
    "myphoto/good.jpg",
    "myphoto/yaad.png",
    "myphoto/birthday.png",
    "myphoto/twoline.webp"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shayari"), centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          margin: EdgeInsets.all(15),
          shadowColor: Color(0xFF8E81BD),
          child: ListTile(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return page2(index, names().name, image);
            },));
          },
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                  image: DecorationImage(
                      image: AssetImage(image[index]), fit: BoxFit.fill)),
            ),
            title: Text(names().name[index]),
          ),
        );
        // },itemBuilder: (context, index){
        // return ListTile(
        //   leading: Text("${index+1}"),
        //   title: Text(names[index]),
        //   subtitle: Text(contact[index]),
        //   trailing: Text(status[index]),
        // );
      },
          itemCount: names().name.length),
    );
  }
}
