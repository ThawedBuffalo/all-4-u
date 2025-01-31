import 'package:floor/floor.dart';

import '../../dtos/category_dto.dart';

@dao
abstract class CategoryDAO {
  @Query('SELECT * FROM category')
  Future<List<CategoryDTO>> findAllStudents();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertStudent(CategoryDTO categoryDTO);
}