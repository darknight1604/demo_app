import 'package:demo_app/blocs/image_bloc/image_bloc.dart';
import 'package:demo_app/helper/constants.dart';
import 'package:demo_app/helper/custom_text.dart';
import 'package:demo_app/repositories/image_repository.dart';
import 'package:demo_app/ui/common/user_information_widget.dart';
import 'package:demo_app/ui/home_page/list_image_widget.dart';
import 'package:demo_app/ui/home_page/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.createNormalText(
            'title.discover'.tr(),
            size: 36,
            fontFamily: Constants.COMFORTAA,
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewsWidget(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    UserInformationWidget(
                      image: 'avatar-2.png',
                      aboveText: 'Ridhwan Nordin',
                      belowText: '@ridzjcob',
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    BlocProvider(
                      create: (context) => ImageBloc(
                        imageRepository:
                            RepositoryProvider.of<ImageRepository>(context),
                      )..add(
                          GetListImageRequest(),
                        ),
                      child: ListImageWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
