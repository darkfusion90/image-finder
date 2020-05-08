import 'package:sqflite/sqflite.dart' as sqlite;

import 'package:searchimages/database/main.dart' show initDb;
import 'package:searchimages/models/Favorite.dart' show Favorite;
import 'package:searchimages/models/Image.dart' show Image;

const String TABLE_NAME = 'favorites';

Future<sqlite.Database> init() async {
  final sqlite.Database db = await initDb().getDatabase();
  await db.execute(
    'CREATE TABLE IF NOT EXISTS $TABLE_NAME(id INTEGER PRIMARY KEY AUTOINCREMENT, image VARCHAR(255) NOT NULL)',
  );

  return db;
}

Future<Favorite> createFavorite(Image image) async {
  sqlite.Database db = await init();
  final Favorite favorite = Favorite(image.id);

  int id = await db.insert(TABLE_NAME, favorite.toMap(),
      conflictAlgorithm: sqlite.ConflictAlgorithm.replace);

  favorite.setId(id);
  return favorite;
}

Future<List<Favorite>> getAllFavorites() async {
  sqlite.Database db = await init();

  List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
  return Favorite.fromMaps(maps);
}

Future<void> deleteFavorite(Image image) async {
  sqlite.Database db = await init();

  return db.delete(TABLE_NAME, where: 'image= ?', whereArgs: [image.id]);
}

Future<bool> isImageFavorite(Image image) async {
  sqlite.Database db = await init();

  List<Map<String, dynamic>> results =
      await db.query(TABLE_NAME, where: 'image= ?', whereArgs: [image.id]);

  return results.isNotEmpty;
}
