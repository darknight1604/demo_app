import 'package:demo_app/blocs/image_bloc/image_bloc.dart';
import 'package:demo_app/helper/constants.dart';
import 'package:demo_app/helper/custom_text.dart';
import 'package:demo_app/ui/common/submit_button_widget.dart';
import 'package:demo_app/ui/home_page/image_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListImageWidget extends StatefulWidget {
  ListImageWidget({
    Key? key,
  }) : super(key: key);
  @override
  _ListImageWidgetState createState() => _ListImageWidgetState();
}

class _ListImageWidgetState extends State<ListImageWidget> {
  List<String> images = [];
  bool hasReachMax = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageBloc, ImageState>(
      listener: (context, state) {
        if (state is ImageLoaded) {
          setState(() {
            images = state.images;
            hasReachMax = state.isReachedMax;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.createBoldText(
              'title.browseAll'.tr(),
              size: 13,
            ),

            ///ListView Image
            StaggeredGridView.countBuilder(
              //because at parent have SingleChildScrollView -> this gridView must lock scroll
              physics: ScrollPhysics(),
              shrinkWrap: true,
              //end
              primary: false,
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return ImageItemWidget(
                  images[index],
                );
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
              itemCount: images.length,
            ),

            ///See more button
            hasReachMax
                ? Container()
                : SubmitButtonWidget(
                    onPress: () {
                      context.read<ImageBloc>().add(
                            GetListImageRequest(isInitial: false),
                          );
                    },
                    child: CustomText.createBoldText(
                      'button.seeMore'.tr(),
                      size: 13,
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    backgroundColor: Colors.white,
                    borderSide: Constants.BLACK_BORDER_SIDE,
                    isHideKeyboard: false,
                  ),
          ],
        ),
      ),
    );
  }
}
