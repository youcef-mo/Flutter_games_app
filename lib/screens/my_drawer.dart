import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({@required this.title, @required this.icon});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(
    title: "Steam",
    icon: MdiIcons.steam,
  ),
  ButtonsInfo(
    title: "Games",
    icon: MdiIcons.gamepadVariant,
  ),
  ButtonsInfo(
    title: "Upcoming",
    icon: MdiIcons.fire,
  ),
  ButtonsInfo(
    title: "Library",
    icon: MdiIcons.layers,
  ),
];

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              ClipOval(
                child: Image.asset(
                  "images/eevee.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Center(
                  child: Text(
                    "Admin Menu",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.cyanAccent,
                                  Colors.blueAccent,
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: TextStyle(
                            color: Colors.blue[800],
                          ),
                        ),
                        leading: Icon(
                          _buttonNames[index].icon,
                          size: 38,
                          color: Colors.blue[800],
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
