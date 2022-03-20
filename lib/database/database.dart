import 'dart:developer';

import 'package:postgres/postgres.dart';

class Database {
  PostgreSQLConnection? connection;
  List<dynamic> fetchDataFuture = [];
  static const String databaseName = 'user_data';

  Database() {
    connection = (connection == null || connection!.isClosed == true
        ? PostgreSQLConnection(
            // for external device like mobile phone use domain.com or
            // your computer machine IP address (i.e,192.168.0.1,etc)
            // when using AVD add this IP 10.0.2.2
            '10.0.2.2',
            5432,
            'postgres',
            username: 'postgres',
            password: '3003',
            timeoutInSeconds: 30,
            queryTimeoutInSeconds: 30,
            timeZone: 'UTC',
            useSSL: false,
            isUnixSocket: false,
          )
        : connection);

    fetchDataFuture = [];
  }

  // -- REGISTER Database Section [START] --
  Future<void> registration(
    String email,
    String password,
    String mobile,
  ) async {
    try {
      await connection!.open();
      await connection!.transaction(
        (connection) async {
          // -- check auth already or not
          PostgreSQLResult alreadyRegistered = await connection.query(
            'select * from $databaseName where email = @emailValue OR mobile = @mobileValue',
            substitutionValues: {'emailValue': email, 'mobileValue': mobile},
            allowReuse: true,
            timeoutInSeconds: 30,
          );
          if (alreadyRegistered.affectedRowCount > 0) {
            // we can get data from DB, etc..
            log('already registered');
          } else {
            PostgreSQLResult registrationResult = await connection.query(
              'insert into $databaseName(email,password,mobile,registerDate,role,isSeller)'
              'values(@emailValue,@passwordValue,@mobileValue,@registrationValue,@roleValue,@isSellerValue)',
              substitutionValues: {
                'emailValue': email,
                'passwordValue': password,
                'mobileValue': mobile,
                'registrationValue': DateTime.now(),
                'isSellerValue': true,
              },
              allowReuse: true,
              timeoutInSeconds: 30,
            );
          }
        },
      );
    } catch (_) {
      log('registration failed ooops');
    }
  }

  // -- LOGIN Database Section [START] --

  Future<void> loginUser(
    String email,
    String password,
  ) async {
    try {
      await connection!.open();
      await connection!.transaction(
        (connection) async {
          PostgreSQLResult loginResult = await connection.query(
            'select email,password,mobile,role from $databaseName email= @emailValue order by idDB',
            substitutionValues: {
              'emailValue': email,
            },
            allowReuse: true,
            timeoutInSeconds: 30,
          );
          if (loginResult.affectedRowCount > 0) {
            // we can get some data from bd
            String email =
                loginResult.first.elementAt(1); //..first.contains(password)
            log('email: $email');
          }
        },
      );
    } catch (_) {}
  }

// -- UPDATE Database Section [START] --
  Future<void> updateData(String name) async {
    try {
      await connection!.open();
      await connection!.transaction(
        (connection) async {
          PostgreSQLResult updateResult = await connection.query(
            'update $databaseName set name = @nameValue where email= @emailValue',
            substitutionValues: {
              'nameValue': name,
            },
            allowReuse: true,
            timeoutInSeconds: 30,
          );
        },
      );
    } catch (_) {}
  }
}
