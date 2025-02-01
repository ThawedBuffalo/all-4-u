import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'item', indices: [
  Index(value: ['name'])
])
class ItemDTO {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'name')
  final String name;

  @ColumnInfo(name: 'description')
  final String description;

  @ColumnInfo(name: 'categoryIdList')
  final List<int>? categoryIdList;

  @ColumnInfo(name: 'personIdList')
  final List<int>? personIdList;

  ItemDTO(
      {required this.id,
      required this.name,
      required this.description,
      this.categoryIdList,
      this.personIdList});
}
