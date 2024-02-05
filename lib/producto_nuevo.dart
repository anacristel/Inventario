import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'background.dart';
import 'datos.dart';
import 'gsheets_api.dart';

class Nuevo_equipo extends StatelessWidget {
  Nuevo_equipo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Nuevo equipo.',
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
          FormWidget(onSavedUser: (user) async {
            final id = await SheetsApi.getRowCount() + 1;
            final newUser = user.copy(id: id);

            await SheetsApi.insert([newUser.toJson()]);
          }),
        ],
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  final User? user;
  final ValueChanged<User> onSavedUser;

  const FormWidget({super.key, this.user, required this.onSavedUser});

  @override
  // ignore: library_private_types_in_public_api
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController controller_tipo_equipo;
  late TextEditingController controller_serie_equipo;
  late TextEditingController controller_formato_asigancion;
  late TextEditingController controller_marca;
  late TextEditingController controller_procesador;
  late TextEditingController controller_cores;
  late TextEditingController controller_velocidad_procesador;
  late TextEditingController controller_memoria_ram;
  late TextEditingController controller_capacidad_disco;
  late TextEditingController controller_red;
  late TextEditingController controller_tipo_conexion;
  late TextEditingController controller_direccion_ip;
  late TextEditingController controller_direccion_mac;
  late TextEditingController controller_sistema_operativo;
  late TextEditingController controller_modelo_tinta;
  late TextEditingController controller_area;
  late TextEditingController controller_asignado;
  late TextEditingController controller_estatus;
  late TextEditingController controller_no_inventario;
  late TextEditingController controller_mantenimiento;

  @override
  void initState() {
    super.initState();

    initDatos();
  }

  @override
  void didUpdateWidget(covariant FormWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    initDatos();
  }

  void initDatos() {
    final no_inventario = widget.user == null ? '' : widget.user!.no_inventario;
    final tipo_equipo = widget.user == null ? '' : widget.user!.tipo_equipo;
    final serie_equipo = widget.user == null ? '' : widget.user!.serie_equipo;
    final formato_asignacion =
        widget.user == null ? '' : widget.user!.formato_asignacion;
    final marca = widget.user == null ? '' : widget.user!.marca;
    final procesador = widget.user == null ? '' : widget.user!.procesador;
    final cores = widget.user == null ? '' : widget.user!.cores;
    final velocidad_procesador =
        widget.user == null ? '' : widget.user!.velocidad_procesador;
    final memoria_ram = widget.user == null ? '' : widget.user!.memoria_ram;
    final capacidad_disco_duro =
        widget.user == null ? '' : widget.user!.capacidad_disco_duro;
    final red = widget.user == null ? '' : widget.user!.red;
    final tipo_conexion = widget.user == null ? '' : widget.user!.tipo_conexion;
    final direccion_ip = widget.user == null ? '' : widget.user!.direccion_ip;
    final direccion_mac = widget.user == null ? '' : widget.user!.direccion_mac;
    final sistema_operativo =
        widget.user == null ? '' : widget.user!.sistema_operativo;
    final modelo_tinta = widget.user == null ? '' : widget.user!.modelo_tinta;
    final area = widget.user == null ? '' : widget.user!.area;
    final asignado = widget.user == null ? '' : widget.user!.asignado;
    final estatus = widget.user == null ? '' : widget.user!.estatus;
    final mantenimiento = widget.user == null ? '' : widget.user!.mantenimiento;

    if (mounted) {
      setState(() {
        controller_tipo_equipo = TextEditingController(text: tipo_equipo);
        controller_serie_equipo = TextEditingController(text: serie_equipo);
        controller_formato_asigancion =
            TextEditingController(text: formato_asignacion);
        controller_marca = TextEditingController(text: marca);
        controller_procesador = TextEditingController(text: procesador);
        controller_cores = TextEditingController(text: cores.toString());
        controller_velocidad_procesador =
            TextEditingController(text: velocidad_procesador);
        controller_memoria_ram = TextEditingController(text: memoria_ram);
        controller_capacidad_disco =
            TextEditingController(text: capacidad_disco_duro);
        controller_red = TextEditingController(text: red);
        controller_tipo_conexion = TextEditingController(text: tipo_conexion);
        controller_direccion_ip = TextEditingController(text: direccion_ip);
        controller_direccion_mac = TextEditingController(text: direccion_mac);
        controller_sistema_operativo =
            TextEditingController(text: sistema_operativo);
        controller_modelo_tinta = TextEditingController(text: modelo_tinta);
        controller_area = TextEditingController(text: area);
        controller_asignado = TextEditingController(text: asignado);
        controller_estatus = TextEditingController(text: estatus);
        controller_no_inventario = TextEditingController(text: no_inventario);
        controller_mantenimiento = TextEditingController(text: mantenimiento);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          const EdgeInsets.only(left: 200, right: 200, top: 30, bottom: 30),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            No_Inventario(),
            const SizedBox(height: 7),
            Tipo_Equipo(),
            const SizedBox(height: 7),
            Serie_Equipo(),
            const SizedBox(height: 7),
            Formato_Asignacion(),
            const SizedBox(height: 7),
            Marca(),
            const SizedBox(height: 7),
            Procesador(),
            const SizedBox(height: 7),
            Cores(),
            const SizedBox(height: 7),
            Velocidad_Procesador(),
            const SizedBox(height: 7),
            Memoria_Ram(),
            const SizedBox(height: 7),
            Capacidad_DiscoDuro(),
            const SizedBox(height: 7),
            Red(),
            const SizedBox(height: 7),
            Tipo_Conexion(),
            const SizedBox(height: 7),
            Direccion_IP(),
            const SizedBox(height: 7),
            Direccion_Mac(),
            const SizedBox(height: 7),
            Sistema_Operativo(),
            const SizedBox(height: 7),
            Modelo_Tinta(),
            const SizedBox(height: 7),
            Area(),
            const SizedBox(height: 7),
            Asignado(),
            const SizedBox(height: 7),
            Estatus(),
            const SizedBox(height: 7),
            Mantenimiento(),
            const SizedBox(height: 40),
            BotonAgregar(context),
          ],
        ),
      ),
    );
  }

// Casillas individuales de formularios
  FloatingActionButton BotonAgregar(BuildContext context) {
    return FloatingActionButton.extended(
        heroTag: 'boton1',
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          final form = formKey.currentState!;
          final isValid = form.validate();

          if (isValid) {
            final id = widget.user == null ? null : widget.user!.id;

            final user = User(
              id: id,
              tipo_equipo: controller_tipo_equipo.text,
              serie_equipo: controller_serie_equipo.text,
              formato_asignacion: controller_formato_asigancion.text,
              marca: controller_marca.text,
              procesador: controller_procesador.text,
              cores: controller_cores.text,
              velocidad_procesador: controller_velocidad_procesador.text,
              memoria_ram: controller_memoria_ram.text,
              capacidad_disco_duro: controller_capacidad_disco.text,
              red: controller_red.text,
              tipo_conexion: controller_tipo_conexion.text,
              direccion_ip: controller_direccion_ip.text,
              direccion_mac: controller_direccion_mac.text,
              sistema_operativo: controller_sistema_operativo.text,
              modelo_tinta: controller_modelo_tinta.text,
              area: controller_area.text,
              asignado: controller_asignado.text,
              estatus: controller_estatus.text,
              no_inventario: controller_no_inventario.text,
              mantenimiento: controller_mantenimiento.text,
            );

            widget.onSavedUser(user);

            alerta_agregar(context);

            controller_tipo_equipo.clear();
            controller_serie_equipo.clear();
            controller_formato_asigancion.clear();
            controller_marca.clear();
            controller_procesador.clear();
            controller_cores.clear();
            controller_velocidad_procesador.clear();
            controller_memoria_ram.clear();
            controller_capacidad_disco.clear();
            controller_red.clear();
            controller_tipo_conexion.clear();
            controller_direccion_ip.clear();
            controller_direccion_mac.clear();
            controller_sistema_operativo.clear();
            controller_modelo_tinta.clear();
            controller_area.clear();
            controller_asignado.clear();
            controller_estatus.clear();
            controller_no_inventario.clear();
            controller_mantenimiento.clear();
          }
        },
        label: Text(
          'Guardar',
          style: GoogleFonts.raleway(
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ));
  }

  TextFormField No_Inventario() {
    return TextFormField(
      controller: controller_no_inventario,
      decoration: InputDecoration(
          labelText: 'Número de inventario:',
          labelStyle: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime),
          )),
      validator: (value) => value != null && value.isEmpty
          ? 'Esta casilla no puede estar vacía'
          : null,
    );
  }

  TextFormField Tipo_Equipo() {
    return TextFormField(
        controller: controller_tipo_equipo,
        decoration: InputDecoration(
            labelText: 'Tipo de equipo:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[0-9]'))) {
            return "Esta casilla no acepta números";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Serie_Equipo() {
    return TextFormField(
      controller: controller_serie_equipo,
      decoration: InputDecoration(
          labelText: 'Número de serie del equipo:',
          labelStyle: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime),
          )),
      validator: (value) => value != null && value.isEmpty
          ? 'Esta casilla no puede estar vacía'
          : null,
    );
  }

  TextFormField Formato_Asignacion() {
    return TextFormField(
        controller: controller_formato_asigancion,
        decoration: InputDecoration(
            labelText: 'Formato de asignación:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[0-9]'))) {
            return "Esta casilla no acepta números";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Marca() {
    return TextFormField(
        controller: controller_marca,
        decoration: InputDecoration(
            labelText: 'Marca:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[0-9]'))) {
            return "Esta casilla no acepta números";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Procesador() {
    return TextFormField(
      controller: controller_procesador,
      decoration: InputDecoration(
          labelText: 'Modelo del procesador:',
          labelStyle: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime),
          )),
      validator: (value) => value != null && value.isEmpty
          ? 'Esta casilla no puede estar vacía'
          : null,
    );
  }

  TextFormField Cores() {
    return TextFormField(
        controller: controller_cores,
        decoration: InputDecoration(
            labelText: 'Cantidad de cores:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[A-Z]'))) {
            return "Esta casilla solo acepta números enteros";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Velocidad_Procesador() {
    return TextFormField(
        controller: controller_velocidad_procesador,
        decoration: InputDecoration(
            labelText: 'Velocidad del procesador:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[A-Z]'))) {
            return "Esta casilla solo acepta números decimales";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Memoria_Ram() {
    return TextFormField(
        controller: controller_memoria_ram,
        decoration: InputDecoration(
            labelText: 'Memoria RAM:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[A-Z]'))) {
            return "Esta casilla solo acepta números enteros";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Capacidad_DiscoDuro() {
    return TextFormField(
        controller: controller_capacidad_disco,
        decoration: InputDecoration(
            labelText: 'Capacidad del disco duro:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[A-Z]'))) {
            return "Esta casilla solo acepta números enteros";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Red() {
    return TextFormField(
        controller: controller_red,
        decoration: InputDecoration(
            labelText: 'Red a la que se conecta:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[0-9]'))) {
            return "Esta casilla no acepta números";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Tipo_Conexion() {
    return TextFormField(
      controller: controller_tipo_conexion,
      decoration: InputDecoration(
          labelText: 'Tipo de conexión:',
          labelStyle: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime),
          )),
      validator: (value) => value != null && value.isEmpty
          ? 'Esta casilla no puede estar vacía'
          : null,
    );
  }

  TextFormField Direccion_IP() {
    return TextFormField(
      controller: controller_direccion_ip,
      decoration: InputDecoration(
          labelText: 'Dirección IP:',
          labelStyle: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime),
          )),
      validator: (value) => value != null && value.isEmpty
          ? 'Esta casilla no puede estar vacía'
          : null,
    );
  }

  TextFormField Direccion_Mac() {
    return TextFormField(
      controller: controller_direccion_mac,
      decoration: InputDecoration(
          labelText: 'Dirección MAC:',
          labelStyle: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime),
          )),
      validator: (value) => value != null && value.isEmpty
          ? 'Esta casilla no puede estar vacía'
          : null,
    );
  }

  TextFormField Sistema_Operativo() {
    return TextFormField(
      controller: controller_sistema_operativo,
      decoration: InputDecoration(
          labelText: 'Sistema operativo:',
          labelStyle: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime),
          )),
      validator: (value) => value != null && value.isEmpty
          ? 'Esta casilla no puede estar vacía'
          : null,
    );
  }

  TextFormField Modelo_Tinta() {
    return TextFormField(
      controller: controller_modelo_tinta,
      decoration: InputDecoration(
          labelText: 'Modelo de tinta (en caso de tratarse de una impresora) :',
          labelStyle: GoogleFonts.comfortaa(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime),
          )),
    );
  }

  TextFormField Area() {
    return TextFormField(
        controller: controller_area,
        decoration: InputDecoration(
            labelText: 'Área o departamento:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[0-9]'))) {
            return "Esta casilla no acepta números";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Asignado() {
    return TextFormField(
        controller: controller_asignado,
        decoration: InputDecoration(
            labelText: 'Nombre de la persona asignada al equipo:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[0-9]'))) {
            return "Esta casilla no acepta números";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Estatus() {
    return TextFormField(
        controller: controller_estatus,
        decoration: InputDecoration(
            labelText: 'Estado del equipo:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[0-9]'))) {
            return "Esta casilla no acepta números";
          } else if (value != null && value.isEmpty) {
            return "Esta casilla no puede estar vacía";
          }
        });
  }

  TextFormField Mantenimiento() {
    return TextFormField(
        controller: controller_mantenimiento,
        decoration: InputDecoration(
            labelText: 'Fecha del último mantenimiento realizado:',
            labelStyle: GoogleFonts.comfortaa(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            )),
        validator: (value) {
          if (value != null && value.contains(RegExp(r'[A-Z]'))) {
            return "Esta casilla solo acepta datos de tipo numerico";
          }
          return null;
        });
  }
}

void alerta_agregar(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mensaje:'),
          content: Text(
            'Cambios guardados exitosamente.',
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'ACEPTAR',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.greenAccent.shade400,
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
