// import 'package:dartz/dartz.dart';
// import '../../core/error/error_messages.dart';
// import '../../core/error/failure.dart';
// import '../../domain/entities/item_entity.dart';
// import '../../domain/repositories/item_repository_intf.dart';
// import '../datasources/database/all4u_database.dart';
// import '../mapper/item_entity_mapper.dart';
// import '../models/item_model.dart';
//
// class ItemRepository implements ItemRepositoryInterface {
//   final All4UDatabase database;
//
//   const ItemRepository({required this.database});
//
//   @override
//   Future<Either<Failure, ItemEntity>> insertFullItem(final String name,
//       String? description, List<int>? categoryIds, List<int>? personIds) async {
//     final ItemModel itemModel = await database.insertItem(
//         ItemEntityMapper.transformToNewModelMap(
//             name, description, categoryIds, personIds));
//
//     if (itemModel['id'] == null) {
//       return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
//     } else {
//       return (Right(ItemEntityMapper.transformModelToEntity(itemModel)));
//     }
//   }
//
//   @override
//   Future<Either<Failure, ItemEntity>> insertNamedItem(String name) async {
//     final ItemModel itemModel = await database.insertItem(
//         ItemEntityMapper.transformToNewModelMap(name, null, null, null));
//
//     if (itemModel['id'] == null) {
//       return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
//     } else {
//       return (Right(ItemEntityMapper.transformModelToEntity(itemModel)));
//     }
//   }
//
//   @override
//   Future<Either<Failure, ItemEntity>> insertUnassignedItem(
//       String name, String? description, List<int>? categoryIds) async {
//     final ItemModel itemModel = await database.insertItem(
//         ItemEntityMapper.transformToNewModelMap(
//             name, description, categoryIds, null));
//
//     if (itemModel['id'] == null) {
//       return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
//     } else {
//       return (Right(ItemEntityMapper.transformModelToEntity(itemModel)));
//     }
//   }
//
//   @override
//   Future<Either<Failure, ItemEntity>> insertUncategorizedItem(
//       String name, String? description, List<int>? personIds) async {
//     final ItemModel itemModel = await database.insertItem(
//         ItemEntityMapper.transformToNewModelMap(
//             name, description, null, personIds));
//
//     if (itemModel['id'] == null) {
//       return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
//     } else {
//       return (Right(ItemEntityMapper.transformModelToEntity(itemModel)));
//     }
//   }
//
//   @override
//   Future<Either<Failure, ItemEntity>> getItemById(int id) async {
//     final ItemModel itemModel = await database.getItemById(id);
//     return (Right(ItemEntityMapper.transformModelToEntity(itemModel)));
//   }
// }
