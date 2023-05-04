// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/ForumPost.dart';
import 'models/PostReply.dart';
import 'models/Relationship.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3299664545099743597),
      name: 'ForumPost',
      lastPropertyId: const IdUid(4, 4985422426115245748),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2345011826198097884),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5619150353814578182),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6434575558844629489),
            name: 'draft',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4985422426115245748),
            name: 'relationshipId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 4041671059461907796),
            relationTarget: 'Relationship')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'replies', srcEntity: 'PostReply', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(2, 5850958085141326978),
      name: 'PostReply',
      lastPropertyId: const IdUid(3, 2383079849247965534),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6800069450584279221),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6323690206077767098),
            name: 'content',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2383079849247965534),
            name: 'postId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 1761666423941461478),
            relationTarget: 'ForumPost')
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 1172234870346071889),
            name: 'replies',
            targetId: const IdUid(2, 5850958085141326978))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 1323948735940516551),
      name: 'Relationship',
      lastPropertyId: const IdUid(3, 106992363596547557),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5348850072997621402),
            name: 'id',
            type: 6,
            flags: 32808,
            indexId: const IdUid(3, 4603961470612243433)),
        ModelProperty(
            id: const IdUid(2, 4862993502610556094),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 106992363596547557),
            name: 'internalId',
            type: 6,
            flags: 1)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 1323948735940516551),
      lastIndexId: const IdUid(3, 4603961470612243433),
      lastRelationId: const IdUid(1, 1172234870346071889),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ForumPost: EntityDefinition<ForumPost>(
        model: _entities[0],
        toOneRelations: (ForumPost object) => [object.relationship],
        toManyRelations: (ForumPost object) => {
              RelInfo<PostReply>.toOneBacklink(
                      3, object.id, (PostReply srcObject) => srcObject.post):
                  object.replies
            },
        getId: (ForumPost object) => object.id,
        setId: (ForumPost object, int id) {
          object.id = id;
        },
        objectToFB: (ForumPost object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addBool(2, object.draft);
          fbb.addInt64(3, object.relationship.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ForumPost(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              draft: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 8, false));
          object.relationship.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.relationship.attach(store);
          InternalToManyAccess.setRelInfo<ForumPost>(
              object.replies,
              store,
              RelInfo<PostReply>.toOneBacklink(
                  3, object.id, (PostReply srcObject) => srcObject.post));
          return object;
        }),
    PostReply: EntityDefinition<PostReply>(
        model: _entities[1],
        toOneRelations: (PostReply object) => [object.post],
        toManyRelations: (PostReply object) =>
            {RelInfo<PostReply>.toMany(1, object.id): object.replies},
        getId: (PostReply object) => object.id,
        setId: (PostReply object, int id) {
          object.id = id;
        },
        objectToFB: (PostReply object, fb.Builder fbb) {
          final contentOffset = fbb.writeString(object.content);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, contentOffset);
          fbb.addInt64(2, object.post.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = PostReply(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          object.post.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.post.attach(store);
          InternalToManyAccess.setRelInfo<PostReply>(
              object.replies, store, RelInfo<PostReply>.toMany(1, object.id));
          return object;
        }),
    Relationship: EntityDefinition<Relationship>(
        model: _entities[2],
        toOneRelations: (Relationship object) => [],
        toManyRelations: (Relationship object) => {},
        getId: (Relationship object) => object.internalId,
        setId: (Relationship object, int id) {
          object.internalId = id;
        },
        objectToFB: (Relationship object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addInt64(2, object.internalId ?? 0);
          fbb.finish(fbb.endTable());
          return object.internalId ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Relationship(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4))
            ..internalId =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ForumPost] entity fields to define ObjectBox queries.
class ForumPost_ {
  /// see [ForumPost.id]
  static final id = QueryIntegerProperty<ForumPost>(_entities[0].properties[0]);

  /// see [ForumPost.title]
  static final title =
      QueryStringProperty<ForumPost>(_entities[0].properties[1]);

  /// see [ForumPost.draft]
  static final draft =
      QueryBooleanProperty<ForumPost>(_entities[0].properties[2]);

  /// see [ForumPost.relationship]
  static final relationship =
      QueryRelationToOne<ForumPost, Relationship>(_entities[0].properties[3]);
}

/// [PostReply] entity fields to define ObjectBox queries.
class PostReply_ {
  /// see [PostReply.id]
  static final id = QueryIntegerProperty<PostReply>(_entities[1].properties[0]);

  /// see [PostReply.content]
  static final content =
      QueryStringProperty<PostReply>(_entities[1].properties[1]);

  /// see [PostReply.post]
  static final post =
      QueryRelationToOne<PostReply, ForumPost>(_entities[1].properties[2]);

  /// see [PostReply.replies]
  static final replies =
      QueryRelationToMany<PostReply, PostReply>(_entities[1].relations[0]);
}

/// [Relationship] entity fields to define ObjectBox queries.
class Relationship_ {
  /// see [Relationship.id]
  static final id =
      QueryIntegerProperty<Relationship>(_entities[2].properties[0]);

  /// see [Relationship.title]
  static final title =
      QueryStringProperty<Relationship>(_entities[2].properties[1]);

  /// see [Relationship.internalId]
  static final internalId =
      QueryIntegerProperty<Relationship>(_entities[2].properties[2]);
}
