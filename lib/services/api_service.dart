import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://yts.mx/api/v2';

  // Login API
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'), // Replace with your actual login endpoint
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  // Register API
  static Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse(
          '$_baseUrl/register'), // Replace with your actual register endpoint
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }

  // Reset Password API
  static Future<Map<String, dynamic>> resetPassword(String email) async {
    final response = await http.patch(
      Uri.parse(
          '$_baseUrl/reset_password'), // Replace with your actual reset password endpoint
      body: {
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to reset password');
    }
  }

  // Fetch Movies API
  static Future<List<dynamic>> fetchMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/list_movies.json'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data']['movies'];
    } else {
      throw Exception('Failed to load movies');
    }
  }

  // Fetch Movie Details API
  static Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie_details.json?movie_id=$movieId'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data']['movie'];
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  // Fetch Movie Suggestions API
  static Future<List<dynamic>> fetchMovieSuggestions(int movieId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie_suggestions.json?movie_id=$movieId'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data']['movies'];
    } else {
      throw Exception('Failed to load movie suggestions');
    }
  }
}
