import 'package:all_4_u/data/mapper/category_entity_mapper.dart';

import '../models/category_model.dart';
import '../../domain/entities/category_entity_list.dart';

class CategoryEntityListMapper {
  static CategoryEntityList transformModelToEntity(
      final CategoryModelList models) {
    final values = models
        .map((model) => CategoryEntityMapper.transformModelToEntity(model))
        .toList();
    return CategoryEntityList(values: values);
  }

  // class TodoListMapper {
  // static TodoList transformToModel(final TodoListEntity entities) {
  // final values =
  // entities.map( (entity) => TodoMapper.transformToModel(entity)) .toList();
  // return TodoList(values: values);
  // }
  //
  // static TodoListEntity transformToMap(final TodoList model) =>
  // model.values.map((value) => TodoMapper.transformToMap(value)).toList();
  // }
}
