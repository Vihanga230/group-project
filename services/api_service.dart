Future<List<String>> fetchStudyTips() async {
  final response = await http.get(Uri.parse('https://api.example.com/studytips'));
  if (response.statusCode == 200) {
    return List<String>.from(json.decode(response.body));
  } else {
    throw Exception('Failed to load tips');
  }
}