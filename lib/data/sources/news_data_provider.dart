import 'package:http/http.dart' as http;

class NewsDataProvider {
  Future<String> getLatestNews({String query = 'world'}) async {
    try {
      final result = await http.get(Uri.parse("https://gnews.io/api/v4/search?q=$query&lang=en&max=10&apikey=de8075b595a32e6fbc58be5795ee1a11"));
      return result.body;
    } catch (e) {
      throw e.toString();
    }
  }
}