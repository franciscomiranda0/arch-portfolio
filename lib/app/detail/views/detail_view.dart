import 'package:arch/app/detail/widgets/detail_row.dart';
import 'package:arch/app/showcase/repositories/models/showcase.dart';
import 'package:arch/app/showcase/views/widgets/showcase_appbar.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.showcase,
  }) : super(key: key);

  final Showcase showcase;

  String _getDate(String rawDate) {
    List<String> _splitString = rawDate.split('-');
    return '${_splitString[2]}/${_splitString[1]}/${_splitString[0]}';
  }

  String _getTagList(List<String> rawTags) => rawTags.fold(
      '',
      (previousValue, element) =>
          '${previousValue.isNotEmpty ? '$previousValue,' : ''} $element');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowcaseAppBar(
        title: showcase.title,
      ),
      backgroundColor: ArchPalette.primary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    showcase.fileName,
                  ),
                ),
              ),
              height: ArchSize.relativeHeight(48, context),
            ),
            SizedBox(
              height: ArchSize.relativeHeight(4, context),
            ),
            DetailRow(
              title: 'Autor',
              content: showcase.author,
            ),
            SizedBox(
              height: ArchSize.relativeHeight(2, context),
            ),
            DetailRow(
              title: 'Descrição',
              content: showcase.description,
            ),
            SizedBox(
              height: ArchSize.relativeHeight(2, context),
            ),
            DetailRow(
              title: 'Data de criação',
              content: _getDate(showcase.createdAt),
            ),
            SizedBox(
              height: ArchSize.relativeHeight(2, context),
            ),
            DetailRow(
              title: 'Tags',
              content: _getTagList(showcase.tagList).trim(),
            ),
            SizedBox(
              height: ArchSize.relativeHeight(4, context),
            ),
          ],
        ),
      ),
    );
  }
}
