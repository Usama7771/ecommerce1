import 'package:android_proj/enum.dart';
import 'package:android_proj/shared/cache_helper.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user-profile-icon-free-vector.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              '${CacheHelper.getString(key: SharedKey.accountName)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${CacheHelper.getString(key: SharedKey.email)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('${CacheHelper.getString(key: SharedKey.phoneNumber)}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
