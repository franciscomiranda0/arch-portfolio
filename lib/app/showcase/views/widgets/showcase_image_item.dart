import 'package:arch/app/detail/views/detail_view.dart';
import 'package:arch/app/showcase/repositories/models/showcase.dart';
import 'package:arch/src/arch_font_size.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/widgets/arch_text.dart';
import 'package:flutter/material.dart';

class ShowcaseImageItem extends StatelessWidget {
  const ShowcaseImageItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  final Showcase item;

  String _getDate(String rawDate) {
    List<String> _splitString = rawDate.split('-');
    return '${_splitString[2]}/${_splitString[1]}/${_splitString[0]}';
  }

  void _onTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => DetailView(
          showcase: item,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ArchPalette.accent,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ArchPalette.accent,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      item.fileName,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ArchText(
                    item.title,
                    color: ArchPalette.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: ArchFontSize.heading4,
                  ),
                  ArchText(
                    _getDate(item.createdAt),
                    color: ArchPalette.accent,
                    fontWeight: FontWeight.normal,
                    fontSize: ArchFontSize.heading5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
