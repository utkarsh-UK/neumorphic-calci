import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

import '../constants/button_data.dart';
import '../constants/colors.dart';
import '../widgets/button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _calculationController;
  TextEditingController _resultController;

  @override
  void initState() {
    super.initState();

    _calculationController = TextEditingController(text: '0');
    _resultController = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    super.dispose();

    _calculationController.dispose();
    _resultController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * 0.2,
                margin: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: TextField(
                        controller: _resultController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.end,
                        style: textTheme.subtitle1,
                        readOnly: true,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Container(
                      width: size.width,
                      child: TextField(
                        controller: _calculationController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.end,
                        style: textTheme.bodyText2.copyWith(fontSize: 22),
                        readOnly: true,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Flexible(
                child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 16.0,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    children: data
                        .map(
                          (button) => Button(
                            text: button.text,
                            style: textTheme.subtitle1.copyWith(
                              color: button.isDigit
                                  ? MyColors.primaryFontColor
                                  : MyColors.secondaryFontColor,
                            ),
                            isDigit: button.isDigit,
                            onButtonPressed: () {
                              if (_calculationController.text.startsWith('0')) {
                                _calculationController.clear();
                              }
                              if (button.isDigit) {
                                _calculationController.text =
                                    '${_calculationController.text}${button.text}';
                              } else {
                                switch (button.text) {
                                  case 'C':
                                    _calculationController.text = '0';
                                    _resultController.text = '0';
                                    break;

                                  case 'X':
                                    _calculationController.text =
                                        '${_calculationController.text} * ';
                                    break;

                                  case '.':
                                    _calculationController.text =
                                        '${_calculationController.text}.';
                                    break;

                                  case '<-':
                                    final len = _calculationController.text
                                        .trim()
                                        .length;

                                    if (len <= 1) {
                                      _calculationController.text = '0';
                                    } else {
                                      _calculationController.text =
                                          _calculationController.text
                                              .substring(0, len - 1);
                                    }
                                    break;

                                  case '=':
                                    Expression expression = Expression.parse(
                                      _calculationController.text
                                          .replaceAll(' ', ''),
                                    );

                                    final evaluator =
                                        const ExpressionEvaluator();
                                    var r = evaluator.eval(expression, {});
                                    _resultController.text = r is double
                                        ? r.toStringAsFixed(2)
                                        : r.toString();
                                    break;

                                  default:
                                    _calculationController.text =
                                        '${_calculationController.text} ${button.text} ';
                                }
                              }

                              setState(() {});
                            },
                          ),
                        )
                        .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
