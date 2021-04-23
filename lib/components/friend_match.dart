import 'package:flutter/material.dart';

class FriendMatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                'https://placeimg.com/640/480/any',
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
            const ListTile(
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                    child: InkWell(
                        onTap: () => myOnTap, // needed
                        child: Image.asset(
                          "assets/images/gaming.png",
                          width: 70,
                          fit: BoxFit.cover,
                        ))),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

myOnTap() {
  return print("Apertou");
}
