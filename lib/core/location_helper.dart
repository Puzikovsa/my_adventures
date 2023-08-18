class LocationHelper {
  static String MY_API_KEY = 'c1a4e31c-8271-44aa-87fc-1ed067ade3bc';
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://static-maps.yandex.ru/1.x/?ll=$longitude,$latitude&size=450,450&z=13&l=map&pt=$longitude,$latitude,comma';
  }
}
