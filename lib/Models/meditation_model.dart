import 'package:ahmed_meditation_app/constatnts.dart';

class Meditation {
  String name;
  String imgUrl;
  String audio;
  String des;

  Meditation(
      {required this.imgUrl,
      required this.name,
      required this.audio,
      required this.des});
}

List<Meditation> meditationList = [
  Meditation(
      imgUrl: "${kIMG}pic 1.jpg",
      name: "Guided",
      audio: "1.mp3",
      des: "Brilliant things happen in calm minds. Be calm. You're brilliant."),
  Meditation(
      imgUrl: "${kIMG}pic 2.jpg",
      name: "Self",
      audio: "2.mp3",
      des:
          "To know yourself is to be confident. To be confident is to fearlessly express your potential"),
  Meditation(
      imgUrl: "${kIMG}pic 3.jpg",
      name: "Relaxing",
      audio: "3.mp3",
      des:
          "A day thinking about what could happen, should happen, or what might have been is a day missed"),
  Meditation(
      imgUrl: "${kIMG}pic 4.jpg",
      name: "Deep Medidation",
      audio: "4.mp3",
      des:
          "Distractions are everywhere. Notice what takes your attention, acknowledge it, and then let it go"),
  Meditation(
      imgUrl: "${kIMG}pic 5.jpg",
      name: "Postive Energy",
      audio: "5.mp3",
      des: ""),
  Meditation(
      imgUrl: "${kIMG}pic 6.jpg",
      name: "Healing",
      audio: "3.mp3",
      des:
          "Remember the blue sky. It may at times be obscured by clouds, but it is always there"),
];
