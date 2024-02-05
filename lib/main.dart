import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventario/gsheets_api.dart';
import 'package:inventario/producto_nuevo.dart';

import 'actualizar_eliminar.dart';
import 'background.dart';
import 'filtrar_equipo.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SheetsApi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventario de equipos informáticos.',
      home: const HomePage(),
      routes: {
        'nuevo': (_) => Nuevo_equipo(),
        'equipos': (_) => Equipos(),
        'filtro': (_) => FiltrarEquipo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const backIndigo(),
          const backSkin(),
          const backPurple(),
          const backPink(),
          const backOrangeLigth(),
          const backRed(),
          const backPink2(),
          backFilter(),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pushNamed(context, 'nuevo'),
                        tooltip: 'Agregar',
                        icon: const Icon(Icons.add_circle_outline),
                        iconSize: 115,
                        color: Colors.pink.shade300),
                    Text('Nuevo equipo',
                        style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 19,
                                fontWeight: FontWeight.w500))),
                  ],
                ),
                const SizedBox(width: 55),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, 'equipos'),
                        tooltip: 'Actualizar / Eliminar',
                        icon: const Icon(Icons.inventory_rounded),
                        iconSize: 115,
                        color: Colors.orange.shade400),
                    Text('Equipos',
                        style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 19,
                                fontWeight: FontWeight.w500))),
                  ],
                ),
                const SizedBox(width: 55),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pushNamed(context, 'filtro'),
                        tooltip: 'Filtrar equipos',
                        icon: const Icon(Icons.search_rounded),
                        iconSize: 115,
                        color: Color.fromARGB(228, 54, 228, 170)),
                    Text('Consultar',
                        style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 19,
                                fontWeight: FontWeight.w500))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
