import 'package:change_notifier/src/features/home/models/transaction_model.dart';
import 'package:change_notifier/src/features/home/widgets/transaction_bottom_sheet/transaction_bottom_shett_controller.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

class TransactionBottomShettWidget extends StatefulWidget {
  final bool isEntrada;
  final Function(TransactionModel transaction) onTap;
  const TransactionBottomShettWidget(
      {super.key, required this.isEntrada, required this.onTap});

  @override
  State<TransactionBottomShettWidget> createState() =>
      _TransactionBottomShettWidgetState();
}

class _TransactionBottomShettWidgetState
    extends State<TransactionBottomShettWidget> {
  final TransactionBottoSheetController controller =
      TransactionBottoSheetController();
  @override
  void initState() {
    super.initState();
    controller.category = controller.categoryList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.isEntrada ? 'Entrada' : 'Saida'),
        const Divider(),
        Form(
            child: Column(
          children: [
            TextFormField(
              onChanged: (value) => controller.name = value,
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  return DropdownButton<String>(
                      dropdownColor: Colors.red,
                      value: controller.category,
                      items: controller.categoryList
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (a) {
                        controller.onChagedCategory(a ?? '');
                      });
                }),
            TextFormField(
              inputFormatters: [TextInputMask(mask: '99999999', reverse: true)],
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  controller.value = double.tryParse(value) ?? 0,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.onTap(controller.onTap(widget.isEntrada));
                  Navigator.pop(context);
                },
                child: const Text('Enviar'))
          ],
        ))
      ],
    );
  }
}
