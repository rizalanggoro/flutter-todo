// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCollectionTodoCollection on Isar {
  IsarCollection<CollectionTodo> get collectionTodos => this.collection();
}

const CollectionTodoSchema = CollectionSchema(
  name: r'CollectionTodo',
  id: 3889434886828448193,
  properties: {
    r'detail': PropertySchema(
      id: 0,
      name: r'detail',
      type: IsarType.string,
    ),
    r'isDone': PropertySchema(
      id: 1,
      name: r'isDone',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _collectionTodoEstimateSize,
  serialize: _collectionTodoSerialize,
  deserialize: _collectionTodoDeserialize,
  deserializeProp: _collectionTodoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'category': LinkSchema(
      id: 654497259513790361,
      name: r'category',
      target: r'CollectionCategory',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _collectionTodoGetId,
  getLinks: _collectionTodoGetLinks,
  attach: _collectionTodoAttach,
  version: '3.1.0+1',
);

int _collectionTodoEstimateSize(
  CollectionTodo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.detail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _collectionTodoSerialize(
  CollectionTodo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.detail);
  writer.writeBool(offsets[1], object.isDone);
  writer.writeString(offsets[2], object.title);
}

CollectionTodo _collectionTodoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CollectionTodo();
  object.detail = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.isDone = reader.readBoolOrNull(offsets[1]);
  object.title = reader.readStringOrNull(offsets[2]);
  return object;
}

P _collectionTodoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _collectionTodoGetId(CollectionTodo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _collectionTodoGetLinks(CollectionTodo object) {
  return [object.category];
}

void _collectionTodoAttach(
    IsarCollection<dynamic> col, Id id, CollectionTodo object) {
  object.id = id;
  object.category
      .attach(col, col.isar.collection<CollectionCategory>(), r'category', id);
}

extension CollectionTodoQueryWhereSort
    on QueryBuilder<CollectionTodo, CollectionTodo, QWhere> {
  QueryBuilder<CollectionTodo, CollectionTodo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CollectionTodoQueryWhere
    on QueryBuilder<CollectionTodo, CollectionTodo, QWhereClause> {
  QueryBuilder<CollectionTodo, CollectionTodo, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CollectionTodoQueryFilter
    on QueryBuilder<CollectionTodo, CollectionTodo, QFilterCondition> {
  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'detail',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'detail',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detail',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      detailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detail',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      isDoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isDone',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      isDoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isDone',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      isDoneEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDone',
        value: value,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension CollectionTodoQueryObject
    on QueryBuilder<CollectionTodo, CollectionTodo, QFilterCondition> {}

extension CollectionTodoQueryLinks
    on QueryBuilder<CollectionTodo, CollectionTodo, QFilterCondition> {
  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition> category(
      FilterQuery<CollectionCategory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'category');
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'category', 0, true, 0, true);
    });
  }
}

extension CollectionTodoQuerySortBy
    on QueryBuilder<CollectionTodo, CollectionTodo, QSortBy> {
  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> sortByDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.asc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy>
      sortByDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.desc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> sortByIsDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDone', Sort.asc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy>
      sortByIsDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDone', Sort.desc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension CollectionTodoQuerySortThenBy
    on QueryBuilder<CollectionTodo, CollectionTodo, QSortThenBy> {
  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> thenByDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.asc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy>
      thenByDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.desc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> thenByIsDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDone', Sort.asc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy>
      thenByIsDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDone', Sort.desc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension CollectionTodoQueryWhereDistinct
    on QueryBuilder<CollectionTodo, CollectionTodo, QDistinct> {
  QueryBuilder<CollectionTodo, CollectionTodo, QDistinct> distinctByDetail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QDistinct> distinctByIsDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDone');
    });
  }

  QueryBuilder<CollectionTodo, CollectionTodo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension CollectionTodoQueryProperty
    on QueryBuilder<CollectionTodo, CollectionTodo, QQueryProperty> {
  QueryBuilder<CollectionTodo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CollectionTodo, String?, QQueryOperations> detailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detail');
    });
  }

  QueryBuilder<CollectionTodo, bool?, QQueryOperations> isDoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDone');
    });
  }

  QueryBuilder<CollectionTodo, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
