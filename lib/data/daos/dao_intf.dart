import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class DAOInterface<T> {
  Future<List<T>> findOne(int id);
  Future<List<T>> findAll();
  Future<Either<String, int>> insert(Object dto);
  Future<void> delete(int id);
  void deleteAll();
  Future<int> countAll();
}
