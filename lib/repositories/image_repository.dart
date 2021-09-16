class ImageRepository {
  Future<List<String>> getListImage() async {
    await Future.delayed(const Duration(milliseconds: 200));
    List<String> result = [];
    String name = 'images/image-';
    for (int i = 1; i <= 10; i++) {
      result.add(name + i.toString() + '.png');
    }
    return result;
  }
}
