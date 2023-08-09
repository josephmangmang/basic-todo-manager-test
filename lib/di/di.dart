import 'package:path_provider/path_provider.dart';

import '../app/constant/database_constants.dart';
import '../data/source/generated/objectbox.g.dart';

class AppModule {
  static Future<Store> getStore() async {
    final dir = await getApplicationDocumentsDirectory();

    return Store(getObjectBoxModel(),
        directory: '${dir.path}/${DatabaseConstants.databaseName}');
  }
}
