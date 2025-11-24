import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/videos.dart';
import '../widget/my_vertical_list.dart';
import 'Videosscreen.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/background.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: ListView(
          children: [
            Center(
              child: Text(
                'Animation Videos',
                style: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffFD5602),
                    fontSize: 36),
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: Videos.listOfVideos.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c) {
                          return VideosScreen(
                              videos: Videos.listOfVideos[index]);
                        }));
                      },
                      child:
                          MyVerticalList(videos: Videos.listOfVideos[index]));
                }),
          ],
        )),
      ),
    );
  }
}
