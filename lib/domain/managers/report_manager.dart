import 'dart:io';
import 'dart:ui';
import 'dart:convert' show utf8;

import 'package:intl/intl.dart';
import 'package:mart_map/data/db/entities/Category.dart';
import 'package:mart_map/data/db/entities/Store.dart';
import 'package:mart_map/domain/managers/db_manager.dart';
import 'package:mart_map/domain/managers/entities/search_parameters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

class ReportManager{
  ReportManager();

  Future<String> getPdfTopStoresReport(Image img, DBManager dbManager) async {
    List<Store> topCategoriesStores = await dbManager.getTopCategoriesStores();

    final pdf = new PDFDocument();
    final page = new PDFPage(pdf, pageFormat: PDFPageFormat(300, 700));
    final g = page.getGraphics();
    final font = new PDFFont(pdf);

    final bytes = await img.toByteData(format: ImageByteFormat.rawRgba);

    PDFImage imagePdf = new PDFImage(
        pdf,
        image: bytes.buffer.asUint8List(),
        width: img.width,
        height: img.height);
    g.drawImage(imagePdf, 10.0, 250.0, 280.0);

    int position = 0;
    g.setColor(new PDFColor(0.3, 0.3, 0.3));
    final formatter = new NumberFormat("#,#0.0", "en_US");
    SearchParameters searchParameters = SearchParameters();

    topCategoriesStores.forEach((Store store){
      List<int> charArr = utf8.encode("${position+1}. ${store.name} ${store.num} ${store.rate}/5.0 ${store.phone}");
      String article = "";
      article = utf8.decode(charArr);
      g.drawString(font, 12.0, article, 5.0 * PDFPageFormat.mm, (230.0-(position*20)-5));
      String categoriesStr = "";
      store.categories.forEach((Category category){
        List<int> charArr = utf8.encode("${category.name} (${searchParameters.sexDescriptions[category.sex]}, ${searchParameters.sizeDescriptions[category.size]}); ");
          categoriesStr += utf8.decode(charArr);
      });
      g.drawString(font, 8.0, categoriesStr, 5.0 * PDFPageFormat.mm, 230.0-(position*20)-20);
    });

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var file = new File('$tempPath/top_stores.pdf');
    file.writeAsBytesSync(pdf.save());
    return file.path;
  }
}