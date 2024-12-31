import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void requestMessagingPermission() async{
    FirebaseMessaging messaging=FirebaseMessaging.instance;
    NotificationSettings settings=await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      carPlay: false,
      criticalAlert: false,
      announcement: false,
    );
    if(settings.authorizationStatus==AuthorizationStatus.authorized)
      {
        print('Permission granted');
      }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("title${message.notification?.title}"
          " body${message.notification?.body}");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestMessagingPermission();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('flutter notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to My App!'),
          ],
        ),
      ),
    );
  }
}
