import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepagestate();
}

class _homepagestate extends State<homepage> {
  int? _gender = 1;
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();

  String _bmistatus = '';
  String userInput = '';
  String Alamatinput = '';
  late double _result = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                    labelText: 'Nama lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    prefixIcon: Icon(Icons.account_box_outlined)),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                    labelText: 'Alamat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    prefixIcon: Icon(Icons.location_city_outlined)),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _umurController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    labelText: 'Umur anda saat ini',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    prefixIcon: Icon(Icons.cake_outlined)),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    labelText: 'berat badan(kg)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    helperText: 'Mohon masukkan dalam bentuk angka',
                    prefixIcon: Icon(Icons.trending_up_outlined)),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    labelText: 'Tinggi badan anda',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    helperText: 'Mohon masukkan dalam bentuk angka',
                    prefixIcon: Icon(Icons.height_outlined)),
              ),
              SizedBox(height: 20),
              Text('Apa jenis kelamin anda?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              RadioListTile(
                  title: Text('Laki laki'),
                  value: 1,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  }),
              RadioListTile(
                  title: Text('Perempuan'),
                  value: 2,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateBMI,
                child: Text('Kalkulator'),
              ),
              SizedBox(height: 20),
              Text(
                _result == -1 ? "enter value" : "${_result.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'jenis berat badan anda: ${_bmistatus}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Nama anda: ${_namaController.text}'),
              SizedBox(height: 8),
              Text('Alamat anda: ${_alamatController.text}'),
              SizedBox(height: 8),
              Text('Umur anda: ${_umurController.text}'),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100;

    double heightsquare = height * height;
    double result = weight / heightsquare;
    String bmiStatus;

    if (result < 25) {
      bmiStatus = 'normal';
    } else if (result < 18) {
      bmiStatus = 'kurus';
    } else if (result > 25) {
      bmiStatus = 'gemuk';
    } else {
      bmiStatus = 'tidak dapat diidentifikasi';
    }

    setState(() {
      _result = result;
      _bmistatus = bmiStatus;
    });
  }
}
