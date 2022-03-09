import 'package:MartGrace/category.dart';
import 'package:MartGrace/login.dart';
import 'package:MartGrace/messages.dart';
import 'package:MartGrace/post.dart';
import 'package:MartGrace/search.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:device_preview/device_preview.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final dir = await path.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox("sebox");

  runApp(MyApp());
// runApp(DevicePreview(
//     builder: (context) => MyApp(),
//   ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MartGrace',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'MartGrace'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  num position = 1;

  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  int _currentindex = 0;
  bool typing = false;
  var dd;
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: -10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(icon: Icon(Icons.search,color: Colors.white),),
            TB(),
            IconButton(icon: Icon(Icons.arrow_forward,color: Colors.white),
            onPressed: ()async {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return SearchE();

               }));
              
            },
            ),
          ],
        ),
        // leading: IconButton(
        //   icon: Icon(typing ? Icons.done : Icons.search),
        //   onPressed: () {
        //     setState(() {
        //       typing = !typing;
        //     });
        //   },
          
        // ),
        // actions: [
        //   IconButton(icon: Icon(Icons.arrow_forward_ios),),
        // ],
      ),
      body: IndexedStack(
        index: position,
        children: <Widget>[
          WebView(
            initialUrl: "https://www.martgrace.com",
            javascriptMode: JavascriptMode.unrestricted,
            key: key,
            onPageFinished: doneLoading,
            onPageStarted: startLoading,
          ),
          Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        // iconSize: 10,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "home",
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_sharp),
            title: Text(
              "Radio",
            ),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_rounded,
            ),
            title: Text(
              "More",
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            title: Text("Services"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            title: Text(
              "Contact",
            ),
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });

          if (_currentindex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return PostAd();
              }),
            );
          } else if (_currentindex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Catego();
              }),
            );
          } else if (_currentindex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return  Mees();
              }),
            );


            
          }

           else if (_currentindex == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return  Loig();
              }),
            );


            
          }
        },

        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

// class TextBox extends StatelessWidget {

//   final   keyword = TextEditingController();
//   final String mytext ;

//   TextBox(this.mytext);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(20),
//     color: Colors.white,
//     boxShadow: [
//       BoxShadow(color: Colors.green, spreadRadius: 3),
//     ],
//   ),
//       width: 260,
//       height: 40,
//       // padding: EdgeInsets.only(top:5),
      
//       child: TextField(
//          textAlign: TextAlign.left,
//          controller: keyword,
//          onChanged: (value) {
//            set
//          },
         
        
//         decoration:
        
        
//             InputDecoration(
              
//              border: new OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//            Radius.circular(20.0),
//         ),
//       ),
//              hintStyle: new TextStyle(color: Colors.grey[800]),
//              contentPadding: EdgeInsets.only(top:10,left:20),
//       hintText: "Search",
      
//       fillColor: Colors.white70),
//       ),
//     );
//   }
// }



class TB extends StatefulWidget {
  

   final   keyword = TextEditingController();
   String mytext ;

    

  @override
  _TBState createState() => _TBState();
}

class _TBState extends State<TB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    boxShadow: [
      BoxShadow(color: Colors.green, spreadRadius: 3),
    ],
  ),
      width: 260,
      height: 40,
      // padding: EdgeInsets.only(top:5),
      
      child: TextField(
         textAlign: TextAlign.left,
         controller: widget.keyword,
         onChanged: (value) {
           setState(() async{
             widget.mytext =widget.keyword.text;
              var box = Hive.box('sebox');

                box.put('searchword',widget.mytext );
           });
         },
         
        
        decoration:
        
        
            InputDecoration(
              
             border: new OutlineInputBorder(
        borderRadius: BorderRadius.all(
           Radius.circular(20.0),
        ),
      ),
             hintStyle: new TextStyle(color: Colors.grey[800]),
             contentPadding: EdgeInsets.only(top:10,left:20),
      hintText: "Search",
      
      fillColor: Colors.white70),
      ),
    );
  }
}
