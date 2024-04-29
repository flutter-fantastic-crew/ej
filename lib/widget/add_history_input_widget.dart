import 'package:flutter/material.dart';
import 'package:scone_clone/utils/text_input_formatter.dart';
import 'package:scone_clone/widget/text_field_widget.dart';

class AddHistoryInputWidget extends StatefulWidget {
  final TextEditingController controller;

  const AddHistoryInputWidget({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _AddHistoryInputWidgetStatus();
}

class _AddHistoryInputWidgetStatus extends State<AddHistoryInputWidget> {
  bool _isConsumption = true;
  bool _isDeleteIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => setState(() {
              _isConsumption = !_isConsumption;
            }),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFF6F6F6),
              surfaceTintColor: const Color(0xFFF6F6F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              shadowColor: Colors.transparent,
              minimumSize: const Size(50, 50),
              padding: const EdgeInsets.all(0),
            ),
            child: _isConsumption
                ? const Icon(Icons.remove)
                : const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextFieldWidget(
                onChanged: (value) {
                  setState(() {
                    _isDeleteIconVisible = value.isNotEmpty;
                  });
                },
                controller: widget.controller,
                hintText: _isConsumption ? '소비 금액' : '수입 금액',
                hintStyle: const TextStyle(color: Color(0xFFBEBEBE)),
                suffix: _isDeleteIconVisible
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.controller.clear();
                              setState(() {
                                _isDeleteIconVisible = false;
                              });
                            },
                            child: const Icon(
                              Icons.cancel,
                              color: Color(0xFFC4C4C4),
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '원',
                            style: TextStyle(
                              color: Color(0xFF828282),
                            ),
                          )
                        ],
                      )
                    : const Text(
                        '원',
                        style: TextStyle(
                          color: Color(0xFF828282),
                        ),
                      ),
                inputFormatters: [
                  CurrencyInputFormatter(),
                ],
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
