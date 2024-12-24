import 'package:bmi_app/src/core/widgets/custom_btn.dart';
import 'package:bmi_app/src/core/widgets/custom_txt_form.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  TextEditingController heigtcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();

  String result = '';

  @override
  void dispose() {
    super.dispose();
    heigtcontroller.dispose();
    weightcontroller.dispose();
  }

  void calculateBMI() {
    String heightText = heigtcontroller.text;
    String weightText = weightcontroller.text;

    if (heightText.isNotEmpty && weightText.isNotEmpty) {
      double height = double.parse(heightText) / 100;
      double weight = double.parse(weightText);

      double bmi = weight / (height * height);

      setState(() {
        result = 'مؤشر كتلة الجسم: ${bmi.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        result = 'برجاء إدخال الطول والوزن';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حساب الكتلة'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
            child: SizedBox(
              height: 60,
              width: 300,
              child: CustomTextForm(
                prefixicon: const Icon(Icons.height),
                namecontroller: heigtcontroller,
                hintText: 'ادخل الطول',
                label: "برجاء ادخال الطول بالسنتيمترات",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "برجاء ادخال قيمة";
                  }
                  if (value.length > 3) {
                    return 'برجاء ادخال الطول الصحيح';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            width: 300,
            child: CustomTextForm(
              namecontroller: weightcontroller,
              prefixicon: const Icon(Icons.line_weight),
              hintText: 'ادخل الوزن',
              label: 'الوزن بالكيلوجرامات',
              validator: (value) {
                if (value!.isEmpty) {
                  return "برجاء ادخال قيمة";
                }
                if (value.length > 3) {
                  return 'برجاء ادخال الوزن الصحيح';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 45),
          CustomButton(
            text: 'احسب الكتلة',
            width: 318,
            height: 45,
            onPressed: calculateBMI,
          ),
          const SizedBox(height: 20),
          Text(
            result,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
