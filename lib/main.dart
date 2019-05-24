import 'package:flutter/material.dart';
import './utils/database_helper.dart';
import 'models/user.dart';


List _users;
void main() async
{

  var db= new DatabaseHelper();
  //Add user
  
  int saveduser = await db.saveUser(new User("Abcd","saRA"));
//Print
  print("User saved $saveduser");

  _users = await db.getAllUsers();
  for(int i=0;i<_users.length;i++)
  {
    User user =User.map(_users[i]);
    //Print
    print("Username: ${user.userrname}"); 
  }
// await db.saveUser(new User("Bonita","heylo"));
  int count=await db.getCount();
  print("Count: $count");

//Ret
  User ana = await db.getUser(1);
  User anaUpdated = User.fromMap({
    "username":"UpdatedAna",
    "password":"updatedPassword",
    "id"      :1
  }); 


  //Delete a User
  int userDeleted = await db.deleteUser(2);
  print("Deleted User: $userDeleted");

  runApp(
    new MaterialApp(
      home: Home(),
      title: 'database',
      theme: ThemeData(
        
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
    )
    
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,
                    title: new Text("Database"),centerTitle: true, ),
      body: new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, int position){
            return new Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
               title: Text("Users: ${User.fromMap(_users[position]).userrname}"),
               subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"), 
              ),
            );
        } ,
        ) ,
      
    );
  }
}