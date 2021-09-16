import 'package:demo_app/blocs/image_bloc/image_bloc.dart';
import 'package:demo_app/helper/custom_text.dart';
import 'package:demo_app/ui/home_page/image_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListImageWidget extends StatelessWidget {
  const ListImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.createBoldText(
            'title.browseAll'.tr(),
            size: 13,
          ),
          BlocBuilder<ImageBloc, ImageState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ImageLoaded) {
                List<String> images = state.images;
                return StaggeredGridView.countBuilder(
                  //because at parent have SingleChildScrollView -> this gridView must lock scroll
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  //end
                  primary: false,
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) => ImageItemWidget(
                    images[index],
                  ),
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                  itemCount: images.length,
                );
              } else if (state is ImageNotFound) {
                return Center(
                  child: CustomText.createItalicText(
                    'error.imageNotFound'.tr(),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
