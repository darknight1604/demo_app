import 'package:demo_app/helper/constants.dart';
import 'package:demo_app/route/route.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              createIconButton('home.png', () {
                _handleNavigateWelcomeScreen(context);
              }),
              createIconButton('search.png', () {}),
              createCenterButton(),
              createIconButton('comment.png', () {}),
              createIconButton('person.png', () {}),
            ],
          ),
        ),
      ),
      //color of the BottomAppBar
      color: Colors.white,
    );
  }

  void _handleNavigateWelcomeScreen(context) {
    Navigator.of(context).popAndPushNamed(RouteGenerator.welcomePage);
  }

  Widget createCenterButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19.0),
          color: Colors.yellow,
          gradient: LinearGradient(
            colors: [
              HexColor('#FF00D6'),
              HexColor('#FF4D00'),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset('images/plus.png'),
        ),
      ),
    );
  }

  Widget createIconButton(String image, Function onpress) {
    return IconButton(
      onPressed: () {
        onpress();
      },
      iconSize: 25.0,
      icon: Image.asset('images/' + image),
    );
  }
}
