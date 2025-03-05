import 'package:flutter/material.dart';
import 'package:movies_app/services/api_service.dart';
import 'package:movies_app/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movies_app/screens/update_profile_screen/update_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<dynamic> _movies = [];
  List<dynamic> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();
  String _selectedGenre = 'All';
  final List<dynamic> _watchlist = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      final movies = await ApiService.fetchMovies();
      setState(() {
        _movies = movies;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load movies: $e')),
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _searchMovies(String query) {
    setState(() {
      _searchResults = _movies
          .where((movie) =>
              movie['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  List<String> _getGenres() {
    final Set<String> genres = {};
    for (final movie in _movies) {
      genres.addAll(movie['genres'].cast<String>());
    }
    return genres.toList();
  }

  List<dynamic> _getMoviesByGenre(String genre) {
    return _movies.where((movie) => movie['genres'].contains(genre)).toList();
  }

  void _addToWatchlist(dynamic movie) {
    setState(() {
      if (!_watchlist.contains(movie)) {
        _watchlist.add(movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final genres = _getGenres();
    return Scaffold(
      appBar: AppBar(
        title: _selectedIndex == 1
            ? TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search movies...',
                  border: InputBorder.none,
                ),
                onChanged: _searchMovies,
              )
            : _selectedIndex == 2
                ? DropdownButton<String>(
                    value: _selectedGenre,
                    items: ['All', ...genres]
                        .map((genre) => DropdownMenuItem(
                              value: genre,
                              child: Text(genre),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGenre = value!;
                      });
                    },
                  )
                : const Text('Movies App'),
      ),
      body: _selectedIndex == 0
          ? _movies.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    final movie = _movies[index];
                    return ListTile(
                      title: Text(movie['title']),
                      subtitle: Text(movie['year'].toString()),
                      leading: Image.network(movie['medium_cover_image']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailsScreen(movieId: movie['id']),
                          ),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () => _addToWatchlist(movie),
                      ),
                    );
                  },
                )
          : _selectedIndex == 1
              ? _searchResults.isEmpty
                  ? const Center(child: Text('No results found.'))
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = _searchResults[index];
                        return ListTile(
                          title: Text(movie['title']),
                          subtitle: Text(movie['year'].toString()),
                          leading: Image.network(movie['medium_cover_image']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailsScreen(movieId: movie['id']),
                              ),
                            );
                          },
                          trailing: IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () => _addToWatchlist(movie),
                          ),
                        );
                      },
                    )
              : _selectedIndex == 2
                  ? _selectedGenre == 'All'
                      ? ListView.builder(
                          itemCount: _movies.length,
                          itemBuilder: (context, index) {
                            final movie = _movies[index];
                            return ListTile(
                              title: Text(movie['title']),
                              subtitle: Text(movie['year'].toString()),
                              leading:
                                  Image.network(movie['medium_cover_image']),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailsScreen(
                                        movieId: movie['id']),
                                  ),
                                );
                              },
                              trailing: IconButton(
                                icon: const Icon(Icons.favorite_border),
                                onPressed: () => _addToWatchlist(movie),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: _getMoviesByGenre(_selectedGenre).length,
                          itemBuilder: (context, index) {
                            final movie =
                                _getMoviesByGenre(_selectedGenre)[index];
                            return ListTile(
                              title: Text(movie['title']),
                              subtitle: Text(movie['year'].toString()),
                              leading:
                                  Image.network(movie['medium_cover_image']),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailsScreen(
                                        movieId: movie['id']),
                                  ),
                                );
                              },
                              trailing: IconButton(
                                icon: const Icon(Icons.favorite_border),
                                onPressed: () => _addToWatchlist(movie),
                              ),
                            );
                          },
                        )
                  : _selectedIndex == 3
                      ? Column(
                          children: [
                            _watchlist.isEmpty
                                ? const Center(
                                    child: Text('Your watchlist is empty.'))
                                : Expanded(
                                    child: ListView.builder(
                                      itemCount: _watchlist.length,
                                      itemBuilder: (context, index) {
                                        final movie = _watchlist[index];
                                        return ListTile(
                                          title: Text(movie['title']),
                                          subtitle:
                                              Text(movie['year'].toString()),
                                          leading: Image.network(
                                              movie['medium_cover_image']),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MovieDetailsScreen(
                                                        movieId: movie['id']),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UpdateProfileScreen(),
                                  ),
                                );
                              },
                              child: const Text('Update Profile'),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
