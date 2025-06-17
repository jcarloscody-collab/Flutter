import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late CameraController cameraController;
  @override
  void initState() {
    cameraController = CameraController(
      Injector.get<List<CameraDescription>>().first,
      ResolutionPreset.ultraHigh,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: ClinicasAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/cam_icon.png'),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Tirar a Foto agora',
                  style: ClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  '''Posicionar o documento dentro do quadrado abaixo....''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ClinicasTheme.blueColor,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                FutureBuilder(
                  future: cameraController.initialize(),
                  builder: (context, snapshot) => switch (snapshot) {
                    AsyncSnapshot(
                      connectionState:
                          ConnectionState.active || ConnectionState.waiting
                    ) =>
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    AsyncSnapshot(connectionState: ConnectionState.done) =>
                      cameraController.value.isInitialized
                          ? CameraPreview(cameraController)
                          : SizedBox.shrink(),
                    _ => Center(
                        child: Text('Error ao carregar a camera'),
                      )
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
