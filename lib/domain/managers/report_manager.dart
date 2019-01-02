import 'dart:io';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:mart_map/data/db/entities/Category.dart';
import 'package:mart_map/data/db/entities/Store.dart';
import 'package:mart_map/domain/managers/db_manager.dart';
import 'package:mart_map/domain/managers/entities/search_parameters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

class ReportManager {
  ReportManager();

  Future<String> getPdfTopStoresReport(Image img, DBManager dbManager) async {
    List<Store> topCategoriesStores = await dbManager.getTopCategoriesStores();

    final pdf = new PDFDocument();
    final page = new PDFPage(pdf, pageFormat: PDFPageFormat(300, 700));
    final g = page.getGraphics();
    final font = new PDFFont(pdf);

    final bytes = await img.toByteData(format: ImageByteFormat.rawRgba);

    PDFImage imagePdf = new PDFImage(pdf,
        image: bytes.buffer.asUint8List(),
        width: img.width,
        height: img.height);
    g.drawImage(imagePdf, 10.0, 250.0, 280.0);

    int position = 0;
    g.setColor(new PDFColor(0.3, 0.3, 0.3));
    final formatter = new NumberFormat("#,#0.0", "en_US");
    SearchParameters searchParameters = SearchParameters();

    topCategoriesStores.forEach((Store store) {
      String article =
          "${position + 1}. ${store.name} ${store.num} ${formatter.format(store.rate)}/5.0 ${store.phone}";
      article = codeString(article);
      g.drawString(font, 10.0, article, 5.0 * PDFPageFormat.mm,
          (230.0 - (position * 40) - 5));
      String categoriesStr = "";
      store.categories.forEach((Category category) {
        categoriesStr +=
            "${category.name} (${searchParameters.sexDescriptions[category.sex]}, ${searchParameters.sizeDescriptions[category.size]}); ";
      });
      categoriesStr = codeString(categoriesStr);
      g.drawString(font, 5.5, categoriesStr, 5.0 * PDFPageFormat.mm,
          230.0 - (position * 40) - 20);
      position++;
    });

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var file = new File('$tempPath/top_stores.pdf');
    file.writeAsBytesSync(pdf.save());
    return file.path;
  }

  // this is UTF kostil cos plugin support only latin
  String codeString(String str) {
    List<String> charArr = str.split('');
    String result = "";
    charArr.forEach((String char) {
      switch (char) {
        case 'а':
          {
            result += 'a';
            break;
          }
        case 'б':
          {
            result += 'b';
            break;
          }
        case 'в':
          {
            result += 'v';
            break;
          }
        case 'г':
          {
            result += 'g';
            break;
          }
        case 'д':
          {
            result += 'd';
            break;
          }
        case 'е':
          {
            result += 'e';
            break;
          }
        case 'ё':
          {
            result += 'e';
            break;
          }
        case 'ж':
          {
            result += 'zh';
            break;
          }
        case 'з':
          {
            result += 'z';
            break;
          }
        case 'ы':
          {
            result += 'i';
            break;
          }
        case 'и':
          {
            result += 'i';
            break;
          }
        case 'й':
          {
            result += 'yi';
            break;
          }
        case 'к':
          {
            result += 'k';
            break;
          }
        case 'л':
          {
            result += 'l';
            break;
          }
        case 'м':
          {
            result += 'm';
            break;
          }
        case 'н':
          {
            result += 'n';
            break;
          }
        case 'о':
          {
            result += 'o';
            break;
          }
        case 'п':
          {
            result += 'p';
            break;
          }
        case 'р':
          {
            result += 'r';
            break;
          }
        case 'с':
          {
            result += 's';
            break;
          }
        case 'т':
          {
            result += 't';
            break;
          }
        case 'у':
          {
            result += 'u';
            break;
          }
        case 'ф':
          {
            result += 'f';
            break;
          }
        case 'х':
          {
            result += 'h';
            break;
          }
        case 'ц':
          {
            result += 'ts';
            break;
          }
        case 'ч':
          {
            result += 'ch';
            break;
          }
        case 'ш':
          {
            result += 'sh';
            break;
          }
        case 'щ':
          {
            result += 'sh';
            break;
          }
        case 'э':
          {
            result += 'a';
            break;
          }
        case 'ю':
          {
            result += 'yu';
            break;
          }
        case 'я':
          {
            result += 'ya';
            break;
          }

        case 'А':
          {
            result += 'A';
            break;
          }
        case 'Б':
          {
            result += 'B';
            break;
          }
        case 'В':
          {
            result += 'V';
            break;
          }
        case 'Г':
          {
            result += 'G';
            break;
          }
        case 'Д':
          {
            result += 'D';
            break;
          }
        case 'Е':
          {
            result += 'E';
            break;
          }
        case 'Ё':
          {
            result += 'E';
            break;
          }
        case 'Ж':
          {
            result += 'Zh';
            break;
          }
        case 'З':
          {
            result += 'Z';
            break;
          }
        case 'Ы':
          {
            result += 'i';
            break;
          }
        case 'И':
          {
            result += 'I';
            break;
          }
        case 'Й':
          {
            result += 'Yi';
            break;
          }
        case 'К':
          {
            result += 'K';
            break;
          }
        case 'Л':
          {
            result += 'L';
            break;
          }
        case 'М':
          {
            result += 'M';
            break;
          }
        case 'Н':
          {
            result += 'N';
            break;
          }
        case 'О':
          {
            result += 'O';
            break;
          }
        case 'П':
          {
            result += 'P';
            break;
          }
        case 'Р':
          {
            result += 'R';
            break;
          }
        case 'С':
          {
            result += 'S';
            break;
          }
        case 'Т':
          {
            result += 'T';
            break;
          }
        case 'У':
          {
            result += 'U';
            break;
          }
        case 'Ф':
          {
            result += 'F';
            break;
          }
        case 'Х':
          {
            result += 'H';
            break;
          }
        case 'Ц':
          {
            result += 'Ts';
            break;
          }
        case 'Ч':
          {
            result += 'Ch';
            break;
          }
        case 'Ш':
          {
            result += 'Sh';
            break;
          }
        case 'Щ':
          {
            result += 'Sh';
            break;
          }
        case 'Э':
          {
            result += 'A';
            break;
          }
        case 'Ю':
          {
            result += 'Yu';
            break;
          }
        case 'Я':
          {
            result += 'Ya';
            break;
          }
        default:
          {
            result += char;
          }
      }
    });
    return result;
  }
}
