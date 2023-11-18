import 'package:ahmed_meditation_app/Models/meditation_model.dart';
import 'package:ahmed_meditation_app/constatnts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_willpop_scope.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});
  static String id = "PlayerScreen";
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  AudioCache? cachee;
  AudioPlayer? player;
  bool _isPlay = false;
  Duration currentPostion = const Duration();
  Duration musicLenght = const Duration();
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    cachee = AudioCache(fixedPlayer: player);
    setUp();
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  setUp() {
    player!.onAudioPositionChanged.listen((event) {
      setState(() {
        currentPostion = event;
      });
      player!.onDurationChanged.listen((event) {
        setState(() {
          musicLenght = event;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Meditation meditation =
        ModalRoute.of(context)!.settings.arguments as Meditation;
    return CustomWillPopScope(
      title: Text("Are you sure You want To leave "),
      onPressed: () {
        Navigator.of(context).pop(true);
        player!.pause();
      },
      onPressedNo: () {
        Navigator.of(context).pop(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                player!.pause();
                Navigator.pop(context);
              },
            )),
        backgroundColor: kPink,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${kIMG}jj.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.height! * .1),
                  Container(
                    height: ScreenSize.width! * .6,
                    width: ScreenSize.width! * .6,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 18,
                          offset: Offset(0, 18),
                          color: Color(0x20334454),
                        )
                      ],
                      image: DecorationImage(
                        image: AssetImage(meditation.imgUrl),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.height! * .08,
                  ),
                  Text(
                    meditation.name,
                    style: kHeadline,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16, top: 5),
                    child: Text(
                      meditation.des,
                      style: kParaghraph,
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.height! * .08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${currentPostion.inSeconds}",
                        style: kText,
                      ),
                      SizedBox(
                        width: 260,
                        child: Slider(
                          thumbColor: const Color.fromARGB(255, 0, 0, 0),
                          inactiveColor:
                              const Color.fromARGB(255, 199, 197, 197),
                          activeColor: const Color.fromARGB(255, 55, 5, 5),
                          value: currentPostion.inSeconds.toDouble(),
                          max: musicLenght.inSeconds.toDouble(),
                          onChanged: ((value) {
                            player!.seek(Duration(seconds: value.toInt()));
                          }),
                        ),
                      ),
                      Text(
                        " ${musicLenght.inSeconds}",
                        style: kText,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 60, right: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (() {
                            if (currentPostion.inSeconds < 10) {
                              player!.seek(const Duration(seconds: 0));
                            } else if (currentPostion.inSeconds > 10) {
                              player!.seek(Duration(
                                  seconds: currentPostion.inSeconds - 10));
                            }
                          }),
                          icon: const Icon(
                            Icons.first_page,
                            size: 40,
                          ),
                        ),
                        IconButton(
                          onPressed: (() {
                            if (_isPlay) {
                              setStateIfMounted(() {
                                _isPlay = false;
                              });
                              try {
                                player!.pause();
                              } on Exception catch (e) {
                                Expanded(
                                  child: Text("$e"),
                                );
                              }
                            } else {
                              setStateIfMounted(() {
                                _isPlay = true;
                              });
                              try {
                                cachee!.play(meditation.audio);
                              } on Exception catch (e) {
                                Expanded(
                                  child: Text("$e"),
                                );
                              }
                            }
                          }),
                          icon: _isPlay
                              ? const Icon(
                                  Icons.pause,
                                  size: 40,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                ),
                        ),
                        IconButton(
                          onPressed: (() {
                            if (currentPostion <
                                musicLenght - const Duration(seconds: 10)) {
                              player!.seek(Duration(
                                  seconds: currentPostion.inSeconds + 10));
                            } else {
                              player!.seek(
                                  Duration(seconds: musicLenght.inSeconds));
                              setStateIfMounted(() {
                                _isPlay = false;
                              });
                              player!.stop();
                            }
                          }),
                          icon: const Icon(
                            Icons.last_page,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
