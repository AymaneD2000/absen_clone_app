import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/Screens/ManageProduct.dart';
import 'package:absens_clone_app/Screens/ManageSendingBox.dart';
import 'package:absens_clone_app/helper/helper.dart';
import 'package:absens_clone_app/helper/provider.dart';
import 'package:absens_clone_app/widgets/displayConfigurationParameter.dart';
import 'package:absens_clone_app/widgets/mainDataCableCalculation.dart';
import 'package:absens_clone_app/widgets/productInformation.dart';
import 'package:absens_clone_app/widgets/texte.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MyProvider())],
    child: Provider.value(
      value: adState,
      builder: (context, child) => const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Application',
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Utilisation d'une couleur principale
        hintColor: Colors
            .greenAccent, // Couleur d'accentuation pour les éléments interactifs
        fontFamily:
            'Roboto', // Utilisation d'une police de caractères cohérente
      ),
      home: const MyHomePage(title: 'Page d\'accueil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd? bannerAd;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialisation.then((value) {
      setState(() {
        bannerAd = BannerAd(
            size: AdSize.banner,
            adUnitId: adState.bannerAdUnitId,
            listener: adState.adListener,
            request: const AdRequest())
          ..load();
      });
    });
  }

  int index = 0;
  void setIndex(int value) {
    setState(() {
      index = value;
    });
  }

  final List<Widget> _pages = [
    const ProductConfiguration(),
    const MainDataCableCalculation(),
    DisplayConfiguration(),
  ];

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        //backgroundColor: Colors.black26,
        //title: const Text("Display Information"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageSendingBox()));
              },
              child: const WText(
                "Manage Sending Unit",
                color: Colors.blue,
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageProduct()));
              },
              child: const WText("Manage Products",
                  color: Color.fromARGB(255, 30, 98, 47)))
        ],
      ),
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          currentIndex: index,
          onTap: setIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Config'),
            BottomNavigationBarItem(icon: Icon(Icons.cable), label: 'MDCC'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'Calculation')
          ]),
    );
  }
}
// SingleChildScrollView(
//         child: SizedBox(
//           height:
//               MediaQuery.of(context).size.height * 0.99999999999999999999999,
//           child: Column(
//             children: [
//               const DisplayInformation(),
//               bannerAd == null
//                   ? Container(
//                       height: 50,
//                       color: Colors.purple,
//                     )
//                   : Container(height: 90, child: AdWidget(ad: bannerAd!)),
//               OrtherScreen(
//                 contexte: context,
//               )
//             ],
//           ),
//         ),
//       ),