import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/Models/products.dart';
import 'package:absens_clone_app/Screens/AddItemsScrens.dart';
import 'package:absens_clone_app/Screens/displayInformation.dart';
import 'package:absens_clone_app/Screens/otherInformationScreen.dart';
import 'package:absens_clone_app/Screens/sendingBoxform.dart';
import 'package:absens_clone_app/helper/helper.dart';
import 'package:absens_clone_app/helper/provider.dart';
import 'package:absens_clone_app/widgets/displayConfigurationParameter.dart';
import 'package:absens_clone_app/widgets/mainDataCableCalculation.dart';
import 'package:absens_clone_app/widgets/productInformation.dart';
import 'package:absens_clone_app/widgets/texte.dart';
import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  int index = 0;
  void setIndex(int value) {
    setState(() {
      index = value;
    });
  }

  List<Widget> _pages = [
    ProductConfiguration(),
    DisplayConfiguration(),
    MainDataCableCalculation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        //backgroundColor: Colors.black26,
        //title: const Text("Display Information"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SendingBoxForm()));
              },
              child: const WText(
                "Add Sending Box",
                color: Colors.blue,
              )),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: const WText("Add Product",
                  color: Color.fromARGB(255, 30, 98, 47)))
        ],
      ),
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          currentIndex: index,
          onTap: setIndex,
          items: [
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