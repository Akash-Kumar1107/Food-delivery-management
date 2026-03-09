import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/food_model.dart';
import '../../services/app_state.dart';
import '../../data/menu_data.dart';

class AddFoodScreen extends StatefulWidget {
  final AppState appState;

  const AddFoodScreen({super.key, required this.appState});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _block = MenuData.blocks.first;
  String _category = '';
  double _price = 0;
  String _imageUrl = '';
  String _description = '';
  bool _isVeg = true;

  @override
  void initState() {
    super.initState();
    _category = MenuData.categoriesForBlock(_block).first;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newFood = FoodItem(
        id: 'custom_${DateTime.now().millisecondsSinceEpoch}',
        name: _name,
        category: _category,
        block: _block,
        price: _price,
        imageUrl: _imageUrl,
        description: _description,
        isVeg: _isVeg,
      );

      widget.appState.addCustomFood(newFood);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$_name added successfully!'), backgroundColor: AppColors.primary),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Food Item', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textDark),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Food Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (v) => v == null || v.isEmpty ? 'Please enter a name' : null,
                onSaved: (v) => _name = v!,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _block,
                decoration: InputDecoration(
                  labelText: 'Block',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                items: MenuData.blocks.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
                onChanged: (v) {
                  setState(() {
                    _block = v!;
                    _category = MenuData.categoriesForBlock(_block).first;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _category,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                items: MenuData.categoriesForBlock(_block).map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (v) => setState(() => _category = v!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Please enter a price';
                  if (double.tryParse(v) == null) return 'Please enter a valid number';
                  return null;
                },
                onSaved: (v) => _price = double.parse(v!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: 'https://example.com/image.jpg',
                ),
                validator: (v) => v == null || v.isEmpty ? 'Please enter an image URL' : null,
                onSaved: (v) => _imageUrl = v!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description (Optional)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onSaved: (v) => _description = v ?? '',
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Is Veg?'),
                value: _isVeg,
                onChanged: (v) => setState(() => _isVeg = v),
                activeColor: Colors.green,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Save Food Item', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
