import 'package:arch/app/showcase/blocs/image_cubit/image_cubit.dart';
import 'package:arch/app/showcase/blocs/tag_cubit/tag_cubit.dart';
import 'package:arch/app/showcase/repositories/showcase_repository.dart';
import 'package:arch/app/showcase/views/widgets/showcase_appbar.dart';
import 'package:arch/app/showcase/views/widgets/showcase_image_listing.dart';
import 'package:arch/app/showcase/views/widgets/showcase_tag_listing.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowcaseView extends StatefulWidget {
  const ShowcaseView({Key? key}) : super(key: key);

  final String _pageTitle = 'Showcase';

  @override
  _ShowcaseViewState createState() => _ShowcaseViewState();
}

class _ShowcaseViewState extends State<ShowcaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowcaseAppBar(
        title: widget._pageTitle,
        toolbarHeight: ArchSize.relativeHeight(12, context),
      ),
      backgroundColor: ArchPalette.primary,
      body: Stack(
        children: <Widget>[
          BlocProvider<ImageCubit>(
            create: (context) => ImageCubit(
              initialState: ImageInitial(),
              repository: ShowcaseImageRepositoryImplementation(),
            ),
            child: ShowcaseImageListing(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: ArchPalette.primary,
                ),
                height: ArchSize.relativeHeight(8, context),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: ArchSize.relativeWidth(2, context),
                    ),
                    Flexible(
                      child: BlocProvider<TagCubit>(
                        create: (context) => TagCubit(
                          initialState: TagInitial(),
                          repository: ShowcaseTagRepositoryImplementation(),
                        ),
                        child: ShowcaseTagListing(),
                      ),
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
