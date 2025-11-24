import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Drawing extends StatefulWidget {
  const Drawing({Key? key}) : super(key: key);

  @override
  State<Drawing> createState() => _DrawingState();
}

class _DrawingState extends State<Drawing> {
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(50),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(10)),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 13,
                            offset: Offset(0, 4))
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 26, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Drawings',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        margin: EdgeInsets.only(right: 20, bottom: 20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'Assets/Images/drawing.png',
                                ))),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
