import '../../models/category_model.dart';
import '../../models/item_model.dart';
import '../../models/person_model.dart';

abstract class All4UDatabaseInterface {
  // category section
  Future<CategoryModelList> getAllCategories();
  Future<CategoryModel> insertCategory(final CategoryModel categoryModel);
  Future<CategoryModel> getCategoryById(final int id);
  Future<CategoryModel> updateCategory(final CategoryModel categoryModel);
  Future<void> deleteCategoryById(final int id);
  Future<void> deleteAllCategories();

  // person section
  Future<PersonModelList> getAllPeople();
  Future<PersonModel> insertPerson(final PersonModel personModel);
  Future<PersonModel> getPersonById(final int id);
  Future<PersonModel> updatePerson(final PersonModel personModel);
  Future<void> deletePersonById(final int id);
  Future<void> deleteAllPeople();

  // // item section
  // Future<ItemModel> insertItem(final ItemModel itemModel);
  // Future<ItemModel> getItemById(final int id);
  // Future<ItemModel> updateItem(final ItemModel itemModel);
  // Future<void> deleteItemById(final int id);
  // Future<void> deleteAllItems();
}
