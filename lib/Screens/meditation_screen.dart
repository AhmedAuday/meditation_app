import 'package:ahmed_meditation_app/Models/meditation_model.dart';
import 'package:ahmed_meditation_app/constatnts.dart';
import 'package:ahmed_meditation_app/widgets/custom_card.dart';
import 'package:ahmed_meditation_app/widgets/custom_willpop_scope.dart';
import 'package:flutter/material.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});
  static String id = "MeditationScreen";

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return CustomWillPopScope(
      title: const Text("Want to Exit"),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      onPressedNo: () {
        Navigator.of(context).pop(false);
      },
      child: Scaffold(
        backgroundColor: kYellow,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${kIMG}hh.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: ScreenSize.height! * .07),
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 25),
                  child: Text(
                    "Welcome Back!",
                    style: kHeadline,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
              child: GridView.builder(
                clipBehavior: Clip.none,
                itemCount: meditationList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: ((context, index) {
                  return CustomCard(
                    meditation: meditationList[index],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
