import 'dart:ffi';

import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/Screens/AddItemsScrens.dart';
import 'package:absens_clone_app/Screens/displayInformation.dart';
import 'package:absens_clone_app/Screens/otherInformationScreen.dart';
import 'package:absens_clone_app/Screens/sendingBoxform.dart';
import 'package:absens_clone_app/helper/helper.dart';
import 'package:absens_clone_app/helper/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }
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
    return GetMaterialApp(
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  static List<SendingBox> boxs = [
    SendingBox(
      boxName: "Box 1",
      npd: 3,
      dbmp: 4,
      cv: 5,
      tc: 2,
      cm: 2,
    ),
    SendingBox(
      boxName: "Box 2",
      npd: 4,
      dbmp: 1,
      cv: 2,
      tc: 5,
      cm: 6,
    )
  ];
  static List<Product> produits = [
    Product(
        dataruns: 2,
        modulePower: 500,
        usageFactor: 0.9,
        brightness: 0.12,
        panel_px_w: 216,
        panel_pix_h: 216,
        name: "A2 Pro 500*500",
        aspect_ratio_h: 1,
        resolution_width: 500,
        resolution_height: 500,
        resolution_size: 500 * 500,
        aspect_ratio_w: 1.000,
        pixel_per_pouce: 0.70,
        maximum_pixel_per_sending_port: 60,
        maximun_resolution: 12960,
        power_consumption_max: "",
        weigh_per_module: 6.00)
  ];

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
            request: AdRequest())
          ..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Display Information"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SendingBoxForm()));
              },
              child: const Text("Add Sending Box")),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: const Text("Add Product"))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.99999999999999999999999,
        child: Column(
          children: [
            const DisplayInformation(),
            bannerAd == null
                ? Center()
                : Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: AdWidget(ad: bannerAd!)),
            OrtherScreen(
            )
          ],
        ),
      ),
    );
  }
}
