import 'package:flutter/material.dart';
import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Sales',
      style: optionStyle,
    ),
    Text(
      'Inventory',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.account_circle, size: 35,)),
        title: const Text('App Name'),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications)), IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined))],
      ),
      body: Container(
        child: Column(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            // BarcodeCamera(
            //     types: const [
            //       BarcodeType.ean8,
            //       BarcodeType.ean13,
            //       BarcodeType.code128
            //     ],
            //     resolution: Resolution.hd720,
            //     framerate: Framerate.fps30,
            //     mode: DetectionMode.pauseVideo,
            //     onScan: (code) => print(code),
            //     children: [
            //       MaterialPreviewOverlay(animateDetection: false),
            //       BlurPreviewOverlay(),
            //       Positioned(
            //         child: ElevatedButton(
            //           onPressed: () =>
            //               CameraController.instance.resumeDetector(),
            //           child: Text('Resume'),
            //         ),
            //       )
            //     ]
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Sale'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Inventory')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}