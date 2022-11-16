import 'package:flutter/material.dart';
import 'package:shayari/firstpage.dart';
import 'package:shayari/splash.dart';

void main()
{
  runApp(MaterialApp(home: splash(),
    theme: ThemeData(
        primarySwatch: Colors.blueGrey),
  ),
  );
}

class shayari extends StatefulWidget {
  const shayari({Key? key}) : super(key: key);

  @override
  State<shayari> createState() => _shayariState();
}

class _shayariState extends State<shayari> {

   List<String> bhasa=["English", "Hindi", "Gujarati", "Mrathi", "Tamil",];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer (
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white),
              child: Text("Account",style: TextStyle(fontSize: 25,color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.home,
                color: Colors.black,
              ),
              title: Text("Home", style: TextStyle(color: Colors.black)),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return shayari();
                },));
              },
            ),
            ListTile(
              leading: Icon(Icons.download,
                color: Colors.black,
              ),
              title: Text("Download", style: TextStyle(color: Colors.black)),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.language,
                color: Colors.black,
              ),
              title: Text("Languages", style: TextStyle(color: Colors.black)),
              onTap: (){

              },
            ),

            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.black,
              ),
              title: Text("Setting", style: TextStyle(color: Colors.black)),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.help,
                color: Colors.black,
              ),
              title: Text("Help", style: TextStyle(color: Colors.black)),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.info,
                color: Colors.black,
              ),
              title: Text("About Us", style: TextStyle(color: Colors.black)),
              onTap: (){},
            ),
            // Divider(height: 2,color: Colors.white),
          ],
        ),
      ),
      appBar: AppBar(title: Text("Shayari"), centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          margin: EdgeInsets.all(15),
          shadowColor: Colors.orangeAccent,
          child: Container(
            margin: EdgeInsets.all(20),
                child: OutlinedButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return first();
                      },
                      ));
                    },
                    child: Text(bhasa[index],
                      style: TextStyle(fontSize: 30, color: Colors.redAccent, fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )),color: Colors.white54,
          ),
        );
      },itemCount: bhasa.length,),
    );
  }


}
