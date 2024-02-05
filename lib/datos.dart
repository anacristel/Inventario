import 'dart:convert';

class Datos {
  static const String id = 'ID';
  static const String tipo_equipo = 'TIPO DE EQUIPO';
  static const String serie_equipo = 'SERIE EQUIPO';
  static const String formato_asignacion = 'FORMATO DE ASIGNACIÓN';
  static const String marca = 'MARCA';
  static const String procesador = 'PROCESADOR';
  static const String cores = 'CORES';
  static const String velocidad_procesador = 'VELOCIDAD DEL PROCESADOR';
  static const String memoria_ram = 'MEMORIA RAM';
  static const String capacidad_disco_duro = 'CAPACIDAD DISCO DURO';
  static const String red = 'RED A LA QUE SE CONECTA';
  static const String tipo_conexion = 'TIPO DE CONEXIÓN';
  static const String direccion_ip = 'DIRECCION IP';
  static const String direccion_mac = 'DIRECCION MAC';
  static const String sistema_operativo = 'SISTEMA OPERATIVO';
  static const String modelo_tinta = 'MODELO TINTA';
  static const String area = 'AREA';
  static const String asignado = 'ASIGNADO A';
  static const String estatus = 'ESTATUS';
  static const String no_inventario = 'No. De Inventario';
  static const String mantenimiento = 'MANTENIMIENTO';

  static List<String> getFields() => [
        id,
        tipo_equipo,
        serie_equipo,
        formato_asignacion,
        marca,
        procesador,
        cores,
        velocidad_procesador,
        memoria_ram,
        capacidad_disco_duro,
        red,
        tipo_conexion,
        direccion_ip,
        direccion_mac,
        sistema_operativo,
        modelo_tinta,
        area,
        asignado,
        estatus,
        no_inventario,
        mantenimiento
      ];
}

class User {
  final int? id;
  final String? tipo_equipo;
  final String? serie_equipo;
  final String? formato_asignacion;
  final String? marca;
  final String? procesador;
  final String? cores;
  final String? velocidad_procesador;
  final String? memoria_ram;
  final String? capacidad_disco_duro;
  final String? red;
  final String? tipo_conexion;
  final String? direccion_ip;
  final String? direccion_mac;
  final String? sistema_operativo;
  final String? modelo_tinta;
  final String? area;
  final String? asignado;
  final String? estatus;
  final String? no_inventario;
  final String? mantenimiento;

  const User({
    this.id,
    required this.tipo_equipo,
    required this.serie_equipo,
    required this.formato_asignacion,
    required this.marca,
    required this.procesador,
    required this.cores,
    required this.velocidad_procesador,
    required this.memoria_ram,
    required this.capacidad_disco_duro,
    required this.red,
    required this.tipo_conexion,
    required this.direccion_ip,
    required this.direccion_mac,
    required this.sistema_operativo,
    required this.modelo_tinta,
    required this.area,
    required this.asignado,
    required this.estatus,
    required this.no_inventario,
    required this.mantenimiento,
  });

  User copy({
    int? id,
    String? tipo_equipo,
    String? serie_equipo,
    String? formato_asignacion,
    String? marca,
    String? procesador,
    String? cores,
    String? velocidad_procesador,
    String? memoria_ram,
    String? capacidad_disco_duro,
    String? red,
    String? tipo_conexion,
    String? direccion_ip,
    String? direccion_mac,
    String? sistema_operativo,
    String? modelo_tinta,
    String? area,
    String? asignado,
    String? estatus,
    String? no_inventario,
    String? mantenimiento,
  }) =>
      User(
        id: id ?? this.id,
        tipo_equipo: tipo_equipo ?? this.tipo_equipo,
        serie_equipo: serie_equipo ?? this.serie_equipo,
        formato_asignacion: formato_asignacion ?? this.formato_asignacion,
        marca: marca ?? this.marca,
        procesador: procesador ?? this.procesador,
        cores: cores ?? this.cores,
        velocidad_procesador: velocidad_procesador ?? this.velocidad_procesador,
        memoria_ram: memoria_ram ?? this.memoria_ram,
        capacidad_disco_duro: capacidad_disco_duro ?? this.capacidad_disco_duro,
        red: red ?? this.red,
        tipo_conexion: tipo_conexion ?? this.tipo_conexion,
        direccion_ip: direccion_ip ?? this.direccion_ip,
        direccion_mac: direccion_mac ?? this.direccion_mac,
        sistema_operativo: sistema_operativo ?? this.sistema_operativo,
        modelo_tinta: modelo_tinta ?? this.modelo_tinta,
        area: area ?? this.area,
        asignado: asignado ?? this.asignado,
        estatus: estatus ?? this.estatus,
        no_inventario: no_inventario ?? this.no_inventario,
        mantenimiento: mantenimiento ?? this.mantenimiento,
      );

  static User fromJson(Map<String, dynamic> json) => User(
      id: jsonDecode(json[Datos.id]),
      tipo_equipo: json[Datos.tipo_equipo],
      serie_equipo: json[Datos.serie_equipo],
      formato_asignacion: json[Datos.formato_asignacion],
      marca: json[Datos.marca],
      procesador: json[Datos.procesador],
      cores: json[Datos.cores],
      velocidad_procesador: json[Datos.velocidad_procesador],
      memoria_ram: json[Datos.memoria_ram],
      capacidad_disco_duro: json[Datos.capacidad_disco_duro],
      red: json[Datos.red],
      tipo_conexion: json[Datos.tipo_conexion],
      direccion_ip: json[Datos.direccion_ip],
      direccion_mac: json[Datos.direccion_mac],
      sistema_operativo: json[Datos.sistema_operativo],
      modelo_tinta: json[Datos.modelo_tinta],
      area: json[Datos.area],
      asignado: json[Datos.asignado],
      estatus: json[Datos.estatus],
      no_inventario: json[Datos.no_inventario],
      mantenimiento: json[Datos.mantenimiento]);

  Map<String, dynamic> toJson() => {
        Datos.id: id,
        Datos.tipo_equipo: tipo_equipo,
        Datos.serie_equipo: serie_equipo,
        Datos.formato_asignacion: formato_asignacion,
        Datos.marca: marca,
        Datos.procesador: procesador,
        Datos.cores: cores,
        Datos.velocidad_procesador: velocidad_procesador,
        Datos.memoria_ram: memoria_ram,
        Datos.capacidad_disco_duro: capacidad_disco_duro,
        Datos.red: red,
        Datos.tipo_conexion: tipo_conexion,
        Datos.direccion_ip: direccion_ip,
        Datos.direccion_mac: direccion_mac,
        Datos.sistema_operativo: sistema_operativo,
        Datos.modelo_tinta: modelo_tinta,
        Datos.area: area,
        Datos.asignado: asignado,
        Datos.estatus: estatus,
        Datos.no_inventario: no_inventario,
        Datos.mantenimiento: mantenimiento,
      };
}
