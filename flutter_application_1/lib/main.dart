import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/playlist.dart';
import 'package:flutter_application_1/widgets/Cancion.dart';
import 'package:flutter_application_1/widgets/tarjetasp.dart';
import 'package:flutter_application_1/widgets/tarjetasg.dart';
import 'package:flutter_application_1/widgets/tarjeambum.dart';
import 'package:flutter_application_1/widgets/artist_item.dart';
import 'package:flutter_application_1/widgets/playlist_item.dart';
import 'package:flutter_application_1/widgets/radio_card.dart';
import 'package:flutter_application_1/widgets/CustomCard2.dart';
import 'package:flutter_application_1/widgets/EstacionesCard.dart';
import 'package:flutter_application_1/widgets/DescubreCard.dart';
import 'package:flutter_application_1/widgets/mini_player.dart';
import 'package:flutter_application_1/widgets/music_card.dart';
import 'package:flutter_application_1/widgets/album_card.dart';
import 'package:flutter_application_1/widgets/section_title.dart';
import 'package:flutter_application_1/widgets/featured_playlist_card.dart';
import 'package:flutter_application_1/widgets/filter_chip_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: _buildAppBar(),
      body: ListView( // CAMBIADO DE SingleChildScrollView a ListView
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: [
          const SizedBox(height: 7),
          _buildPlaylistRow(),
          const SizedBox(height: 12),
          _buildSecondPlaylistRow(),
          const SizedBox(height: 15),
          _buildPodcastHeader(),
          _buildHeroImage(),
          const SizedBox(height: 15),
          _buildSectionHeader("Tus favoritos del momento"),
          const SizedBox(height: 15),
          _buildFavoriteSongs(),
          const SizedBox(height: 15),
          _buildSectionHeader("Recientes"),
          const SizedBox(height: 15),
          _buildRecentList(),
          const SizedBox(height: 15),
          _buildSectionHeader("Tus mixes más escuchados"),
          const SizedBox(height: 15),
          _buildMixesList(),
          const SizedBox(height: 15),
          _buildSectionHeader("Álbumes con canciones que te gustan"),
          const SizedBox(height: 5),
          _buildAlbumsList(),
          const SizedBox(height: 15),
          _buildArtistSection(),
          _buildNewContent(),
          _buildNewSection(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music_outlined),
              label: 'Tu biblioteca',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Premium',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Crear',
            ),
          ],
        ),
      ),
      bottomSheet: const MiniPlayer(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: const NetworkImage(
                  "https://i.pinimg.com/736x/85/cb/7c/85cb7cf2f711d4666711cfe02093cf5c.jpg",
                ),
              ),
              const SizedBox(width: 12),
              Row(
                children: [
                  _buildFilterChip("Todas", isSelected: true),
                  const SizedBox(width: 10),
                  _buildFilterChip("Música"),
                  const SizedBox(width: 10),
                  _buildFilterChip("Podcasts"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1ED760) : const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPlaylistRow() {
    return Row(
      children: const [
        Expanded(
          child: PlaylistCard(
            title: "Tus me gusta",
            imageUrl: "https://misc.scdn.co/liked-songs/liked-songs-300.png",
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: PlaylistCard(
            title: "Ando Pensando",
            imageUrl:
                "https://i.pinimg.com/736x/ff/4d/f4/ff4df43da2631d1690c6a21eb809c70b.jpg",
          ),
        ),
      ],
    );
  }

  Widget _buildSecondPlaylistRow() {
    return Row(
      children: const [
        Expanded(
          child: PlaylistCard(
            title: "Elfen Lied Opening",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaACgup4QQV-VerYbDfHhb_we0tDBIt_NQ7Q&s",
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: PlaylistCard(
            title: "Winter Aid",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-9S8uqTztsNh0YO7hUH1dK5gQ-ACIBLcUvx6K8WT6ybBP0zs&s",
          ),
        ),
      ],
    );
  }

  Widget _buildPodcastHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 40,
              height: 40,
              color: Colors.grey[800],
              child: Image.network(
                'https://d3t3ozftmdmh3i.cloudfront.net/staging/podcast_uploaded_nologo400/36490516/36490516-1762297763565-857c906d2a4e6.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image, color: Colors.white54);
                },
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "Vivir de malgenio",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(Icons.more_vert, color: Color.fromARGB(255, 117, 117, 117)),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Stack(
        children: [
          Image.network(
            'https://image-cdn-fa.spotifycdn.com/image/ab6772ab000015bec379e3dd616f22b05c413e34',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[800],
                child: const Center(
                  child: Icon(Icons.broken_image,
                      color: Color.fromARGB(136, 236, 232, 232)),
                ),
              );
            },
          ),
          Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_circle_filled,
                color: Color.fromARGB(255, 121, 121, 121),
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFavoriteSongs() {
    return Column(
      children: const [
        Cancion(
          title: "The Winner",
          subtitle: "DeVotchKa,Mychael Danna",
          imageUrl:
              "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/c5/4e/41/c54e410d-afe5-7af6-d92b-75d47a405a81/780163610727.jpg/3000x3000bb.jpg",
        ),
        SizedBox(height: 10),
        Cancion(
          title: "Luciérnagas",
          subtitle: "Milo j,Silvio Rodríguez",
          imageUrl:
              "https://images.genius.com/fe128d84e310c799d66461fe6077b43c.1000x1000x1.png",
        ),
        SizedBox(height: 10),
        Cancion(
          title: "Like Him(feat.Lola Young)",
          subtitle: "E Tyler,The Creator,Lola Young",
          imageUrl:
              "https://images.genius.com/206f16145c6ad42142656b0a53a0638f.1000x1000x1.png",
        ),
      ],
    );
  }

  Widget _buildRecentList() {
    return SizedBox(
      height: 195,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RecienteCard(
            imageUrl:
                "https://i.pinimg.com/736x/ff/4d/f4/ff4df43da2631d1690c6a21eb809c70b.jpg",
            title: "Ando Pensando",
            subtitle: "Playlist • Ale",
          ),
          RecienteCard(
            imageUrl:
                "https://i.scdn.co/image/ab6761610000e5eb70a59ced259c32548bc022aa",
            title: "Winter Aid",
            subtitle: "Artista",
          ),
          RecienteCard(
            imageUrl: "https://misc.scdn.co/liked-songs/liked-songs-300.png",
            title: "Cancines que te gustan",
            subtitle: "Lista • Spotify",
          ),
          RecienteCard(
            imageUrl:
                "https://i.scdn.co/image/ab67616d0000b27341783ba2eae5cf3aa3dabd5d",
            title: "Cantándole al Amor",
            subtitle: "Álbum • Frankie Ruiz",
          ),
          RecienteCard(
            imageUrl: "https://f4.bcbits.com/img/a1434033690_10.jpg",
            title: "istrumentals",
            subtitle: "Álbum • Adrianne",
          ),
          RecienteCard(
            imageUrl:
                "https://i.scdn.co/image/ab67616d00001e02ee19fd6547530358e9334553",
            title: "Anime Piano",
            subtitle: "Álbum • Mikasanai",
          ),
          RecienteCard(
            imageUrl:
                "https://cdn-images.dzcdn.net/images/artist/96b688020014a21cb80a0268b90287f5/1900x1900-000000-80-0-0.jpg",
            title: "Radiohead",
            subtitle: "Artista",
          ),
          RecienteCard(
            imageUrl:
                "https://i.scdn.co/image/ab67616d0000b2732acd7a42840de586c30986c5",
            title: "Colde",
            subtitle: "Artista",
          ),
          RecienteCard(
            imageUrl:
                "https://cdn-images.dzcdn.net/images/cover/4435d836a439cada70b6e968ca498320/500x500.jpg",
            title: "The Cranberries",
            subtitle: "Álbum • Gold",
          ),
          RecienteCard(
            imageUrl:
                "https://static.wikia.nocookie.net/epicthemusical/images/3/3e/Epic_The_Musical_Album_Cover.png/revision/latest?cb=20241230083621",
            title: "Cast of EPIC",
            subtitle: "Álbum • Epic",
          ),
        ],
      ),
    );
  }

  Widget _buildMixesList() {
    return SizedBox(
      height: 195,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RecienteCardG(
            imageUrl:
                "https://storage.googleapis.com/pr-newsroom-wp/1/2021/08/pop-up.jpg",
            subtitle: "Billie Eilish,Olivia Rodrigo,Taylor Swift",
          ),
          RecienteCardG(
            imageUrl:
                "https://i.scdn.co/image/ab6761610000e5eb3d8820046fd455b38d644864",
            subtitle: "TWICE,NewJeans,TXT",
          ),
          RecienteCardG(
            imageUrl:
                "https://i.scdn.co/image/ab6761610000e5eba91405d63c939682e4efdcbc",
            subtitle: "Canserbero,Porta,Nanpa Básico",
          ),
          RecienteCardG(
            imageUrl:
                "https://i.scdn.co/image/ab6761610000e5eb0c387e6ddb399d55a8e51341",
            subtitle: "JoseJose,Juan Gabriel,Rocío Dúrcal",
          ),
          RecienteCardG(
            imageUrl:
                "https://i.scdn.co/image/ab67616100005174a00b11c129b27a88fc72f36b",
            subtitle: "Eminem,Kendrick Lamar,Trueno",
          ),
          RecienteCardG(
            imageUrl:
                "https://static.wikia.nocookie.net/thebeatles/images/b/be/The_Beatles_1_album_cover.jpg/revision/latest?cb=20090906175917&path-prefix=es",
            subtitle: "The Beatles,Green Day,Queen",
          ),
          RecienteCardG(
            imageUrl:
                "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da84453a2b5ac11479070cc4b2a0",
            subtitle: "Marc Anthony,Frankie Ruiz,Willie Colón",
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumsList() {
    return SizedBox(
      height: 195,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RecienteCardG2(
            imageUrl: "https://f4.bcbits.com/img/a1434033690_10.jpg",
            title: "instrimentals",
            subtitle: "Adrianne Lenker",
          ),
          RecienteCardG2(
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOqOGWRNW5lJLe3nTXwZOK0rUEfnypyOZ-Lg&s",
            title: "Demos Slayer Infinity",
            subtitle: "James Liam Figueroa",
          ),
          RecienteCardG2(
            imageUrl:
                "https://i.scdn.co/image/ab67616d00001e02e1bcabfda30a6ec181f8eada",
            title: "boy flower",
            subtitle: "Varios Artistas",
          ),
          RecienteCardG2(
            imageUrl:
                "https://i.scdn.co/image/ab67616d0000b273653b110d9560eb1656f4c583",
            title: "Ten Summoner´s Tales",
            subtitle: "Sting",
          ),
          RecienteCardG2(
            imageUrl:
                "https://i.scdn.co/image/ab67616d0000b2732f3552dc6f9e4e2748c5b8ba",
            title: "Either/Or",
            subtitle: "Ellliott Smith",
          ),
          RecienteCardG2(
            imageUrl:
                "https://i.scdn.co/image/ab67616d0000b2736c6cbd73d1383f675a64ae87",
            title: "My Lovely Sam Soon",
            subtitle: "Varios Artistas",
          ),
        ],
      ),
    );
  }

  Widget _buildArtistSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Text(
            "Tus artistas favoritos",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 195,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ArtistItem(
                  name: "Julieta Venegas",
                  imageUrl:
                      "https://i.scdn.co/image/ab6761610000517419668bfd2d3ba192ca3a4944",
                ),
                const SizedBox(width: 25),
                ArtistItem(
                  name: "Joji",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbUJVluQcc78sLeg3ahGHlIYz2E6eRM0Mwng&s",
                ),
                const SizedBox(width: 25),
                ArtistItem(
                  name: "Metallica",
                  imageUrl:
                      "https://www.alianzaeditorial.es/imagenes/libros/grande/9791370091101-metallica.jpg",
                ),
                const SizedBox(width: 25),
                ArtistItem(
                  name: "Taylor Swift",
                  imageUrl:
                      "https://akamai.sscdn.co/tb/letras-blog/wp-content/uploads/2023/07/187c13d-fearless-album.jpg",
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Soundtrack your Saturday \nmorning",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "",
                  subtitle: "Tu día en una playlist.",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE_uEmzZKf1mOIOvSn6f77EMZL5T5XQEod_g&s",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "Lonely music for you. Also try k-pop, easy list.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/7yFjPJXMCeM6Ja49tqC1zN/en",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Las canciones que no sabías que amabas.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/5d1QhK9Q1y4lK6NNXtUBWv/en",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Fe y flow en una sola playlist.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/3ZuD9MviDzgDCnAo6900ik/en",
                ),
              ],
            ),
          ),
          const Text(
            "Similares a Winter Aid",
            style: TextStyle(
              color: Color.fromARGB(255, 146, 146, 146),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const RadioCard(
            imageUrl:
                "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/15S89CUJtshT2P7WIa2M5l/es-419",
          ),
          const SizedBox(height: 30),
          const Text(
            "Hecho para Ale",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "Mix diario 1",
                  subtitle: "Mikasanai, Shiro SAGISU, Tifita y más",
                  imageUrl:
                      "https://pbs.twimg.com/media/GJbNqMTaMAAJwLu.jpg",
                  labelColor: Color(0xFF1DB954),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "Mix diario 2",
                  subtitle:
                      "Eric Christian, Prestige Magic, Alexander Perv...",
                  imageUrl:
                      "https://i.scdn.co/image/ab67616100005174a8955dccb75967e5b54a566b",
                  labelColor: Color(0xFFFFEB3B),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "Mix diario 3",
                  subtitle: "Indie sad vibes, bedroom pop y nostalgia",
                  imageUrl:
                      "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f",
                  labelColor: Color(0xFF03A9F4),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "Mix diario 4",
                  subtitle:
                      "Rock alternativo, guitarras intensas y energía",
                  imageUrl:
                      "https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2",
                  labelColor: Color(0xFFFF5722),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "Mix diario 5",
                  subtitle: "Electropop nocturno y beats suaves",
                  imageUrl:
                      "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4",
                  labelColor: Color(0xFF9C27B0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  "https://cdn-images.dzcdn.net/images/cover/a69b4d07ee26929f7e3ea257a8f3f676/0x1900-000000-80-0-0.jpg",
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Similares a",
                    style: TextStyle(
                      color: Color.fromARGB(255, 146, 146, 146),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Ando Pensando",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "",
                  subtitle: "Coldplay, sombr, Harry Styles, Djo, Lorde",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002b063c3c335a223fabbf31590",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Joji, my head is empty, Instupendo, Grouper",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002293c42e477b4dd92bc3a1077",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Indie sad vibes y dream pop",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f000000023df638bf5c33922ceb4c185a",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "Indie sad vibes, late nights y pensamientos suaves",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/2I1AlDwW21JwVjt4lVlajL/es-419",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Bedroom pop, melancolía y atmósferas oscuras",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002aea1d5c18c857d2be92790fb",
                ),
              ],
            ),
          ),
          const Text(
            "Basado en lo último que \nescuchaste",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "",
                  subtitle: "Radiohead, Twenty One Pilots, Gorillaz, Oasis",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002f5ddeab58c1c4b3d0e1bd86b",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Eminem, Linkin Park, Coldplay, Maroon 5",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f0000000293d515811aef400a9a684a7e",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Arctic Monkeys, The Strokes, The Killers",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/7Ln80lUS6He07XvHI8qqHH/ar",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "The 1975, Tame Impala, Clairo, Wallows",
                  imageUrl:
                      "https://i.scdn.co/image/ab67616d0000b273cf33712de0f574ef1534e160",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Paramore, Muse, Evanescence, Green Day",
                  imageUrl:
                      "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da8499bc2abcb0cf7aae605e7ee9",
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://i.scdn.co/image/ab6761610000e5eb0c387e6ddb399d55a8e51341",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Similares a",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  Text(
                    "José José",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "",
                  subtitle:
                      "This is: José José. Sus mejores éxitos de todos los tiempos.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/4mN0qcMxWX8oToqfDPM5yV/en",
                  labelColor: Color(0xFFB388FF),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Playlist \nLuis Miguel, Josè Jose",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002c6468180fbb44f8a4bb8c41d",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Baladas románticas clásicas",
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8y7YpcGsda50yArcLAtF22NZnRKwC4lh-LQ&s",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Amor y despecho latino",
                  imageUrl:
                      "https://i.scdn.co/image/ab67616d0000b27338586cffa75f1205c6ca4ac5",
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Clásicos de los 70s y 80s",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002ad5378ef4192257d82676b7f",
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Lo mejor de los artistas",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "",
                  subtitle:
                      "This is: José José. Sus mejores éxitos, todos en un solo lugar.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/4mN0qcMxWX8oToqfDPM5yV/ar",
                  labelColor: Color(0xFF1DB954),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "This is: Canserbero. Sus mejores éxitos, clásicos imprescindibles y letras que marcaron época.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/1wGIhYkKWSq4yACtTkCkSX/ar",
                  labelColor: Color(0xFFFFC107),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "This is: Luis Miguel. Baladas eternas, grandes clásicos y su voz inconfundible.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/2nszmSgqreHSdJA3zWPyrW/ar",
                  labelColor: Color(0xFF8BC34A),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "This is: Rocío Dúrcal. Romanticismo puro, rancheras inolvidables y éxitos legendarios.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/2uyweLa0mvPZH6eRzDddeB/ar",
                  labelColor: Color(0xFF03A9F4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Sugerencias para hoy",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "",
                  subtitle: "Sencillo \nBeanie \nChezile ",
                  imageUrl:
                      "https://i.scdn.co/image/ab67616d0000b2739d181176cafa856a3c8b5537",
                  labelColor: Color(0xFF1DB954),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Sencillo \nMystery of Love  ",
                  imageUrl:
                      "https://i.scdn.co/image/ab67616d0000b2733fc1588803d1887f11d660cc",
                  labelColor: Color(0xFFFFC107),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Àlbum \nCry \nCigarettes ",
                  imageUrl:
                      "https://i.scdn.co/image/ab67616d0000b273fd275af89cec73d6287f9cbf",
                  labelColor: Color(0xFF8BC34A),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "Playlist \nNostalgico",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f000000020d2f4bb578ff5be2fa18997b",
                  labelColor: Color(0xFF03A9F4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Màs de lo que te gusta",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "",
                  subtitle: "Mrs. GREEN APPLE, YOASOBI,",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002c33ce03b239d4d1f60f935d3",
                  labelColor: Color(0xFF1DB954),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle: "ZXKAI, MXZI, Nakama, DJ Asul, QMIIR",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f0000000271ff720f409999d89f09a8e4",
                  labelColor: Color(0xFFFFC107),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "This is: Luis Miguel. Baladas eternas, grandes clásicos y su voz inconfundible.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/2nszmSgqreHSdJA3zWPyrW/ar",
                  labelColor: Color(0xFF8BC34A),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "This is: Rocío Dúrcal. Romanticismo puro, rancheras inolvidables y éxitos legendarios.",
                  imageUrl:
                      "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/2uyweLa0mvPZH6eRzDddeB/ar",
                  labelColor: Color(0xFF03A9F4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            "Vistazo al pasado",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PlaylistItem(
                  title: "",
                  subtitle:
                      "Drake, Ariana Grande, Billie Eilish, Zara Larsso..",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002e0e14ab9c50ecc48b2d66808",
                  labelColor: Color(0xFF1DB954),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "bruno Mars, Rihanna, Billie Eilish, Lana del Re...",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002f956f931f3f83d5316bda8be",
                  labelColor: Color(0xFFFFC107),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "Rewind and rediscover big songs of 2019. Cover...",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002a3669c6becfa7c726dc6e61e",
                  labelColor: Color(0xFF8BC34A),
                ),
                SizedBox(width: 20),
                PlaylistItem(
                  title: "",
                  subtitle:
                      "Rewind and rediscover big songs of 2019. Cover...",
                  imageUrl:
                      "https://i.scdn.co/image/ab67706f00000002f5f2a36c4c0367c678cf2385",
                  labelColor: Color(0xFF03A9F4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewContent() {
    return Column(
      children: [
        MusicCard(
          title: "Mix de los 80",
          subtitle: "Spotify",
          image:
              "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/3PhoLpVuITZKcymswpck5b/es-419",
          songsCount: "50",
          description: "Elton John, Michael Jackson y más",
          color: const Color.fromARGB(255, 71, 78, 119),
        ),
        const SizedBox(height: 30),
        const Text(
          "Estaciones recomendadas",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/52Bg6oaos7twR7IUtEpqcE/en",
                title: "The Smiths, Elliot Smith, The Velvet Und..",
              ),
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/3VQDqjQ4wJyw8PzpGdlZpB/es-419",
                title: "BIBI, DEAN, Colde, junggigo,offonoff",
              ),
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/5Mc6124m8waYCvdYLyM8CY/en",
                title: "Leon Leiden, Juliana, Vale Garzón, Ariza, Lau...",
              ),
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/0XK6kT7xcZAlcYrNjOgzJe/en",
                title: "Julieta Venegas, Kany García, Bunbury, Carla...",
              ),
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/0p4nmQO2msCgU4IF37Wi3j/es-419",
                title: "Katy Perry, Britney Spears, Fall Out Boy, A...",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://cdn-images.dzcdn.net/images/artist/fe9eb4463ea87452e84ed97e0c86b878/1900x1900-000000-80-0-0.jpg"),
            ),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Para los fanáticos de",
                  style: TextStyle(color: Colors.white54, fontSize: 13),
                ),
                SizedBox(height: 5),
                Text(
                  "The Beatles",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/3WrFJ7ztbogyGnTHbHJFl2/es-419",
                title: "This is: The Beatles. Sus mejores éxitos, todos e...",
              ),
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/3WrFJ7ztbogyGnTHbHJFl2/de",
                title: "The Beatles, The Doors, Van Morrison, Yusuf/C...",
              ),
              EstacionesCard(
                image:
                    "https://i.scdn.co/image/ab67616d0000b273e3e3b64cea45265469d4cafa",
                title: "Yesterday - Remastered 2009...The Beatles. Help! (Remastered)",
              ),
              EstacionesCard(
                image:
                    "https://cdn-images.dzcdn.net/images/cover/fcf05300b7c17ec77a6d01028a4bef61/1900x1900-000000-80-0-0.jpg",
                title: "Let It Be - Remastered 2009...The Beatles Let It Be (Remastered)",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Descubre las secciones para ti",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              DescubreCard(
                image:
                    "https://i.scdn.co/image/ab67616d00001e02ac8433ff4ff43cc1c152e96e",
                category: "Sencillo",
                title: "Mia & Sebastian's Theme",
                subtitle: "Mia Angelova",
              ),
              DescubreCard(
                image:
                    "https://i.scdn.co/image/ab67616d00001e02cc2ac833837b8fc5d9ea457d",
                category: "sencillo",
                title: "Moonlight Sonata",
                subtitle: "Jairos, Rinblade, luneria",
              ),
              DescubreCard(
                image:
                    "https://http2.mlstatic.com/D_NQ_NP_810808-MLA88412101581_072025-O.webp",
                category: "Album",
                title: "Álbum Fijación Oral Volumen 1 (Expanded Edition)",
                subtitle: "Shakira",
              ),
              DescubreCard(
                image:
                    "https://i.scdn.co/image/ab67616d0000b27358476875bb86ae6b610c4b23",
                category: "Album",
                title: "Duelo",
                subtitle: "Nampa Basico",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://i.scdn.co/image/ab6761610000e5eb26e59b825251b7df20a7b65e"),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Porque escuchas",
                  style: TextStyle(color: Colors.white54, fontSize: 13),
                ),
                SizedBox(height: 5),
                Text(
                  "Britney Spears",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/26dSoYclwsYLMAKD3tpOr4/es-419",
                title: "This is: Britney Spears.Sus mejores éxitos, tod...",
              ),
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/26dSoYclwsYLMAKD3tpOr4/es-419",
                title: "Beyoncé, Britney Spears, Justin Timberl...",
              ),
              EstacionesCard(
                image:
                    "https://images.genius.com/7b97f35bf99f77075ec5ba7a4f6b6dbb.1000x1000x1.jpg",
                title: "Oops!...I Did It Again Britney Spears Oops!... I Did It Again",
              ),
              EstacionesCard(
                image:
                    "https://i.scdn.co/image/ab67616d0000b273d02344f5f66245ed15d78005",
                title: "Toxic Britney Spears. In The Zone",
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        MusicCard(
          title: "Indie that hits different",
          subtitle: "Spotify",
          image:
              "https://i.scdn.co/image/ab67706f000000025d7328091fcfe8b8afab235e",
          songsCount: "100",
          description:
              "Radiohead, Arctic Monkeys, The Neighbourhood, Twenty one Pilots, Joji",
          color: const Color.fromARGB(255, 51, 44, 12),
        ),
        const SizedBox(height: 30),
        Row(
          children: const [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://i.scdn.co/image/fc4e0f474fb4c4cb83617aa884dc9fd9822d4411"),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Para los fans de",
                  style: TextStyle(color: Colors.white54, fontSize: 13),
                ),
                SizedBox(height: 5),
                Text(
                  "Frank Sinatra",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/1Mxqyy3pSjf8kZZL4QVxS0/ar",
                title: "This is: Frank Sinatra. Sus mejores éxitos, tod..",
              ),
              EstacionesCard(
                image:
                    "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/1Mxqyy3pSjf8kZZL4QVxS0/ar",
                title: "Frank Sinatra, Antônio Carlos Jobim, Natalie ...",
              ),
              EstacionesCard(
                image:
                    "https://i.scdn.co/image/ab67616d0000b2739cd3aa4e6b2f3e792e2158df",
                title: "The World We Knew (Over And Over)",
              ),
              EstacionesCard(
                image:
                    "https://udiscovermusic.co/cdn/shop/products/602577959318_-_VINILO_-_Frank_Sinatra_-_My_Way_A.png?v=1639751865",
                title: "My Way Frank Sinatra My Way (Expanded Edition)",
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildNewSection() {
    return Column(
      children: [
        const SectionTitle(title: 'Los éxitos del momento'),
        SizedBox(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            children: const [
              Music_Card(
                imageUrl:
                    'https://i.scdn.co/image/ab67706f00000002ce3e4d2cf82be0252be48478',
                artists: 'Taylor Swift, The Weeknd, Billie Eilish...',
              ),
              Music_Card(
                imageUrl:
                    'https://i.scdn.co/image/ab67706f0000000242c3695ce5ff7694af7dd401',
                artists: 'Bruno Mars, Olivia Dean, Dua Lipa...',
              ),
              Music_Card(
                imageUrl:
                    'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da849f337880ee28e7386f3f29df',
                artists: 'Feid, Karol G, J Balvin, Maluma...',
              ),
              Music_Card(
                imageUrl:
                    'https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/daily/1/ab6761610000e5ebb99cacf8acd5378206767261/en',
                artists: 'Bad Bunny, Rauw Alejandro, Tainy...',
              ),
              Music_Card(
                imageUrl:
                    'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da84b48f2275d5a6f20aca3d2fd6',
                artists: 'Ryan Castro, Blessd, Cris Mj...',
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        const SectionTitle(title: 'Creado para ti', isSubtitle: true),
        const FeaturedPlaylistCard(
          title: 'Mix Música clásica',
          subtitle: 'Spotify',
          imageUrl:
              'https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/artistmix/5tDoOlNPGcOTz1qo0xLa12/en',
          details:
              'Sergei Prokofiev, Niccolò Paganini, Samuel Barber y más',
          songCount: '50 canciones',
          buttonText: 'Obtener avance de la pla',
          backgroundColor: Color.fromARGB(255, 60, 48, 82),
        ),

        const SizedBox(height: 12),

        const SectionTitle(title: 'Creado para ti', isSubtitle: true),
        const FeaturedPlaylistCard(
          title: 'Mix K-pop',
          subtitle: 'Spotify',
          imageUrl:
              'https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/topic/k_pop/2F4oTJOWkcD1JaTeKEa9h6/en',
          details: 'TWICE, MOMOLAND, Charlie Puth y más',
          songCount: '50 canciones',
          buttonText: 'Obtener avance de la pla',
          backgroundColor: Color(0xFF23353F),
        ),

        const SizedBox(height: 12),
        const SectionTitle(
          title: 'Similares a Winter Aid',
          isSubtitle: true,
        ),
        const FeaturedPlaylistCard(
          title: 'Novo Amor',
          subtitle: 'Birthplace • 2018',
          imageUrl:
              'https://i.scdn.co/image/ab67616d0000b273277620423172f5a151f452e3',
          details:
              'Emigrate • Birthplace • Utican • Seneca • Anniversary...',
          songCount: '10 canciones',
          buttonText: 'Obtener avance del álbu',
          backgroundColor: Color(0xFF423E3B),
        ),

        const SizedBox(height: 20),
        const SectionTitle(title: 'Estaciones populares'),
        SizedBox(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            children: const [
              Music_Card(
                imageUrl:
                    'https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/4q3ewBCX7sLwd24euuV69X/de',
                artists: 'Bad Bunny, Ozuna, Arcángel...',
              ),
              Music_Card(
                imageUrl:
                    'https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/33ScadVnbm2X8kkUqOkC6Z/de',
                artists: 'Don Omar, Wisin & Yandel...',
              ),
              Music_Card(
                imageUrl:
                    'https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/19HM5j0ULGSmEoRcrSe5x3/en',
                artists: 'Milo J, Eladio Carrión, Duki...',
              ),
              Music_Card(
                imageUrl:
                    'https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/7Ln80lUS6He07XvHI8qqHH/de',
                artists: 'Artic Monkeys, Tame Impala, MGMT...',
              ),
              Music_Card(
                imageUrl:
                    'https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/artist/4tZwfgrHOc3mvqYlEYSvVi/de',
                artists: 'Daft Punk, Justice, Kaytranada...',
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        const SectionTitle(
          title: 'Similares a Ando pensando',
          isSubtitle: true,
        ),
        const FeaturedPlaylistCard(
          title: 'sexy indie',
          subtitle: 'Spotify',
          imageUrl:
              'https://mosaic.scdn.co/640/ab67616d00001e020b4f0565f8a790f5105aeb1cab67616d00001e023782d9f9058ef3cc963c09ccab67616d00001e02849edb4561651e816d0106baab67616d00001e028f5567f5c20e8d5882c37afa',
          details:
              'Lana Del Rey, sombr, Steve Lacy, Mazzy Star, Chezile',
          songCount: '50 canciones',
          buttonText: 'Obtener avance de la pla',
          backgroundColor: Color(0xFF6B1D16),
        ),

        const SizedBox(height: 20),
        const SectionTitle(title: 'Álbumes y sencillos populares'),
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            children: const [
              AlbumCard(
                imageUrl:
                    'https://i.scdn.co/image/ab67616d0000b27367c50956a96fa2c1aae367e4',
                title: 'Fórmula, Vol. 2 (Deluxe Edition)',
                type: 'Álbum',
                artist: 'Romeo Santos',
              ),
              AlbumCard(
                imageUrl:
                    'https://i.scdn.co/image/ab67706f0000000295c94a38840f54b062b8739d',
                title: 'Un Verano Sin Ti',
                type: 'Álbum',
                artist: 'Bad Bunny',
              ),
              AlbumCard(
                imageUrl:
                    'https://i.scdn.co/image/ab67616d00001e0258a5514e00fdaa0bf56bd848',
                title: 'MAÑANA SERÁ BONITO',
                type: 'Álbum',
                artist: 'Karol G',
              ),
              AlbumCard(
                imageUrl:
                    'https://i.scdn.co/image/ab67616d00001e02904445d70d04eb24d6bb79ac',
                title: 'The Tortured Poets Department',
                type: 'Álbum',
                artist: 'Taylor Swift',
              ),
              AlbumCard(
                imageUrl:
                    'https://i.scdn.co/image/ab67616d00001e020acf7f2eefe5bd36efbc26b4',
                title: 'AM',
                type: 'Álbum',
                artist: 'Arctic Monkeys',
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}