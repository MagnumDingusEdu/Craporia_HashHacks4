import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

var purpleColor = Color(0xff525bb2);

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }


}

/* class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
} */

var gunwant = "Fuck";

/*  @override

  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
*/
class _MyAppState extends State<MyApp> {
  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
    getMessage();
  }
  
  var mess = "";
  var link = "";
  var gunwant = "moron";

  void getMessage(){
   _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      //setState(() => _message = '$gunwant');
      setState(() => _message = message["notification"]["title"]);
      mess = _message;
      setState(() => _message = message["notification"]["body"]);
      link = _message;
      print(link);

    }, onResume: (Map<String, dynamic> message) async {

      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
      mess = _message;
      setState(() => _message = message["notification"]["body"]);
      link = _message;

    }, onLaunch: (Map<String, dynamic> message) async {

      print('on launch $message');

      setState(() => _message = message["notification"]["title"]);
      mess = _message;
      
    }
    
    );
    
    FlutterError.onError = null;
    _firebaseMessaging.getToken().then((token) => print("tokenkey" + token));
  }


//class MyHomePage extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
   return MaterialApp(
    home: Scaffold(
      backgroundColor: purpleColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: 
                  BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
                  color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/logo.png')
                    )
                  ]
                )
              )
            ),
          ),
          Expanded(
            flex: 12, 
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Image.network("$link")
                  ),
                  Container(
                    child: Text('$mess',
                      style: TextStyle(
                        fontFamily: 'Google',
                        color: Colors.white,
                        fontSize: 30,
                      )
                    )
                  )
                ],
              )
            ),
            
          )
        ],
      )
    ),
    debugShowCheckedModeBanner: false
   );
 }
}