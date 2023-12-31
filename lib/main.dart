import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'src/widgets/restaurantcard.dart';
import 'src/widgets/restaurantgrid.dart';

void main() {
  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Miam',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
            onBackground: Colors.cyan, onSecondary: Colors.black38),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

//
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//
class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0; // variable en rapport avec les icone de la nav

  @override
  Widget build(BuildContext context) {
    // var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const MainPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      // backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // the container of the current page and its bgColor
          var mainArea = ColoredBox(
            color: Colors.transparent,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: page,
            ),
          );
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search_outlined),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.login_sharp),
                        label: 'Login',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.verified_user_outlined),
                        label: 'Sign Up',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.search_outlined),
                        label: Text('Search'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.login_sharp),
                        label: Text('Login'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.verified_user_outlined),
                        label: Text('Sign Up'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // On enlève le titre par défaut de l'appBar
        title: const SizedBox.shrink(),
        // On met la hauteur de l'appBar à 200.0
        toolbarHeight: 300.0,
        // On met le fond de l'appBar à transparent
        backgroundColor: Colors.transparent,
        // On met le contenu de l'appBar à notre Stack avec l'image et le texte
        flexibleSpace: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(
                'assets/images/plats_petit.jpg',
                fit: BoxFit.cover,
                // fit: BoxFit.cover,
                height: 300.0,
                width: double
                    .infinity, // On met la largeur de l'image à l'infini pour qu'elle occupe toute la largeur de l'écran
              ),
            ),
            Positioned(
              bottom: 100.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  // On centre le texte dans le Container
                  child: Text(
                    'Meet me at *Eat is bae 🤍*',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Ici, vous pouvez mettre votre vidéo ou autre contenu'),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // Le widget Column pour afficher les deux widgets
            children: [
              ImageSlideshow(
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                height: 300.0,
                width: double.infinity,
                initialPage: 0,
                onPageChanged: (value) {
                  debugPrint('Page changed: $value');
                },
                autoPlayInterval: 3000,
                isLoop: true, //La page initiale à afficher
                children: [
                  Image.asset(
                    'images/slide1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/slide2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/slide3.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/hamburger_banner.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const RestaurantGrid(
                  // Le widget RestaurantGrid pour afficher la grille de cartes de mets
                  // Les propriétés de la grille de cartes de mets

                  ),
            ],
          ),
        ),
      ),
    );
  }
}
