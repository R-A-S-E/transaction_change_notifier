import 'package:change_notifier/src/features/home/home_controller.dart';
import 'package:change_notifier/src/features/home/widgets/transaction_bottom_sheet/transaction_bottom_shett_widget.dart';
import 'package:change_notifier/src/features/home/widgets/transaction_widget.dart';
import 'package:change_notifier/src/shared/services/current_states.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          OutlinedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => TransactionBottomShettWidget(
                    isEntrada: false,
                    onTap: (transaction) =>
                        controller.setTransaction(transaction),
                  ),
                );
              },
              child: const Text('Remover')),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => TransactionBottomShettWidget(
                  isEntrada: true,
                  onTap: (transaction) =>
                      controller.setTransaction(transaction),
                ),
              );
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return SizedBox(
              child: controller.status == CurrentStatus.empty
                  ? const Center(child: Text('Tá vázio'))
                  : controller.status == CurrentStatus.loading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView(
                            children: controller.transactions
                                .map((e) => TransactionWidget(transaction: e))
                                .toList(),
                          ),
                        ),
            );
          }),
    );
  }
}
