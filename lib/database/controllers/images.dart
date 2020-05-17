import 'package:sqflite/sqflite.dart';

import 'package:searchimages/database/controllers/initControllerUtil.dart';
import 'package:searchimages/database/controllers/imageUrls.dart'
    as imageUrlsController;

import 'package:searchimages/database/tables/main.dart';
import 'package:searchimages/database/tables/images.dart' as imagesTable;
import 'package:searchimages/database/models/Image.dart';

Future<Database> _init() async {
  return initDbControllerForTable(DatabaseTable.images);
}

Future<void> insertImage(ImageModel imageModel) async {
  await imageUrlsController.insertImageUrl(imageModel.urls);
  Database db = await _init();

  await db.insert(
    imagesTable.tableName,
    imageModel.toDbJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
