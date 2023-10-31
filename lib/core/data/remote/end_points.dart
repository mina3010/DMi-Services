class EndPoints {
  static const search = '/api/videos/lessons/search';

  static lessonDetails(int id) => '/api/videos/lessons/$id';

  static lessons(int id) => '/api/videos/categories/$id/lessons';
  static const videosCategories = '/api/videos/categories';
}
