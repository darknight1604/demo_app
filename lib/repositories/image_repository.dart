import 'package:demo_app/helper/constants.dart';

class ImageRepository {
  final int imagePerRequest = 3;

  Future<Map<String, dynamic>> getListImage({
    int start = 0,
  }) async {
    Map<String, dynamic> result = {
      Constants.DATA: [],
    };
    await Future.delayed(const Duration(milliseconds: 200));

    ///init static data
    List<String> data = [];
    String name = 'images/image-';
    for (int i = 1; i <= 10; i++) {
      data.add(name + i.toString() + '.png');
    }
    //end init static data

    if (start >= data.length) {
      result[Constants.DATA] = [];
      result[Constants.HAS_NEXT] = false;
    } else {
      try {
        for (int i = start; i < start + imagePerRequest; i++) {
          if (data[i] != null) {
            result[Constants.DATA].add(data[i]);
          }
        }
      } catch (_) {}

      ///check has next data
      List<String> nextData = [];
      try {
        for (int i = start + imagePerRequest;
            i < start + 2 * imagePerRequest;
            i++) {
          if (data[i] != null) {
            nextData.add(data[i]);
          }
        }
      } catch (_) {}

      if (nextData.isNotEmpty) {
        result[Constants.HAS_NEXT] = true;
      } else {
        result[Constants.HAS_NEXT] = false;
      }
    }
    return result;
  }
}
