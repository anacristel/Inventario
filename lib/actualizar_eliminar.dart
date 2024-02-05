import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventario/gsheets_api.dart';
import 'package:inventario/producto_nuevo.dart';
import 'background.dart';
import 'datos.dart';

class Equipos extends StatefulWidget {
  Equipos({
    Key? key,
  }) : super(key: key);

  @override
  State<Equipos> createState() => _EquiposState();
}

class _EquiposState extends State<Equipos> {
  List<User> users = [];
  int index = 0;

  @override
  void initState() {
    super.initState();

    getUsers();
  }

  Future getUsers({int index = 0}) async {
    final users = await SheetsApi.getAll();

    if (mounted) {
      setState(() {
        this.users = users;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Equipos en inventario.',
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
          backIndigo(),
          backSkin(),
          backPurple(),
          backPink(),
          backOrangeLigth(),
          backRed(),
          backPink2(),
          backFilter2(),
          SingleChildScrollView(
            child: Column(
              children: [
                FormWidget(
                  user: users.isEmpty ? null : users[index],
                  onSavedUser: (user) async {
                    await SheetsApi.update(user.id!, user.toJson());

                    if (mounted) setState(() {});
                  },
                ),
                if (users.isNotEmpty) buildUserControls(),
              ],
            ),
          ),
        ],
      ));

  Widget buildUserControls() => Column(
        children: [
          // boton eliminar equipo
          FloatingActionButton.extended(
            onPressed: () {
              final user = users[index];

              SheetsApi.deleteById(user.id!);
              if (mounted) setState(() {});

              final newIndex = index > 0 ? index - 1 : 0;
              getUsers(index: newIndex);

              alerta_eliminar(context);
              //if (mounted) setState(() {});
            },
            heroTag: 'boton2',
            backgroundColor: Colors.red.shade400,
            label: Text(
              'Eliminar',
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),

          // controles para navegar entre los equipos
          NavigateUserWidget(
            text: '${index + 1} / ${users.length}',
            onClickedNext: () {
              final nextIndex = index >= users.length - 1 ? 0 : index + 1;

              if (mounted) setState(() => index = nextIndex);
            },
            onClickedPrevious: () {
              final previousIndex = index <= 0 ? users.length - 1 : index - 1;

              if (mounted) setState(() => index = previousIndex);
            },
          ),
          const SizedBox(height: 10),
        ],
      );
}

class NavigateUserWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedPrevious;
  final VoidCallback onClickedNext;

  const NavigateUserWidget({
    Key? key,
    required this.text,
    required this.onClickedPrevious,
    required this.onClickedNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 48,
            icon: const Icon(Icons.navigate_before_rounded),
            onPressed: onClickedPrevious,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
          IconButton(
              onPressed: onClickedNext,
              icon: const Icon(Icons.navigate_next_rounded),
              iconSize: 48),
        ],
      );
}

void alerta_eliminar(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mensaje:'),
          content: Text(
            'Se ha eliminado el equipo exitosamente.',
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
