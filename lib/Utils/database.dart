// import 'package:cityofcars_scout/Screens/approvals.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class NotificationDataBase {
//   static final NotificationDataBase instance = NotificationDataBase._init();
//   static Database? _database;
//   NotificationDataBase._init();
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('notification.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filepath) async {
//     final dbpath = await getDatabasesPath();
//     final path = join(dbpath, filepath);
//     return await openDatabase(path, version: 1, onCreate: _createdb);
//   }

//   Future _createdb(Database db, int version) async {
//     const idtype = "INTEGER PRIMARY KEY";
//     const texttype = "TEXT";

//     await db.execute(
//         "CREATE TABLE $tablebnotes(${NotificationFields.id} $idtype ${NotificationFields.title} $texttype ${NotificationFields.body} $texttype ${NotificationFields.isRead} $texttype ${NotificationFields.time} $texttype ${NotificationFields.type} $texttype)");
//   }

//   Future<NotificationModel> create(NotificationModel note) async {
//     final db = await instance.database;
//     final id = await db.insert(tablebnotes, note.tojson());
//     return note.copy(id: id);
//   }

//   Future<NotificationModel> readnote(int id) async {
//     final db = await instance.database;
//     final maps = await db.query(
//       tablebnotes,
//       columns: NotificationFields.values,
//       where: "${NotificationFields.id} = ?",
//       whereArgs: [id],
//     );
//     if (maps.isNotEmpty) {
//       return NotificationModel.formJson(maps.first);
//     } else {
//       throw Exception("ID $id not found");
//     }
//   }

//   Future<List<NotificationModel>> readallNots() async {
//     final db = await instance.database;
//     final result = await db.query(tablebnotes);
//     return result.map((e) => NotificationModel.formJson(e)).toList();
//   }

//   Future deletall() async {
//     final db = await instance.database;
//     db.delete(tablebnotes);
//   }

//   Future close() async {
//     final db = await instance.database;
//     await db.close();
//   }
// }

// const String tablebnotes = "notes";

// class NotificationFields {
//   static const List<String> values = [
//     id,
//     title,
//     body,
//     time,
//     type,
//   ];
//   static const String id = "_id";
//   static const String title = "title";
//   static const String body = "body";
//   static const String isRead = "isRead";
//   static const String time = "time";
//   static const String type = "type";
// }

// class NotificationModel {
//   final int? id;
//   final String? title;
//   final String? body;
//   final String? isRead;
//   final String? time;
//   final String? type;
//   NotificationModel({
//     this.id,
//     required this.title,
//     required this.body,
//     required this.isRead,
//     required this.time,
//     required this.type,
//   });
//   static NotificationModel formJson(Map<String, Object?> json) =>
//       NotificationModel(
//         id: int.parse(json[NotificationFields.id].toString()),
//         title: json[NotificationFields.title].toString(),
//         body: json[NotificationFields.body].toString(),
//         isRead: json[NotificationFields.isRead].toString(),
//         time: json[NotificationFields.time].toString(),
//         type: json[NotificationFields.type].toString(),
//       );
//   Map<String, Object?> tojson() => {
//         // NotificationFields.id: id.toString(),
//         NotificationFields.title: title,
//         NotificationFields.body: body,
//         NotificationFields.isRead: isRead,
//         NotificationFields.time: time,
//         NotificationFields.type: type,
//       };
//   NotificationModel copy({
//     int? id,
//     String? title,
//     String? body,
//     String? isRead,
//     String? time,
//     String? type,
//   }) =>
//       NotificationModel(
//         title: title,
//         body: body,
//         isRead: isRead,
//         time: time,
//         type: type,
//       );
// }

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${NoteFields.id} $idType, 
  ${NoteFields.isImportant} $boolType,
  ${NoteFields.number} $textType,
  ${NoteFields.title} $textType,
  ${NoteFields.description} $textType,
  ${NoteFields.time} $textType
  )
''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future delete() async {
    final db = await instance.database;
    await db.delete(tableNotes);
    // return await db.delete(
    //   tableNotes,
    //   where: '${NoteFields.id} = ?',
    //   whereArgs: [id],
    // );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, title, description, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Note {
  final int? id;
  bool isImportant;
  final String number;
  final String title;
  final String description;
  final DateTime createdTime;

  Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Note copy({
    int? id,
    bool? isImportant,
    String? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number].toString(),
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
