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
import 'package:cityofcars/Screens/selectBrand.dart';
import 'package:cityofcars/Screens/selectCity.dart';
import 'package:cityofcars/Screens/sos.dart';
import 'package:cityofcars/Screens/terms.dart';
import 'package:cityofcars/Screens/tracking.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cityofcars/Screens/notification.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/myhomepage.dart';
import 'Utils/preference.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   id = prefs!.getString("userId").toString();
  
   print(id+"=======");
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  Shots()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'City of Cars',
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: korangecolor,
              ),
        ),
        home: id==""||id=="null" ? const MyHomePage() :const SelectCity(),
      ),
    );
  }
}
