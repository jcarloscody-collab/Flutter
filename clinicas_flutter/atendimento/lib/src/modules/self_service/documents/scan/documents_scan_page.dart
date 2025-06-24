import 'package:asyncstate/asyncstate.dart';
import 'package:atendimento/src/utils/routes.dart';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DocumentsScanPage extends StatefulWidget {
  const DocumentsScanPage({super.key});

  @override
  State<DocumentsScanPage> createState() => _DocumentsScanPageState();
}

class _DocumentsScanPageState extends State<DocumentsScanPage> {
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
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox(
                                width: sizeOf.width * .5,
                                child: CameraPreview(
                                  cameraController,
                                  child: DottedBorder(
                                    dashPattern: const [1, 10, 1, 3],
                                    borderType: BorderType.RRect,
                                    strokeWidth: 4,
                                    strokeCap: StrokeCap.square,
                                    radius: const Radius.circular(16),
                                    color: ClinicasTheme.orangeColor,
                                    child: SizedBox.expand(),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    _ => Center(
                        child: Text('Error ao carregar a camera'),
                      )
                  },
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  width: sizeOf.width * .8,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      final nav = Navigator.of(context);
                      final foto =
                          await cameraController.takePicture().asyncLoader();

                      nav.pushNamed('$selfService$documentsScanConfirm',
                          arguments: foto);
                    },
                    child: const Text('Tirar Foto'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
