import 'package:flutter/material.dart';

void main() {
  runApp(MuseumApp());
}

class MuseumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
        primaryColor: Colors.brown, // Couleur primaire de votre choix (ex: Brown)
      ),
      home: Artwork(),
    );
  }
}

class Artwork extends StatefulWidget {
  @override
  _ArtworkState createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Museum'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Mona_Lisa.jpg'),
            Text(
              'Mona Lisa',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 30,
                color: Colors.brown,
              ),
            ),
            Text(
              'Léonard De Vinci',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            Container(
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.75),
    shape: BoxShape.circle,
  ),
  child: Opacity(
    opacity: _isFavorite ? 1.0 : 0.75, // Utilisez Opacity pour définir l'opacité
    child: Icon(
      _isFavorite ? Icons.favorite : Icons.favorite_border,
      size: 100,
      color: _isFavorite ? Colors.red : Colors.white,
    ),
  ),
),
            IconButton(
              icon: Icon(Icons.article),
              onPressed: () {
                setState(() {
                  _showDescription = !_showDescription;
                });
              },
            ),
            if (_showDescription)
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    // Texte de description à afficher/masquer
                    'La Joconde, ou Portrait de Mona Lisa, est un tableau de l\'artiste Léonard de Vinci...',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 15,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isFavorite = !_isFavorite;
            if (_isFavorite) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Oeuvre ajoutée à vos favoris'),
                ),
              );
            }
          });
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
