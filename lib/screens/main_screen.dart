import 'package:flutter/material.dart';
import 'dart:io'; // For file handling
import 'package:image_picker/image_picker.dart'; // To pick an image from the gallery
import 'login_screen.dart'; // Import the login screen

void main() => runApp(MaterialApp(home: MainScreen()));

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  File? _image; // To store the image file
  final List<Map<String, String>> movies = [
    {
      'title': 'Dune',
      'year': '2021',
      'genre': 'Sci-Fi, Thriller',
      'description': 'A hero navigates a vast desert world of danger.',
      'image': 'assets/images/dune.jpg',
    },
    {
      'title': 'Oppenheimer',
      'year': '2023',
      'genre': 'Drama, Mystery',
      'description': 'A brilliant scientist develops the atomic bomb.',
      'image': 'assets/images/oppenheimer.jpg',
    },
    {
      'title': 'Top Gun: Maverick',
      'year': '2022',
      'genre': 'Action, Adventure',
      'description': 'Maverick returns to push the boundaries of flight.',
      'image': 'assets/images/top_gun.jpg',
    },
    {
      'title': 'Barbie',
      'year': '2023',
      'genre': 'Comedy, Romance',
      'description': 'A whimsical adventure in Barbie’s life.',
      'image': 'assets/images/barbie.jpg',
    },
    {
      'title': 'The Rings of Power',
      'year': '2022',
      'genre': 'Fantasy, Adventure',
      'description': 'Origins of the great rings and dark forces.',
      'image': 'assets/images/rings_of_power.jpg',
    },
    {
      'title': 'Smile',
      'year': '2022',
      'genre': 'Horror, Mystery',
      'description': 'A terrifying tale that begins with a smile.',
      'image': 'assets/images/smile.jpg',
    },
    {
      'title': 'Encanto',
      'year': '2021',
      'genre': 'Animation, Family',
      'description': 'A magical family learns about their gifts.',
      'image': 'assets/images/encanto.jpg',
    },
    {
      'title': 'Avatar: The Way of Water',
      'year': '2022',
      'genre': 'Sci-Fi, Adventure',
      'description': 'A return to Pandora with new oceanic adventures.',
      'image': 'assets/images/avatar2.jpg',
    },
    {
      'title': 'The Batman',
      'year': '2022',
      'genre': 'Action, Crime, Mystery',
      'description': 'A young Batman fights crime in Gotham City.',
      'image': 'assets/images/batman.jpg',
    },
    {
      'title': 'No Time to Die',
      'year': '2021',
      'genre': 'Action, Adventure, Thriller',
      'description': 'James Bond faces a new villain in his final mission.',
      'image': 'assets/images/no_time_to_die.jpg',
    },
    {
      'title': 'Black Panther: Wakanda Forever',
      'year': '2022',
      'genre': 'Action, Adventure, Fantasy',
      'description': 'The people of Wakanda fight to protect their home.',
      'image': 'assets/images/wakanda_forever.jpg',
    },
    {
      'title': 'Doctor Strange in the Multiverse of Madness',
      'year': '2022',
      'genre': 'Action, Fantasy, Horror',
      'description': 'Doctor Strange explores the multiverse of madness.',
      'image': 'assets/images/doctor_strange2.jpg',
    },
    {
      'title': 'Minions: The Rise of Gru',
      'year': '2022',
      'genre': 'Animation, Comedy, Family',
      'description': 'The untold story of a young Gru and his minions.',
      'image': 'assets/images/minions_rise_of_gru.jpg',
    },
    {
      'title': 'Thor: Love and Thunder',
      'year': '2022',
      'genre': 'Action, Adventure, Comedy',
      'description': 'Thor embarks on a journey of self-discovery.',
      'image': 'assets/images/thor_love_and_thunder.jpg',
    },
    {
      'title': 'Lightyear',
      'year': '2022',
      'genre': 'Animation, Action, Adventure',
      'description': 'The origin story of Buzz Lightyear, the space ranger.',
      'image': 'assets/images/lightyear.jpg',
    },
    {
      'title': 'Spider-Man: No Way Home',
      'year': '2021',
      'genre': 'Action, Adventure, Fantasy',
      'description': 'Spider-Man faces multiverse villains.',
      'image': 'assets/images/spider_man_no_way_home.jpg',
    },
    {
      'title': 'The Matrix Resurrections',
      'year': '2021',
      'genre': 'Sci-Fi, Action',
      'description': 'Neo returns to a new iteration of the Matrix.',
      'image': 'assets/images/matrix_resurrections.jpg',
    },
    {
      'title': 'The Flash',
      'year': '2023',
      'genre': 'Action, Adventure, Sci-Fi',
      'description': 'Barry Allen navigates timelines and the multiverse.',
      'image': 'assets/images/the_flash.jpg',
    },
    {
      'title': 'Guardians of the Galaxy Vol. 3',
      'year': '2023',
      'genre': 'Action, Sci-Fi, Comedy',
      'description': 'The Guardians face new cosmic adventures.',
      'image': 'assets/images/guardians_galaxy3.jpg',
    },
    {
      'title': 'John Wick: Chapter 4',
      'year': '2023',
      'genre': 'Action, Thriller',
      'description': 'John Wick faces his deadliest foes yet.',
      'image': 'assets/images/john_wick4.jpg',
    },
    {
      'title': 'The Super Mario Bros. Movie',
      'year': '2023',
      'genre': 'Animation, Adventure, Comedy',
      'description': 'Mario embarks on a journey through the Mushroom Kingdom.',
      'image': 'assets/images/super_mario_bros.jpg',
    },
    {
      'title': 'Puss in Boots: The Last Wish',
      'year': '2022',
      'genre': 'Animation, Adventure, Comedy',
      'description': 'Puss in Boots seeks the mythical Last Wish.',
      'image': 'assets/images/puss_in_boots_last_wish.jpg',
    },
    {
      'title': 'Jurassic World: Dominion',
      'year': '2022',
      'genre': 'Action, Adventure, Sci-Fi',
      'description': 'The dinosaurs have escaped into the world, and chaos reigns.',
      'image': 'assets/images/jurassic_world.jpg',
    },
    {
      'title': 'Everything Everywhere All at Once',
      'year': '2022',
      'genre': 'Action, Adventure, Comedy',
      'description': 'A woman discovers multiple realities and faces her greatest challenges.',
      'image': 'assets/images/everything_everywhere.jpg',
    },
    {
      'title': 'Shang-Chi and the Legend of the Ten Rings',
      'year': '2021',
      'genre': 'Action, Adventure, Fantasy',
      'description': 'Shang-Chi faces the secretive Ten Rings organization.',
      'image': 'assets/images/shang_chi.jpg',
    },
    {
      'title': 'Mission: Impossible - Fallout',
      'year': '2018',
      'genre': 'Action, Adventure, Thriller',
      'description': 'Ethan Hunt must prevent a global catastrophe while evading his own agency.',
      'image': 'assets/images/mission_impossible.jpg',
    },
    {
      'title': 'The Lion King',
      'year': '2019',
      'genre': 'Animation, Adventure, Drama',
      'description': 'A young lion prince must reclaim his throne after his father’s death.',
      'image': 'assets/images/lion_king.jpg',
    },
    {
      'title': 'Frozen II',
      'year': '2019',
      'genre': 'Animation, Adventure, Comedy',
      'description': 'Elsa and Anna journey into the unknown to discover the source of Elsa’s powers.',
      'image': 'assets/images/frozen_2.jpg',
    },
    {
      'title': 'The Suicide Squad',
      'year': '2021',
      'genre': 'Action, Adventure, Comedy',
      'description': 'A group of supervillains undertake a dangerous mission for the government.',
      'image': 'assets/images/suicide_squad.jpg',
    },
    {
      'title': 'Inception',
      'year': '2010',
      'genre': 'Action, Adventure, Sci-Fi',
      'description': 'A thief who enters the dreams of others to steal secrets is given a chance to have his criminal record erased.',
      'image': 'assets/images/inception.jpg',
    },
    {
      'title': 'The Avengers',
      'year': '2012',
      'genre': 'Action, Adventure, Sci-Fi',
      'description': 'Earth’s mightiest heroes must come together to stop Loki and his alien army.',
      'image': 'assets/images/avengers.jpg',
    },
    {
      'title': 'Guardians of the Galaxy',
      'year': '2014',
      'genre': 'Action, Adventure, Comedy',
      'description': 'A group of intergalactic criminals must pull together to stop a fanatical warrior.',
      'image': 'assets/images/guardians_of_the_galaxy.jpg',
    },
    {
      'title': 'Interstellar',
      'year': '2014',
      'genre': 'Adventure, Drama, Sci-Fi',
      'description': 'A team of explorers must travel beyond this galaxy to discover whether mankind has a future among the stars.',
      'image': 'assets/images/interstellar.jpg',
    },
    {
      'title': 'The Dark Knight Rises',
      'year': '2012',
      'genre': 'Action, Adventure',
      'description': 'Batman must come out of retirement to stop Bane, a terrorist who threatens Gotham.',
      'image': 'assets/images/dark_knight_rises.jpg',
    },
    {
      'title': 'Deadpool',
      'year': '2016',
      'genre': 'Action, Adventure, Comedy',
      'description': 'A former Special Forces operative turned mercenary seeks revenge on the man who nearly destroyed his life.',
      'image': 'assets/images/deadpool.jpg',
    },
    {
      'title': 'Mad Max: Fury Road',
      'year': '2015',
      'genre': 'Action, Adventure, Sci-Fi',
      'description': 'In a post-apocalyptic wasteland, Max teams up with Furiosa to escape a tyrannical warlord.',
      'image': 'assets/images/mad_max.jpg',
    },
    {
      'title': 'The Hunger Games',
      'year': '2012',
      'genre': 'Action, Adventure, Sci-Fi',
      'description': 'In a dystopian future, a young girl must compete in a televised battle to the death.',
      'image': 'assets/images/hunger_games.jpg',
    },
  ];


  late List<bool> likedMovies; // Declare the list of liked movies

  @override
  void initState() {
    super.initState();
    // Initialize likedMovies in initState, as movies is now available
    likedMovies = List.generate(movies.length, (_) => false);
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        backgroundColor: Colors.blueGrey, // Darker background for visibility
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MovieSearchDelegate(movies),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage, // Trigger image picking when tapped
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: _image == null
                          ? Icon(Icons.person, size: 40, color: Colors.blueGrey)
                          : ClipOval(
                        child: Image.file(
                          _image!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blueGrey),
              title: Text('Accueil', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.blueGrey),
              title: Text('Mon Profil', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calculate, color: Colors.blueGrey),
              title: Text('Mathematic Thémes', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.blueGrey),
              title: Text('Ma Position', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.storage, color: Colors.blueGrey),
              title: Text('Database', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blueGrey),
              title: Text('Settings', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.blueGrey),
              title: Text('Se Déconnecter', style: TextStyle(color: Colors.black)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Are you sure you want to disconnect?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Dismiss the dialog
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                // Image background
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    movie['image'] ?? '',
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image, size: 100, color: Colors.red);
                    },
                  ),
                ),
                // Title and description overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie['title'] ?? '',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Year: ${movie['year']}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          'Genre: ${movie['genre']}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          movie['description'] ?? '',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                // Heart icon for liking the movie
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(
                      likedMovies[index] ? Icons.favorite : Icons.favorite_border,
                      color: likedMovies[index] ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        likedMovies[index] = !likedMovies[index]; // Toggle the liked state
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MovieSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> movies;

  MovieSearchDelegate(this.movies);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = movies
        .where((movie) =>
        movie['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final movie = results[index];
        return ListTile(
          title: Text(movie['title']!),
          subtitle: Text(movie['genre']!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = movies
        .where((movie) =>
        movie['title']!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final movie = suggestions[index];
        return ListTile(
          title: Text(movie['title']!),
          subtitle: Text(movie['genre']!),
        );
      },
    );
  }
}