import 'dart:collection';

import 'package:cityofcars/Screens/bottomnavBar.dart';

import 'package:cityofcars/Utils/constants.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/myhomepage.dart';
import 'Screens/selectBrand.dart';
import 'Services/models/receivedNotification.dart';
import 'Utils/functions.dart';
import 'Utils/preference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'cityofcars', // id
    'cityofcars',
    description: "User Notification Channel", // name
    importance: Importance.max,
    enableLights:true,
    playSound: true,
    enableVibration: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
   if(message.notification !=null){
      Map<String, dynamic> map = HashMap();
      print(map.toString());
       map["title"] = message.notification!.title;
       map["body"] = message.notification!.body;
      createListMap(map);
   }
  // If `onMessage` is triggered with a notification, construct our own
  // local notification to show to users using the created channel.
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'cityofcars',
          'cityofcars',
          channelDescription: 'User Notification Channel',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          enableLights: true,
          enableVibration: true,
          playSound: true,
        );
        const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
          10,
          message.notification!.title,
          message.notification!.body,
          platformChannelSpecifics,
          payload: message.data.toString(),
        );
  // if (notification != null && android != null) {
  //   flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           icon: android.smallIcon,
  //           // other properties...
  //         ),
  //       ));
  // }
  print('A bg message just showed up :  ${message.messageId}');
}
final BehaviorSubject<String?> selectNotificationSubject =
BehaviorSubject<String?>();
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
BehaviorSubject<ReceivedNotification>();
String? selectedNotificationPayload;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
          int id,
          String? title,
          String? body,
          String? payload,
          ) async {
        didReceiveLocalNotificationSubject.add(
          ReceivedNotification(
            id: id,
            title: title,
            body: body,
            payload: payload,
          ),
        );
      });

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          debugPrint('notification payload: $payload');
         // navigatorKey.currentState!.pushNamed("/notification");

        }
        selectedNotificationPayload = payload;
        selectNotificationSubject.add(payload);

      });



  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await CountryCodes.init();
  Prefernece.pref = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var prefs = Prefernece.pref;
  // get korangecolor => null;
  String id = "";
  String cardetails = "";
  String tokenId="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token();
  
    ////Forground notification
    FirebaseMessaging.onMessage.listen((message)async {
      print("here");
      print("message "+message.notification!.title.toString()+"^^");
   if(message.notification !=null){
      Map<String, dynamic> map = HashMap();
      print(map.toString());
      map["title"] = message.notification!.title;
      map["body"] = message.notification!.body;
      
      createListMap(map);
   }
  // If `onMessage` is triggered with a notification, construct our own
  // local notification to show to users using the created channel.
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'cityofcars',
          'cityofcars',
          channelDescription: 'User Notification Channel',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          enableLights: true,
          enableVibration: true,
          playSound: true,
        );
        const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
          10,
          message.notification!.title,
          message.notification!.body,
          platformChannelSpecifics,
          payload: message.data.toString(),
        );
  // if (notification != null && android != null) {
  //   flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           icon: android.smallIcon,
  //           // other properties...
  //         ),
  //       ));
  // }
      if (message.notification != null) {
        print(message.notification!.body);
      }
    });
    //Routing on tap notification 
    // when app is in background 
    FirebaseMessaging.onMessageOpenedApp.listen((message) async{
      RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  // If `onMessage` is triggered with a notification, construct our own
  // local notification to show to users using the created channel.
  if(message.notification !=null){
      Map<String, dynamic> map = HashMap();
      print(map.toString());
      map["title"] = message.notification!.title;
      map["body"] = message.notification!.body;
      
      createListMap(map);
   }
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'cityofcars',
          'cityofcars',
          channelDescription: 'User Notification Channel',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          enableLights: true,
          enableVibration: true,
          playSound: true,
        );
        const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
          10,
          message.notification!.title,
          message.notification!.body,
          platformChannelSpecifics,
          payload: message.data.toString(),
        );
  // if (notification != null && android != null) {
  //   flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           icon: android.smallIcon,
  //           // other properties...
  //         ),
  //       ));
  // }
     });
    id = prefs!.getString("userId").toString();

    cardetails = prefs!.getString("usercar").toString();
    Ids.userid = id;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Shots()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'City of Cars',
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: korangecolor,
              ),
        ),
        home: id == "" || id == "null"
            ? const MyHomePage()
            : BottomNavBar(index: 0),
      ),
    );
  }
    token() {
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("token: " + value.toString());
      tokenId = value.toString();
      Prefernece.pref!.setString("fcmtoken",tokenId);

      print("new token: " + Prefernece.pref!.getString("fcmtoken").toString());

    });
  }

   

}
