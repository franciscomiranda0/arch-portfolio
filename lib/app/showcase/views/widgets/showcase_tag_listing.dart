import 'package:arch/app/showcase/blocs/tag_cubit/tag_cubit.dart';
import 'package:arch/app/showcase/views/widgets/showcase_tag_item.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:arch/src/widgets/arch_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowcaseTagListing extends StatefulWidget {
  const ShowcaseTagListing({Key? key}) : super(key: key);

  final String _errorMessage = 'Não foi possível carregar as Tags';

  @override
  _ShowcaseTagListingState createState() => _ShowcaseTagListingState();
}

class _ShowcaseTagListingState extends State<ShowcaseTagListing> {
  late final TagCubit _cubit;

  @override
  initState() {
    super.initState();
    _setCubit();
    _getListing();
  }

  Widget _buildTagItem(BuildContext context, int index, String item) {
    return ShowcaseTagItem(item);
  }

  void _getListing() => this._cubit.getTagListing();

  void _setCubit() => this._cubit = context.read<TagCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagCubit, TagState>(
      builder: (context, state) {
        if (state is TagListingLoading) {
          return LinearProgressIndicator(
            backgroundColor: ArchPalette.black87,
            valueColor: AlwaysStoppedAnimation(
              ArchPalette.accent,
            ),
          );
        }
        if (state is TagListingLoaded) {
          return ListView.builder(
            itemCount: state.tagListing.length,
            itemBuilder: (context, index) =>
                _buildTagItem(context, index, state.tagListing[index]),
            padding: EdgeInsets.symmetric(
              horizontal: ArchSize.relativeHeight(2, context),
              vertical: ArchSize.relativeHeight(1.4, context),
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          );
        }
        return ArchText(
          widget._errorMessage,
          color: ArchPalette.accent,
        );
      },
    );
  }
}
