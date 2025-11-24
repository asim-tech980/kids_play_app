import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_play_mob_app/Screens/countinglearn.dart';
import 'package:kids_play_mob_app/Screens/detail.dart';
import 'package:kids_play_mob_app/Screens/drawing_view.dart';
import 'package:kids_play_mob_app/Screens/login/login.dart';
import 'package:kids_play_mob_app/Screens/videolist.dart';
import 'package:kids_play_mob_app/model/blog.dart';
import 'package:kids_play_mob_app/widget/Counting.dart';
import 'package:kids_play_mob_app/widget/Learning.dart';
import 'package:kids_play_mob_app/widget/animatedvideo.dart';
import 'package:kids_play_mob_app/widget/drawing.dart';
import 'package:kids_play_mob_app/widget/my_horizantal_list.dart';

import '../widget/blogs_view.dart';
import 'alphabetgrid.dart';
import 'blogs_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/background.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        key: scaffoldkey,
        endDrawer: Padding(
          padding: const EdgeInsets.only(bottom: 520),
          child: Container(
            width: 100,
            height: 70,
            child: Drawer(
              backgroundColor: Colors.deepOrange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Center(
                  child: ListTile(
                onTap: () async {
                  // await FirebaseAuth.instance.signOut();
                  // await storage.delete(key: "uid");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false);
                },
                title: const Text(
                  'Signout',
                  style: TextStyle(color: Colors.white),
                ),
              )),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kids Play',
                        style: GoogleFonts.oswald(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffFD5602),
                            fontSize: 36),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () =>
                          scaffoldkey.currentState?.openEndDrawer(),
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.deepOrange,
                      ))
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                  height: 349,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Blog.listOfBlog.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (c) {
                                return DetailScreen(
                                    blog: Blog.listOfBlog[index]);
                              }));
                            },
                            child: MyHorizentalList(
                              blog: Blog.listOfBlog[index],
                            ));
                      })),
              SizedBox(
                height: 20,
              ),
              Text(
                'Learning Section',
                style: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffff0000),
                    fontSize: 25),
              ),
              GestureDetector(
                child: LearningSection(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AlphabetGridView()));
                },
              ),
              GestureDetector(
                child: AnimatedVideo(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VideoList()));
                },
              ),
              GestureDetector(
                child: const CountingLearn(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CountingSceen()));
                },
              ),
              GestureDetector(
                child: const Drawing(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DrawingScreen()));
                },
              ),
              GestureDetector(
                child: const BlogsView(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BlogsListView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
