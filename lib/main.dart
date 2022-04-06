import 'package:cityofcars/Screens/Service%20Main/insidCategory.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Screens/carHealth.dart';
import 'package:cityofcars/Screens/editProfile.dart';
import 'package:cityofcars/Screens/feedback.dart';
import 'package:cityofcars/Screens/jobCard.dart';
import 'package:cityofcars/Screens/messages.dart';
import 'package:cityofcars/Screens/news.dart';
import 'package:cityofcars/Screens/orderHistory.dart';
import 'package:cityofcars/Screens/profile.dart';
import 'package:cityofcars/Screens/sos.dart';
import 'package:cityofcars/Screens/terms.dart';
import 'package:cityofcars/Screens/tracking.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cityofcars/Screens/notification.dart';
import 'Screens/myhomepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get korangecolor => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City of Cars',
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: korangecolor,
            ),
      ),
      home: const OrderHistory(),
    );
  }
}
