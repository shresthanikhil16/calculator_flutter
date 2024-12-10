import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final _textController = TextEditingController();
  List<String> lstSymbols = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];

  final _key = GlobalKey<FormState>();
  int first = 0;
  int second = 0;
  String operation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pratham Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                textDirection: TextDirection.rtl,
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: lstSymbols.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              100), // Slightly rounded edges
                        ),
                      ),
                      onPressed: () {
                        String symbol = lstSymbols[index];
                        setState(() {
                          if (symbol == "C") {
                            _textController.clear();
                            first = 0;
                            second = 0;
                            operation = "";
                          } else if (symbol == "<-") {
                            if (_textController.text.isNotEmpty) {
                              _textController.text = _textController.text
                                  .substring(
                                      0, _textController.text.length - 1);
                            }
                          } else if (symbol == "=") {
                            if (operation.isNotEmpty) {
                              second = int.tryParse(_textController.text) ?? 0;
                              switch (operation) {
                                case "+":
                                  _textController.text =
                                      (first + second).toString();
                                  break;
                                case "-":
                                  _textController.text =
                                      (first - second).toString();
                                  break;
                                case "*":
                                  _textController.text =
                                      (first * second).toString();
                                  break;
                                case "/":
                                  if (second != 0) {
                                    _textController.text =
                                        (first / second).toStringAsFixed(2);
                                  } else {
                                    _textController.text = "Error";
                                  }
                                  break;
                                case "%":
                                  _textController.text =
                                      (first % second).toString();
                                  break;
                              }
                              operation = "";
                            }
                          } else if (["+", "-", "*", "/", "%"]
                              .contains(symbol)) {
                            first = int.tryParse(_textController.text) ?? 0;
                            operation = symbol;
                            _textController.clear();
                          } else {
                            _textController.text += symbol;
                          }
                        });
                      },
                      child: Text(
                        lstSymbols[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
