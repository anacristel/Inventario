import 'package:gsheets/gsheets.dart';

import 'datos.dart';

class SheetsApi {
  static const _credentials = r'''
    {
  "type": "service_account",
  "project_id": "gsheets-371717",
  "private_key_id": "d8153f476fbcb1de8933b0d9c01531427072e721",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDXGtOBrGN/PdRd\nFmI5Y6gJ502dKaD4WpVob6+itYJZJB8HwYtFY4gd/jG0uDka1A7TPhahqdWK6BS6\netrZGT5i8JtWSXRiGTsM5FZacWUGqUiSefCrcoOvQ/il34bobpyol5AI3AncrZa4\nbisfhkIsuKC0ylAJxO/PLEPPs69DvjaM0dbshGQY+PdN1a8Wn9ddTLG5EEumNBGC\niWNpx1Mbe1YizyvKIJkkhL6+nmqw8UJWevmUjVk6xRDYhNVaRkfTHVV7pYnh1zWe\nHtC48xh1RYv5IS/I33SoIwUnws9cDsqNf5QvBxWAfpbmd2f54LU6PqgufOEnr1I2\nwZQdDGqBAgMBAAECggEAATKaNDwzYibuFJMS4rL2j4B+R6zqt10IkMop1+lOWxuA\nVxKRF1iyhERsHKGBrTPGa9NCPrP0BkNWhqU/lE26o6gXWPLnBJMHb5nypfuIgf26\nsYzHbvqR4Y2ijvqv3/XSJE5SqqVWLmB0tc7wiVsH3a8tAzRu4yLpqQBeEdIuRnWA\nPdzkhwmOH3/Y+Pn3tUgtoTAZ9XxvWhLCoVvqOySwtSVrGHhLIC32iBLOVvSteL4n\ncCh/UWzRq/A+ZPtIChMW/4kYwIGKtgyCe1+d0N4tVSiU64/j7hjdx5FsfLzyiFeK\nHX60jsK6LXr2pkc6QB1udZmb6meTtrKYHbutMDmsAQKBgQD+HtcNYGpq+Ivhz0v4\nY7Wy7D7rJqpWKMGqWYOWeGyaKgiVkvQBuqrRU3iPgzo+WB63If0+WV8eU6pJcWFW\neEDIdhh7omzx3eXWnyKNeBJDMr+CRPsmB6dJtMVXCdmRfA6OeUXDyGj2aVAFWlPP\nHEVEx2yLt1E89QYl5a5SUV+0AQKBgQDYshzTCNycWEJwkEn40ltCr7b1R5jamZyY\nX1iC1mNtOoUdIFjD2+50ge8dMmEgnPu+ULmfSe1IrqIYbG+bMzPooXhXe5B0epf1\n0NlIIxJ4eP5KR0JoXX5NGWz6I7kSQz5kQJgdoTkiRZmWMhRlCzwYRp400DsFMDxr\nLbhrydq2gQKBgQD6/8MyNzVlizG/TF2hbfseSzKqWXqNt5vygo/yo+fBLhtkgc35\nl0L5lxTRy7BPvAI6qJvWZbgJ4GGmQRL/sa9rURpFo90v2RkXr/8U9LA1J375UOEw\nYwbdSmxQ2C3KAVrvZuF9zAnAuayMXPfC7g2NLd0M83iOWQZFkGNqc22wAQKBgQCi\nFF8A7gDspAtV3GanyNdfwsQrJBlNcFYzliVC/44wtfO4vGgIXyk1VbZ+9R624RRe\n3kxou0fS9GPjtr+nqx2pY5T6gj6jEMs2nrbWgP0gxQcWkcQ3Aa8lhd4AHtYftdIl\n9DaS+vMcEkj1kZG1njidw7wzrohmshSO6gyl+r4vgQKBgQCY3ldR5g9nxYun+00I\nMDQ+6hRh8P4hVn6UaCNZVD4pSjrGLpn1lRkWBt6yeB8XR9CQWyqx/GNbHqHm3Sh0\nU0wpjvnwPVUzJA8K3ZYJjlVhrNz413sVayU4p1rlhGv+URfN1REcqTffvTi+c+rw\n8ni+9XH2xFg6mI74wAJH1aYTUA==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-371717.iam.gserviceaccount.com",
  "client_id": "113470488534932367994",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-371717.iam.gserviceaccount.com"
}
''';
  static const _spreadsheetId = '1F5_i0gduPiiUCncTSZT-OhfsWrfA1jGE6JGlnZDlK6k';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _BaseDatosSheet;

  static int numberOfNotes = 0;
  static List<String> products = [];

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _BaseDatosSheet = await _getWorkSheet(spreadsheet, title: 'EquiposInformaticos');
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  // agregando id
  static Future<int> getRowCount() async {
    if (_BaseDatosSheet == null) return 0;

    final lastRow = await _BaseDatosSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  // insertar una fila de datos
  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_BaseDatosSheet == null) return;

    _BaseDatosSheet!.values.map.appendRows(rowList);
  }

  static Future<User?> getById(int id) async {
    if (_BaseDatosSheet == null) return null;

    final json = await _BaseDatosSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : User.fromJson(json);
  }

  // llama todas los datos en la hoja de cálculo
  static Future<List<User>> getAll() async {
    if (_BaseDatosSheet == null) return <User>[];

    final users = await _BaseDatosSheet!.values.map.allRows();
    return users == null ? <User>[] : users.map(User.fromJson).toList();
  }

  // elimina una fila por medio de su id
  static Future<bool> deleteById(int id) async {
    if (_BaseDatosSheet == null) return false;

    final index = await _BaseDatosSheet!.values.rowIndexOf(id);
    if (index == -1) return false;

    return _BaseDatosSheet!.deleteRow(index);
  }

  // actualiza los datos en una fila
  static Future<bool> update(
    int id,
    Map<String, dynamic> user,
  ) async {
    if (_BaseDatosSheet == null) return false;

    return _BaseDatosSheet!.values.map.insertRowByKey(id, user);
  }
}
