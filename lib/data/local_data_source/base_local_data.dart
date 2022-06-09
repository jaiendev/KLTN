import 'package:app_kltn_trunghoan/configs/contants/storage_key.dart';
import 'package:app_kltn_trunghoan/helpers/path_helper.dart';
import 'package:hive/hive.dart';

class BaseLocalData {
  static Future<void> initialBox() async {
    var path = await PathHelper.appDir;
    Hive..init(path.path);
    await Hive.openBox(StorageKey.BOX_USER);
  }
}
