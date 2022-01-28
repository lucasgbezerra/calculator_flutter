import 'package:calculator_flutter/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String answer = "";
  String equation = "";
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final List<String> buttons = [
      'C',
      '+/-',
      '%',
      '÷',
      '7',
      '8',
      '9',
      'x',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '.',
      '0',
      'backspace',
      '=',
    ];
    final Map<String, IconData> operators = {
      '÷': FontAwesomeIcons.divide,
      'x': FontAwesomeIcons.times,
      '-': FontAwesomeIcons.minus,
      '+': FontAwesomeIcons.plus,
      'backspace': Icons.backspace_outlined,
      '=': FontAwesomeIcons.equals,
    };

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(children: [
        SafeArea(
          child: SizedBox(
              height: sizeScreen.height * 0.3,
              width: sizeScreen.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      formattedEquation(equation),
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      answer,
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                // Limpar
                if (index == 0) {
                  return ButtonWidget(
                    text: buttons[index],
                    textColor: const Color(0xFF0bbfa6),
                    onPressed: () {
                      setState(() {
                        answer = "";
                        equation = "";
                      });
                    },
                  );
                  // Operadores
                } else if (operators.containsKey(buttons[index])) {
                  return ButtonWidget(
                    icon: operators[buttons[index]],
                    textColor: index != buttons.length - 2
                        ? const Color(0xFFd0666e)
                        : const Color(0xFF08090a),
                    onPressed: () {
                      if (buttons[index] == '=') {
                        setState(() {
                          answer = "100";
                        });
                      } else if (buttons[index] == 'backspace') {
                        equation = equation.substring(0, equation.length - 1);
                        setState(() {});
                      } else {
                        if (!operators.containsKey(equation[equation.length-1])) {
                          setState(() {
                            equation += buttons[index];
                          });
                        }
                      }
                    },
                  );
                  // Numeros e ponto
                } else {
                  return ButtonWidget(
                    text: buttons[index],
                    textColor: index < 3
                        ? const Color(0xFF0bbfa6)
                        : const Color(0xFF08090a),
                    onPressed: () {
                      setState(() {
                        equation += buttons[index];
                      });
                    },
                  );
                }
              },
            ),
          ),
        )
      ]),
    );
  }

  String formattedEquation(String equation) {
    List<String> operator = ['%', '÷', 'x', '-', '+'];

    String formattedEquation = "";
    for (int c = 0; c < equation.length; c++) {
      if (operator.contains(equation[c])) {
        formattedEquation += " ${equation[c]} ";
      } else {
        formattedEquation += equation[c];
      }
    }
    return formattedEquation;
  }
}
