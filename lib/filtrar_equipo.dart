import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'background.dart';
import 'datos.dart';
import 'gsheets_api.dart';

class FiltrarEquipo extends StatefulWidget {
  FiltrarEquipo({
    Key? key,
  }) : super(key: key);

  @override
  _FiltrarEquipoState createState() => _FiltrarEquipoState();
}

class _FiltrarEquipoState extends State<FiltrarEquipo> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Filtrar equipos.',
            style: GoogleFonts.marcellus(
              textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4),
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey.shade800),
        ),
        body: Stack(
          children: [
            const backIndigo(),
            const backSkin(),
            const backPurple(),
            const backPink(),
            const backOrangeLigth(),
            const backRed(),
            const backPink2(),
            backFilter2(),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 450,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        hintText:
                            "Buscar por nombre de equipo, área o persona asignada.",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lime)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: Rows(
                      text: searchController.text,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class Rows extends StatelessWidget {
  final String text;

  Rows({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SheetsApi.getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        var usuarios = (snapshot.data as List<User>);

        if (text.isNotEmpty) {
          var t = text.toLowerCase();
          usuarios = usuarios
              .where((p) =>
                  p.asignado!.toLowerCase().contains(t) ||
                  p.area!.toLowerCase().contains(t) ||
                  p.tipo_equipo!.toLowerCase().contains(t))
              .toList();
        }

        return ListView.separated(
            itemCount: usuarios.length,
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.transparent,
                ),
            itemBuilder: (context, idx) {
              var p = usuarios[idx];
              return Padding(
                padding: const EdgeInsets.only(left: 300, right: 300),
                child: Card(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 20, top: 9, bottom: 9),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              const Color.fromARGB(255, 163, 233, 209),
                          child: Icon(Icons.devices_outlined,
                              size: 30, color: Colors.grey.shade800),
                        ),
                        const SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${p.tipo_equipo}',
                              style: GoogleFonts.comfortaa(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800)),
                            ),
                            Text('ASIGNADO A:  ${p.asignado}'),
                            const SizedBox(height: 2),
                            Text('ÁREA:  ${p.area}'),
                            const SizedBox(height: 2),
                            Text('NO. INVENTARIO:  ${p.no_inventario}'),
                            const SizedBox(height: 2),
                            Text('MARCA:  ${p.marca}'),
                            const SizedBox(height: 2),
                            Text('ESTATUS:  ${p.estatus}'),
                            const SizedBox(height: 2),
                            Text('ÚLTIMO MANTENIMIENTO:  ${p.mantenimiento}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
