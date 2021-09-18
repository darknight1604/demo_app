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

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      ///create ImageBloc and send GetListImageRequest to bloc
      create: (context) => ImageBloc(
        imageRepository: RepositoryProvider.of<ImageRepository>(context),
      )..add(
          GetListImageRequest(isInitial: true),
        ),
      child: Padding(
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
              child: ListView(
                children: [
                  NewsWidget(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  UserInformationWidget(
                    image: 'avatar-2.png',
                    aboveText: 'Ridhwan Nordin',
                    belowText: '@ridzjcob',
                    padding: EdgeInsets.only(top: 15.0),
                    rightChild: Expanded(
                      child: Container(),
                    ),
                  ),
                  ListImageWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
