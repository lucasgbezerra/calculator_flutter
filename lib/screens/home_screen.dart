import 'package:calculator_flutter/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final List<String> buttons = [
      'C',
      '+/-',
      '%',
      'div',
      '7',
      '8',
      '9',
      'times',
      '4',
      '5',
      '6',
      'minus',
      '1',
      '2',
      '3',
      'plus',
      '.',
      '0',
      'backspace',
      'equals',
    ];
    final Map<String, IconData> operators = {
      'div': FontAwesomeIcons.divide,
      'times': FontAwesomeIcons.times,
      'minus': FontAwesomeIcons.minus,
      'plus': FontAwesomeIcons.plus,
      'backspace': Icons.backspace_outlined,
      'equals': FontAwesomeIcons.equals,
    };
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
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                print(buttons[index]);
                // Limpar
                if (index == 0) {
                  return ButtonWidget(
                    text: buttons[index],
                    textColor: Color(0xFF0bbfa6),
                    onPressed: () {},
                  );
                  // Operadores
                } else if (operators.containsKey(buttons[index])) {
                  return ButtonWidget(
                    icon: operators[buttons[index]],
                    textColor: index != buttons.length - 2
                        ? const Color(0xFFd0666e)
                        : const Color(0xFF08090a),
                    onPressed: () {},
                  );
                  // Numeros e ponto
                } else {
                  return ButtonWidget(
                    text: buttons[index],
                    textColor: index < 3
                        ? const Color(0xFF0bbfa6)
                        : const Color(0xFF08090a),
                    onPressed: () {},
                  );
                }
              },
            ),
          ),
        )
      ]),
    );
  }
}
