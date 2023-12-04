import 'package:flutter/material.dart';

class Transfer {
  double value;
  int recipientNumber;

  Transfer(this.value, this.recipientNumber);
}

class TransfersList {
  List<Transfer> transfers;

  TransfersList()
      : transfers = [
    Transfer(450000000.0, 450),
    Transfer(8001.0, 1234),
    Transfer(999998.0, 1111),
  ];

  void addTransfer(Transfer newTransfer) {
    transfers.add(newTransfer);
  }

  void removeTransfer(Transfer transferToRemove) {
    transfers.remove(transferToRemove);
  }

// Outros métodos podem ser adicionados conforme necessário, como pesquisar, editar, etc.
}

class TransfersPage extends StatelessWidget {
  final TransfersList transfersList = TransfersList();

  TransfersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: transfersList.transfers.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 165, 165),
                  radius: 12.0,
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ),
                title: Text(
                  "R\$ ${transfersList.transfers[index].value.toStringAsFixed(2)}",
                ),
                subtitle: Text(
                  "${transfersList.transfers[index].recipientNumber}",
                ),
              ),
              const Divider(
                height: 1.5,
                color: Color.fromARGB(255, 202, 202, 202),
              ),
            ],
          );
        },
      ),
      appBar: AppBar(
        title: const Text("Transferências"),
        backgroundColor: Colors.blue, // Define a cor de fundo da AppBar
        iconTheme: const IconThemeData(color: Colors.white), toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(color: Colors.white), // Define a cor do texto do título
        ).bodyMedium, titleTextStyle: const TextTheme(
          titleLarge: TextStyle(color: Colors.white), // Define a cor do texto do título
        ).titleLarge,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TransfersPage(),
  ));
}
