import 'package:flutter/material.dart';
import 'package:teknolojirenault/main.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/cupertino.dart';
class Settings extends StatefulWidget{
  const Settings ({Key? key}) : super (key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ayarlar"),
      ),
      body:  SettingsList(
        sections: [
          SettingsSection(
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Dil'),
                value: Text('Türkçe'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Özel temayı etkinleştir'),
              ),
            ],
          ),
        ],
      ),
    );
  }}
