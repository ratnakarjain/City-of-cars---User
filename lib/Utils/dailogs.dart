import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';

Future showDeleteDialog(
    BuildContext context, String title, Function()? onPressed) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Container(
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: FloatingActionButton(
                        backgroundColor: kwhitecolor,
                        foregroundColor: kblackcolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "No",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FloatingActionButton(
                        backgroundColor: kredcolor,
                        foregroundColor: kwhitecolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        onPressed: onPressed,
                        child: const Text(
                          "Yes",
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
