import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';
import 'package:iqplayer/iqplayer.dart';

class FitnessScreen extends StatefulWidget {
  @override
  _FitnessScreenState createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/timer");
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.timelapse_rounded),
      ),
      backgroundColor: Colors.brown,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Fitness",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Colors.white,
          )),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Fitness Videos",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.white), fontSize: 35),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              width: double.maxFinite,
              height: 300,
              child: ListView(
                shrinkWrap: true,
                children: [
                  OutlineButton(
                      padding: EdgeInsets.all(15),
                      borderSide: BorderSide(color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => IQScreen(
                              title: "Weight Loss for Women",
                              description: 'Fitness Videos',
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'https://www.youtube.com/watch?v=xViWU57xDk4',
                              ),
                              iqTheme: IQTheme(
                                loadingProgress: SpinKitCircle(
                                  color: Colors.white,
                                ),
                                playButtonColor: Colors.transparent,
                                videoPlayedColor: Colors.indigo,

                                // playButton: (true) {
                                //   if (isPlay)
                                //     return Icon(
                                //       Icons.pause_circle_filled,
                                //       color: Colors.red,
                                //       size: 50,
                                //     );
                                //   return Icon(
                                //     Icons.play_circle_outline,
                                //     color: Colors.red,
                                //     size: 50,
                                //   );
                                // },
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight Loss for Women",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )),
                  Divider(),
                  OutlineButton(
                      padding: EdgeInsets.all(15),
                      borderSide: BorderSide(color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => IQScreen(
                              title: "Weight Loss for all",
                              description: 'Fitness Videos',
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'https://www.youtube.com/watch?v=AXZlb-3MMYE',
                              ),
                              iqTheme: IQTheme(
                                loadingProgress: SpinKitCircle(
                                  color: Colors.white,
                                ),
                                playButtonColor: Colors.transparent,
                                videoPlayedColor: Colors.indigo,

                                // playButton: (true) {
                                //   if (isPlay)
                                //     return Icon(
                                //       Icons.pause_circle_filled,
                                //       color: Colors.red,
                                //       size: 50,
                                //     );
                                //   return Icon(
                                //     Icons.play_circle_outline,
                                //     color: Colors.red,
                                //     size: 50,
                                //   );
                                // },
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight Loss for all",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )),
                  Divider(),
                  OutlineButton(
                      padding: EdgeInsets.all(15),
                      borderSide: BorderSide(color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => IQScreen(
                              title: "Full Body Workout",
                              description: 'Fitness Videos',
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'https://www.youtube.com/watch?v=ml6cT4AZdqI&feature=youtu.be',
                              ),
                              iqTheme: IQTheme(
                                loadingProgress: SpinKitCircle(
                                  color: Colors.white,
                                ),
                                playButtonColor: Colors.transparent,
                                videoPlayedColor: Colors.indigo,

                                // playButton: (true) {
                                //   if (isPlay)
                                //     return Icon(
                                //       Icons.pause_circle_filled,
                                //       color: Colors.red,
                                //       size: 50,
                                //     );
                                //   return Icon(
                                //     Icons.play_circle_outline,
                                //     color: Colors.red,
                                //     size: 50,
                                //   );
                                // },
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Full Body Workout",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )),
                  Divider(),
                  OutlineButton(
                      padding: EdgeInsets.all(15),
                      borderSide: BorderSide(color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => IQScreen(
                              title: "20 min Workouty",
                              description: 'Fitness Videos',
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'https://www.youtube.com/watch?v=AzV3EA-1-yM&feature=youtu.be',
                              ),
                              iqTheme: IQTheme(
                                loadingProgress: SpinKitCircle(
                                  color: Colors.white,
                                ),
                                playButtonColor: Colors.transparent,
                                videoPlayedColor: Colors.indigo,

                                // playButton: (true) {
                                //   if (isPlay)
                                //     return Icon(
                                //       Icons.pause_circle_filled,
                                //       color: Colors.red,
                                //       size: 50,
                                //     );
                                //   return Icon(
                                //     Icons.play_circle_outline,
                                //     color: Colors.red,
                                //     size: 50,
                                //   );
                                // },
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "20-min Workout",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )),
                  Divider(),
                  OutlineButton(
                      padding: EdgeInsets.all(15),
                      borderSide: BorderSide(color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => IQScreen(
                              title: "30-min Kick-Boxing",
                              description: 'Fitness Videos',
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'hhttps://www.youtube.com/watch?v=hIXMt5CGlIM&feature=youtu.be',
                              ),
                              iqTheme: IQTheme(
                                loadingProgress: SpinKitCircle(
                                  color: Colors.white,
                                ),
                                playButtonColor: Colors.transparent,
                                videoPlayedColor: Colors.indigo,

                                // playButton: (true) {
                                //   if (isPlay)
                                //     return Icon(
                                //       Icons.pause_circle_filled,
                                //       color: Colors.red,
                                //       size: 50,
                                //     );
                                //   return Icon(
                                //     Icons.play_circle_outline,
                                //     color: Colors.red,
                                //     size: 50,
                                //   );
                                // },
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "30-min Kick-Boxing",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )),
                  Divider(),
                  OutlineButton(
                      padding: EdgeInsets.all(15),
                      borderSide: BorderSide(color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => IQScreen(
                              title: "Weight Loss for Women",
                              description: 'Fitness Videos',
                              videoPlayerController:
                                  VideoPlayerController.network(
                                'https://www.youtube.com/watch?v=xViWU57xDk4',
                              ),
                              iqTheme: IQTheme(
                                loadingProgress: SpinKitCircle(
                                  color: Colors.white,
                                ),
                                playButtonColor: Colors.transparent,
                                videoPlayedColor: Colors.indigo,

                                // playButton: (true) {
                                //   if (isPlay)
                                //     return Icon(
                                //       Icons.pause_circle_filled,
                                //       color: Colors.red,
                                //       size: 50,
                                //     );
                                //   return Icon(
                                //     Icons.play_circle_outline,
                                //     color: Colors.red,
                                //     size: 50,
                                //   );
                                // },
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Temp Workout",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(0)),
              // padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      "Diet Chart",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.brown),
                          fontSize: 35),
                    ),
                  ),
                  Container(
                    child: Image.asset("lib/assets/diet.jpg"),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
