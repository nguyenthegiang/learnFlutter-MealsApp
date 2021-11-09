import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String description, bool currentValue) {
    //Phải viết thêm mấy dòng này vì code mẫu bị sai, chắc là do version
    switch (title) {
      case 'Gluten-free':
        return SwitchListTile(
          title: Text(title),
          value: currentValue,
          subtitle: Text(description),
          onChanged: updateGluten,
        );
      case 'Lactose-free':
        return SwitchListTile(
          title: Text(title),
          value: currentValue,
          subtitle: Text(description),
          onChanged: updateLactose,
        );
      case 'Vegetarian':
        return SwitchListTile(
          title: Text(title),
          value: currentValue,
          subtitle: Text(description),
          onChanged: updateVeget,
        );
      case 'Vegan':
        return SwitchListTile(
          title: Text(title),
          value: currentValue,
          subtitle: Text(description),
          onChanged: updateVegan,
        );
      default:
        return const Text('Why is this happenning?');
    }
  }

  //Phải viết thêm mấy hàm này vì code mẫu bị sai, chắc là do version
  void updateGluten(bool newValue) {
    setState(() {
      _glutenFree = newValue;
    });
  }

  void updateLactose(bool newValue) {
    setState(() {
      _lactoseFree = newValue;
    });
  }

  void updateVeget(bool newValue) {
    setState(() {
      _vegetarian = newValue;
    });
  }

  void updateVegan(bool newValue) {
    setState(() {
      _vegan = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
