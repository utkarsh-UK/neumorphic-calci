import 'package:flutter/material.dart';

import '../constants/button_data.dart';
import '../constants/colors.dart';
import '../widgets/button.dart';

class HomeScreen extends StatelessWidget {
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '2235',
                        style: textTheme.subtitle1,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Container(
                      width: size.width,
                      child: Text(
                        '34 * 657',
                        style: textTheme.bodyText2,
                        textAlign: TextAlign.end,
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
