import 'package:flutter/material.dart';
import 'package:rider_app/widgets/divider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 255.0,
      child: Drawer(
        child: ListView(
          children: [
            Container(
              height: 165.0,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/user_icon.png',
                      height: 65.0,
                      width: 65.0,
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Profile Name',
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: 'Brand Bold'),
                        ),
                        SizedBox(height: 6.0),
                        Text('Visit Profile'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.history),
              title: Text(
                'History',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Visit Profile',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'About',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
