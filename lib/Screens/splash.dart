import 'dart:async';
import 'dart:math';

import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';

import 'bottomnavBar.dart';
import 'myhomepage.dart';

// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   String id = "";
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//     id = Prefernece.pref!.getString("userId").toString();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushAndRemoveUntil<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => id == "" || id == "null"
//               ? const MyHomePage()
//               : BottomNavBar(
//                   index: 0,
//                 ),
//         ),
//         (route) => false, //if you want to disable back feature set to false
//       );
//       //  id == "" || id == "null"
//       //     ? const MyHomePage()
//       //     : BottomNavBar(index: 0),
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         // decoration: const BoxDecoration(
//         //     image: DecorationImage(
//         //   image: AssetImage("assets/images/Splash.png"),
//         //   fit: BoxFit.cover,
//         // )),
//         child: Stack(
//           children: [
//             Positioned(
//               top: MediaQuery.of(context).size.height*0.25,
//               right: 0,
//               left: 0,
//               child: Image.asset(
//                 "assets/images/COClogo.png",
//                 height: MediaQuery.of(context).size.height*0.2,
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height*0.7,
//               right: 0,
//               left: 0,
//               child: Image.asset(
//                 "assets/images/COClogoname.png",
//                 height: MediaQuery.of(context).size.height*0.1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  String id = "";
  late Animation<double> slideanimation;
  late AnimationController slidecontroller;
  late Animation<double> scaleanimation;
  late AnimationController scalecontroller;
  late AnimationController _controller;
  bool start = false;
  bool end = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    slidecontroller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    slideanimation =
        Tween<double>(begin: 1.0, end: 1.0).animate(slidecontroller);
    slidecontroller.forward();
    scalecontroller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    scaleanimation =
        Tween<double>(begin: 0.7, end: 1.0).animate(scalecontroller);

    Future.delayed(const Duration(milliseconds: 1100), () {
      // scalecontroller.forward();
      start = true;
      setState(() {});
    });
    if (Prefernece.pref?.getString("userId") != null) {
      id = Prefernece.pref!.getString("userId").toString();
      Ids.userid = id;
      print(id + "    +++++");
    }
    Future.delayed(const Duration(seconds: 3), () {
       Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => id == "" || id == "null"
              ? const MyHomePage()
              : BottomNavBar(
                  index: 0,
                ),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
      //  id == "" || id == "null"
      //     ? const MyHomePage()
      //     : BottomNavBar(index: 0),
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.stop();
    return Container(
      color: kredcolor,
      width: double.infinity,
      height: double.infinity,
      child: SlideTransition(
        position:
            Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                .animate(slideanimation),
        child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // decoration: const BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage("assets/images/Splash.png"),
            //   fit: BoxFit.cover,
            // )),
            child: Stack(
              children: [
                 AnimatedPositioned(
                      duration: const Duration(seconds: 1),
                      top: start
                          ? MediaQuery.of(context).size.height * 0.25
                          : MediaQuery.of(context).size.height * 0.35,
                      right: 0,
                      left: 0,
                      child: ScaleTransition(
                        scale: scaleanimation,
                        child: Image.asset(
                          "assets/images/COClogo.png",
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                      ),
                    ),
                // AnimatedPositioned(
                //   duration: const Duration(seconds: 1),
                //   onEnd: (){
                //     setState(() {
                      
                //     });
                //   },
                //   top:end? MediaQuery.of(context).size.height * 0.45:MediaQuery.of(context).size.height * 0.5,
                //   right: 0,
                //   left: 0,
                //   child: AnimatedBuilder(
                //       animation: _controller,
                //       child: Image.asset(
                //             "assets/images/COClogo.png",
                //             height: MediaQuery.of(context).size.height * 0.2,
                //           ),
                //       builder: (context, child) {
                //         return Transform.rotate(
                //           angle: _controller.value * 2 * pi,
                //           child: child
                //         );
                //       }),
                // ),
                //  AnimatedPositioned(
                //   duration: const Duration(seconds: 1),
                //   top: end
                //       ? MediaQuery.of(context).size.height * 0.35
                //       : MediaQuery.of(context).size.height * 0.3,
                //   right: 0,
                //   left: 0,
                //   child: ScaleTransition(
                //     scale: scaleanimation,
                //     child: Image.asset(
                //       "assets/images/COClogoname.png",
                //       height: MediaQuery.of(context).size.height * 0.1,
                //     ),
                //   ),
                // ),
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  top: start
                      ? MediaQuery.of(context).size.height * 0.7
                      : MediaQuery.of(context).size.height * 0.8,
                  right: 0,
                  left: 0,
                  child: ScaleTransition(
                    scale: scaleanimation,
                    child: Image.asset(
                      "assets/images/COClogoname.png",
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
