import 'package:arch/app/showcase/views/showcase_view.dart';
import 'package:arch/src/widgets/arch_pill_button.dart';
import 'package:arch/src/widgets/arch_text.dart';
import 'package:arch/src/arch_font_size.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:arch/src/constants/arch_image_path.dart';
import 'package:arch/src/constants/arch_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  final String _enterButtonLabel = 'Entrar';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _onPressedEnter() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ShowcaseView(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ArchPalette.primary,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: ArchSize.relativeHeight(16, context),
            child: SvgPicture.asset(
              ArchImagePath.homeBackground,
              color: Colors.black,
              height: ArchSize.relativeHeight(48, context),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: ArchSize.relativeHeight(32, context),
              ),
              ArchText(
                '${ArchString.appFirstName} ${ArchString.appLastName}',
                color: ArchPalette.accent,
                fontSize: ArchFontSize.heading1,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Column(
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    SizedBox(
                      height: ArchSize.relativeHeight(4, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ArchPillButton(
                          alignment: Alignment.center,
                          onPressed: _onPressedEnter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ArchText(
                                widget._enterButtonLabel,
                                color: ArchPalette.primary,
                                fontSize: ArchFontSize.heading4,
                              ),
                              SizedBox(
                                width: ArchSize.relativeWidth(2, context),
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color: ArchPalette.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
