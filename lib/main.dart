import 'dart:collection';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Screens/editProfile.dart';
import 'package:cityofcars/Screens/splash.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/messages.dart';
import 'Screens/notification.dart';
import 'Services/models/receivedNotification.dart';
import 'Utils/database.dart';

import 'Utils/functions.dart';
import 'Utils/preference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// This is for testing purpose only
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications',
    description: "This channel is used for important notifications.", // name
    importance: Importance.max,
    enableLights: true,
    playSound: true,
    enableVibration: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("===background");
  await Firebase.initializeApp();
  if (message.notification != null) {
    print("notification notification" + message.notification!.title.toString());
  }
  if (message.notification != null) {
    Map<String, dynamic> map = HashMap();
    print(map.toString());
    map["title"] = message.notification!.title;
    map["body"] = message.notification!.body;
    if (message.data.isNotEmpty) {
      if (message.data.containsKey("type")) {
        map["type"] = message.data["type"];
      }
    }
    await NotesDatabase.instance.create(Note(
        isImportant: false,
        number: map["type"] ?? "",
        title: map["title"],
        description: map["body"],
        createdTime: DateTime.now()));
    createListMap(map);
  }
  // if (message.notification != null) {
  //   Map<String, dynamic> map = HashMap();
  //   print(map.toString());
  //   map["title"] = message.notification!.title;
  //   map["body"] = message.notification!.body;
  //   if (message.data.isNotEmpty) {
  //     if (message.data.containsKey("type")) {
  //       map["type"] = message.data["type"];
  //     }
  //   }
  //   print("notification data" + message.data.toString());

  //   createListMap(map);
  // }
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
    icon: "@mipmap/ic_launcher",
    enableLights: true,
    enableVibration: true,
    playSound: true,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
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
  Prefernece.pref = await SharedPreferences.getInstance();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
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

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
  String tokenId = "";
  Future<void> _requestPermissions() async {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    Map<Permission, PermissionStatus> statuses =
        await [Permission.notification].request();
  }

  void _configureDidReceiveLocalNotificationSubject() {
    print("_configureDidReceiveLocalNotificationSubject");
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      print("listion ios state");
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                print("Clicked true ios");
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Notifications(),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() async {
    print("_configureSelectNotificationSubject");

    selectNotificationSubject.stream.listen((String? payload) async {
      print("chacking payload" + payload.toString());
      if (payload != null) {
        if (payload != "") {
          var listdata = await breakPayload(payload);
          var type = "";
          var review_id = "";
          var reply_id = "";
          listdata.forEach((element) {
            if (element.contains("type")) {
              int i = element.indexOf(":") + 2;
              print("Type " + element.substring(i) + "^^");
              type = element.substring(i).toString();
            }

            if (element.contains("businessreview_id")) {
              int i = element.indexOf(":") + 2;
              print("businessreview_id " + element.substring(i) + "^^");
              review_id = element.substring(i).toString();
            }

            if (element.contains("reply_id")) {
              int i = element.indexOf(":") + 2;
              print("reply_id " + element.substring(i) + "^^");
              reply_id = element.substring(i).toString();
            }
          });

          switch (type.toLowerCase()) {
            case "editprofile":
              print("editprofile");
              navigatorKey.currentState!.pushNamed("/editprofile");
              break;
            // case "pendingcart":

            //   break;
            // case "offer":

            //   break;
            case "conversation":
              navigatorKey.currentState!.pushNamed("/message");

              break;
            case "approvel":
              navigatorKey.currentState!.pushNamed("/orderassign");
              break;
            case "presets":
              navigatorKey.currentState!.pushNamed("/orderassign");
              break;
            // case "feedback":

            //   break;
            // case "otp":
            // Navigator.push(context, MaterialPageRoute(builder: ((context) => Messages())));

            //   break;
            case "orderupdate":
              navigatorKey.currentState!.pushNamed("/orderupdate");

              break;
            case "order":
              navigatorKey.currentState!.pushNamed("/orderassign");

              break;
            case "blogs":
              navigatorKey.currentState!.pushNamed("/blog");

              break;
            case "":
              navigatorKey.currentState!.pushNamed("/notification");
              break;
          }
        } else {
          navigatorKey.currentState!.pushNamed("/notification");
        }
      } else {
        navigatorKey.currentState!.pushNamed("/notification");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token();
    requestPersmission();
    _requestPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();

    ////Forground notification
    FirebaseMessaging.onMessage.listen((message) async {
      print("here");
      print("message " + message.notification!.title.toString() + "^^");
      print("notification data" + message.data.toString());
      print("notification notification" + message.notification.toString());

      if (message.notification != null) {
        print("notification notification" +
            message.notification!.title.toString());
      }
      if (message.notification != null) {
        Map<String, dynamic> map = HashMap();
        print(map.toString());
        map["title"] = message.notification!.title;
        map["body"] = message.notification!.body;
        if (message.data.isNotEmpty) {
          if (message.data.containsKey("type")) {
            map["type"] = message.data["type"];
          }
        }
        // print("type =" + map["type"]);
        await NotesDatabase.instance.create(Note(
            isImportant: false,
            number: map["type"] ?? "",
            title: map["title"],
            description: map["body"],
            createdTime: DateTime.now()));
        createListMap(map);
      }
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'high_importance_channel', // id
        'High Importance Notifications',
        channelDescription: "This channel is used for important notifications.",
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        icon: "@mipmap/ic_launcher",
        enableLights: true,
        enableVibration: true,
        playSound: true,
      );
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        0,
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
      print("notification data" + message.data.toString());

      if (message.notification != null) {
        print(message.notification!.body);
      }
    });
    //Routing on tap notification
    // when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print("notification data" + message.data.toString());

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (message.notification != null) {
        if (message.data['type'] == 'editprofile') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditProfile()));
        }
        Map<String, dynamic> map = HashMap();

        print(map.toString());
        map["title"] = message.notification!.title;
        map["body"] = message.notification!.body;
        if (message.data.isNotEmpty) {
          if (message.data.containsKey("type")) {
            map["type"] = message.data["type"];
          }
        }
        await NotesDatabase.instance.create(Note(
            isImportant: false,
            number: map["type"] ?? "",
            title: map["title"],
            description: map["body"],
            createdTime: DateTime.now()));

        createListMap(map);
      }
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'high_importance_channel', // id
        'High Importance Notifications',
        channelDescription: "This channel is used for important notifications.",
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        icon: "@mipmap/ic_launcher",
        enableLights: true,
        enableVibration: true,
        playSound: true,
      );
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        0,
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'City of Cars',
        navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
          "/notification": (_) => const Notifications(),
          "/editprofile": (_) => const EditProfile(),
          "/home": (_) => BottomNavBar(index: 0),
          "/blog": (_) => BottomNavBar(index: 1),
          "/orderassign": (_) => BottomNavBar(index: 2),
          "/support": (_) => const Messages(),
        },
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: korangecolor,
              ),
        ),
        home: const Splash()
        // const Glance(),
        // OrderDetails()
        //  id == "" || id == "null"
        //     ? const MyHomePage()
        //     : BottomNavBar(index: 0),

        );
  }

  token() {
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("token: " + value.toString());
      tokenId = value.toString();
      Prefernece.pref!.setString("fcmtoken", tokenId);

      print("new token: " + Prefernece.pref!.getString("fcmtoken").toString());
    });
  }
}

Future<List<String>> breakPayload(String? _payload) async {
  String a = _payload!.replaceAll("{", "");
  String b = a.replaceAll("}", "");
  print("B is" + b.toString());
  List<String> listdata = b.split(",");
  print(listdata.length);
  print(listdata.toString());

  return listdata;
}
