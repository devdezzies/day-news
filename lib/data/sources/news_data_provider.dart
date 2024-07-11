import 'package:http/http.dart' as http;

class NewsDataProvider {
  Future<String> getLatestNews({String query = 'world'}) async {
    try {
      final result = await http.get(Uri.parse("https://gnews.io/api/v4/search?q=$query&lang=en&max=10&apikey=093bb47a368a8801dfad5e57631e3a3d"));
      return result.body;
    } catch (e) {
      throw e.toString();
    }
  }
}