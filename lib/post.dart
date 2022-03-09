import 'package:MartGrace/category.dart';
import 'package:MartGrace/login.dart';
import 'package:MartGrace/main.dart';
import 'package:MartGrace/messages.dart';
import 'package:MartGrace/search.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:hive/hive.dart';

class PostAd extends StatefulWidget {
  PostAd({Key key}) : super(key: key);

  _PostAdState createState() => _PostAdState();
}

class _PostAdState extends State<PostAd> {
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

  int _currentindex = 2;
  bool typing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // IconButton(icon: Icon(Icons.search,color: Colors.white),),
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
        leading: IconButton(
          icon: Icon(typing ? Icons.done : Icons.search),
          onPressed: ()async {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return SearchE();

               }));
              
            },
          
        ),
        // actions: [
        //   IconButton(icon: Icon(Icons.arrow_forward_ios),),
        // ],
      ),
      body: IndexedStack(
        index: position,
        children: <Widget>[
          WebView(
            initialUrl: "https://www.martgrace.com/posts/create",
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

          if (_currentindex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Catego();
              }),
            );
          } else if (_currentindex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MyApp();
              }),
            );
          } else if (_currentindex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Mees();
              }),
            );
          }

          else if (_currentindex == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Loig();
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

class TextBox extends StatelessWidget {
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