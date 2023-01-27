import 'package:flutter/material.dart';
import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.account_circle, size: 35,)),
          title: const Text('App Name'),
          centerTitle: true,
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications)), IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined))],
        ),
        body: BarcodeCamera(
            types: const [
              BarcodeType.ean8,
              BarcodeType.ean13,
              BarcodeType.code128
            ],
            resolution: Resolution.hd720,
            framerate: Framerate.fps30,
            mode: DetectionMode.pauseVideo,
            onScan: (code) => print(code),
            children: [
              MaterialPreviewOverlay(animateDetection: false),
              BlurPreviewOverlay(),
              Positioned(
                child: ElevatedButton(
                  onPressed: () =>
                      CameraController.instance.resumeDetector(),
                  child: Text('Resume'),
                ),
              )
            ]
        ),
      ),
    );
  }
}