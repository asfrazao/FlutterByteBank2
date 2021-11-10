import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {

  static const String tablsSql = 'CREATE TABLE $_tableName('
  '$_idField INTEGER PRIMARY KEY, '
  '$_nameField TEXT,   '
  '$_account_numberField INTEGER)';

  static const String _tableName = 'contacts';
  static const String _idField = 'id';
  static const String _nameField = 'name';
  static const String _account_numberField = 'account_number';

/*  Future<int> update(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = _toMap(contact);
    return db.update(
        _tableName,
        contactMap,
        where: 'id = ?',
      whereArgs: [contact.id],
    );
  }*/

/*  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }*/


  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);

    /*return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    //contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });*/
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    //contactMap['id'] = contact.id;
    contactMap[_nameField] = contact.name;
    contactMap[_account_numberField] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;

/*  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });*/
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_idField],
        row[_nameField],
        row[_account_numberField],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}