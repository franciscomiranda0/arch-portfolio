import 'package:arch/app/showcase/blocs/image_cubit/image_cubit.dart';
import 'package:arch/app/showcase/repositories/models/showcase.dart';
import 'package:arch/app/showcase/views/widgets/showcase_image_item.dart';
import 'package:arch/src/arch_palette.dart';
import 'package:arch/src/arch_size.dart';
import 'package:arch/src/widgets/arch_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowcaseImageListing extends StatefulWidget {
  const ShowcaseImageListing({Key? key}) : super(key: key);

  final double _aspectRatio = 1.7;
  final String _errorMessage = 'Algo deu errado';

  @override
  _ShowcaseImageListingState createState() => _ShowcaseImageListingState();
}

class _ShowcaseImageListingState extends State<ShowcaseImageListing> {
  late final ImageCubit _cubit;
  bool _shouldShowErrorMessage = false;

  @override
  initState() {
    super.initState();
    _setCubit();
    _getListing();
  }

  Widget _buildImageItem(BuildContext context, int index, Showcase item) {
    return ShowcaseImageItem(item);
  }

  void _getListing() => this._cubit.getImageListing();

  void _onError() => setState(() => this._shouldShowErrorMessage = true);

  void _setCubit() => this._cubit = context.read<ImageCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
        print(state.runtimeType);
        if (state is ImageListingLoadError) _onError();
      },
      builder: (context, state) {
        if (state is ImageListingLoading) {
          return LinearProgressIndicator(
            backgroundColor: ArchPalette.black87,
            valueColor: AlwaysStoppedAnimation(
              ArchPalette.accent,
            ),
          );
        }
        if (state is ImageListingLoaded) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: widget._aspectRatio,
                    mainAxisSpacing: ArchSize.relativeHeight(4, context),
                  ),
                  itemBuilder: (context, index) => _buildImageItem(
                    context,
                    index,
                    state.showcaseListing[index],
                  ),
                  itemCount: state.showcaseListing.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: ArchSize.relativeWidth(4, context),
                    vertical: ArchSize.relativeHeight(2, context),
                  ),
                  shrinkWrap: true,
                ),
              ),
              SizedBox(
                height: ArchSize.relativeHeight(8, context),
              )
            ],
          );
        }
        if (_shouldShowErrorMessage) {
          return Expanded(
            child: Center(
              child: ArchText(
                widget._errorMessage,
                color: ArchPalette.accent,
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
