import 'package:atividade01/PAGES/Sheet/SheetsColumn.dart';
import 'package:gsheets/gsheets.dart';

class SheetsFlutter {
  static String _sheetId = "1g2c8IfNHq0PIw5IaHDJfXvZwwnVLqkhFIQFX7whL3_g";
  static const _sheetCredencial = r'''
{
  "type": "service_account",
  "project_id": "atividade-4dadd",
  "private_key_id": "d7fd02ca3238afa085b9478bd5ac531f92787c94",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC8VtlmnfOQvl4J\nYaFxB+uOMI4imdpEtuxXyiA2nzqk/ImztvbAnlaA1irIQMhgkTprZYzhXp2LIH+h\nz+NikWQRScIu/Tq2T4ypl4qnaQPIQNHwx7ehztFhwfIWrH8z2Hc7iB/jzcnlPcgN\nuQPhiA+84k1QmhrhgqM1aaCUMTQ+laFNk3+VTNS0Zb6u3AMtKVWaX1Jt1ii+zyYy\nethmDhLQGEiLlgdI9P5v6jpPWCGftO+029udNS4J77dsO02BmilZPeJMjyknY6KT\nXZ4L04ee5ymj/cL66ZJ2VyYn30RDhVaeavXngAVdMAU13hEg+PkmonpHJcvX+6jz\nLavrr6MfAgMBAAECggEAArtFuunGiw5fwcYTN9b0ESNeJF1T35RBmEJbtj8X9CWf\nf6ZDLOb+/S5d/3qFDXV9wen+oZQkN8zYXQntU9Qk/eUydkkA7Xz43srOXYA16FUc\nVmAnJycfPUo5Tx/gVmmozQm74Ktu5q6/NIe+6Sn2hHhJw8YAZs3kvRUTmaKfDdtK\nVY9v8dCC2THc/SVuLRIB9CEC1VIs24G7/KEjnPOX64uO3VanZo0VJT0M6V0Lskti\nqBMEDRlLQ3jhjv+jWeSkKOTl5xINPLiO4H2KgEc9xYWaK8sFh7LBSe+o2ygvz0yy\nyPNQQd93Wrt81aNcZdweW0JooTnnBW2IJygRKoVi+QKBgQDcKSmKcN3ft5U+Jw/m\nzF7A8COJ9B/vKIkqd8YEzG3AvX7oB4zrjG5lymb4m2J+zMZ1zKp+3dET8yENEcUh\nrx1j+FqRF39q3BqWIiLYjgiD9qhgiqZCmlcME0yI40dLJjZhbkgCnU/+XXC5kaFd\nlLMyTR8uhQu3yKkfRSJlXx4NpwKBgQDa/5Oz5WvzUOx2kAifrV3mGeGRLEbO4e5R\nR2X7TVmFV9LE3qkpasm93M7Di01JlV3+KOu0yc1QJzKUTPEpY8tEW+PGpPsw9MAR\nJH342QgBKY7+lu7p5WkvnEnUIFth42Zd6wa/zBR+h2X+ca9K2l/X/C9tytiy4HHC\nMFdo3X0dyQKBgQCIiJJ1g6dlbVGFuO3YoReGKaawkBAZ3haqmprYMPtDk4EXXk9b\naLyyLcKMHLkJj+7n8SQvB1r5N0dg9os9Z38fl057OopPd+6Y+tSHXhYT2Kz1KicP\nmO2w1GsbXW/CQBFrfNv1mx+XzNTykEj1Yxl6cW+MBwCMWknf1Z0OJt3ZcwKBgQCu\ntXPk8WL0YpuyXmey00D0v7L2+MaoZw+Tog0WtXd0bELGMgfr9bhqEkyVLX2D9Xhd\nudGIkfGMPykXrGY8KdPQfioxoA6Q2MCdLGqe6q17F+du7YQ97nnCtMElTIb6icpx\npHzm5+11n5jbq2A3rA0IJrTDty63TV0TmTMygng9GQKBgQCEFwtr3yPKgdy3T5nN\n4t+89hFHPkIqGg4xarauZzLT5AHxWEUew7dQTwHqnX1/dceVBoGXU6zdJKSI3CBm\nAmly7kLBTxvxeKQ+g0WO9irP2CJqfflAlcSGD1HCoHPu4niA/+6h/sb6fK+VJ3c4\nKs8phyuOFSCE+i9PpIZr77cYaQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttersheets@atividade-4dadd.iam.gserviceaccount.com",
  "client_id": "106278539702815108165",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttersheets%40atividade-4dadd.iam.gserviceaccount.com"
}

''';
  static Worksheet? _userSheet;
  static final _gsheets = GSheets(_sheetCredencial);

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_sheetId);

      _userSheet = await _getWorkSheet(spreadsheet, title: "Feed");
      final firstRow = SheetsColumn.getColumns();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
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

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}
