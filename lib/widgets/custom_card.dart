import 'package:ahmed_meditation_app/Models/meditation_model.dart';
import 'package:ahmed_meditation_app/Screens/player_screen.dart';
import 'package:ahmed_meditation_app/constatnts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.meditation,
    Key? key,
  }) : super(key: key);

  Meditation meditation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PlayerScreen.id, arguments: meditation);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color:
                    const Color.fromARGB(255, 247, 181, 181).withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Card(
                elevation: 20,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(meditation.name, style: kCardText),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 8,
              top: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  height: 100,
                  width: 150,
                  image: AssetImage(
                    meditation.imgUrl,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
