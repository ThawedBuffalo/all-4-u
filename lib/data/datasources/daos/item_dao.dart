import 'package:floor/floor.dart';

import '../../dtos/item_dto.dart';

@dao
abstract class ItemDAO {
  @Query('SELECT * FROM item')
  Future<List<ItemDTO?>> findAllItems();

  @Query('SELECT * FROM item WHERE id = :id')
  Future<ItemDTO?> findCategoryByID(int id);

  @insert
  Future<void> insertCategory(ItemDTO itemDTO);

  @update
  Future<void> updateCategory(ItemDTO itemDTO);

  @delete
  Future<void> deleteCategory(ItemDTO itemDTO);
}
