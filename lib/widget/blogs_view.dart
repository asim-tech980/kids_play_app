import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogsView extends StatefulWidget {
  const BlogsView({Key? key}) : super(key: key);

  @override
  State<BlogsView> createState() => _BlogsViewState();
}

class _BlogsViewState extends State<BlogsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
            height: 130,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.03),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(50)),
                      color: Colors.blueAccent,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 13,
                            offset: const Offset(0, 4))
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26, bottom: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        margin: EdgeInsets.only(right: 20, bottom: 20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'Assets/Images/blogs.png',
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Blogs',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
