import 'package:calculator_flutter/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final red = Color(0xFFd0666e);
    final green = Color(0xFF0bbfa6);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(children: [
        SafeArea(
          child: Container(
              height: sizeScreen.height * 0.3,
              width: sizeScreen.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '20 + 10',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '210',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                // 1 line
                ButtonWidget(
                  text: "C",
                  textColor: green,
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "+/-",
                  textColor: green,
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "%",
                  textColor: green,
                  onPressed: () {},
                ),
                ButtonWidget(
                  icon: FontAwesomeIcons.divide,
                  textColor: red,
                  onPressed: () {},
                ),
                // 2 line
                ButtonWidget(
                  text: "7",
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "8",
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "9",
                  onPressed: () {},
                ),
                ButtonWidget(
                  icon: FontAwesomeIcons.times,
                  textColor: red,
                  onPressed: () {},
                ),
                // 3 line
                ButtonWidget(
                  text: "4",
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "5",
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "6",
                  onPressed: () {},
                ),
                ButtonWidget(
                  icon: FontAwesomeIcons.minus,
                  textColor: red,
                  onPressed: () {},
                ),
                // 4 line
                ButtonWidget(
                  text: "1",
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "2",
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "3",
                  onPressed: () {},
                ),
                ButtonWidget(
                  icon: FontAwesomeIcons.plus,
                  textColor: red,
                  onPressed: () {},
                ),
                // 5 line
                ButtonWidget(
                  text: ".",
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: "0",
                  onPressed: () {},
                ),
                ButtonWidget(
                  icon: Icons.backspace_outlined,
                  onPressed: () {},
                ),
                ButtonWidget(
                  icon: FontAwesomeIcons.equals,
                  textColor: red,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
