import 'package:flutter/material.dart';

class Transfer {
  double value;
  DateTime date;

  Transfer(this.value, this.date);
}

class TransfersList {
  List<Transfer> transfers;

  TransfersList()
      : transfers = [
          Transfer(450000000.0, DateTime.now()),
          Transfer(436.0, DateTime.now().subtract(Duration(days: 1))),
          Transfer(8001.0, DateTime.now().subtract(Duration(days: 2))),
          Transfer(1234.0, DateTime.now().subtract(Duration(days: 3))),
          Transfer(999998.0, DateTime.now().subtract(Duration(days: 4))),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: ListView.builder(
        itemCount: transfersList.transfers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(
                      0.0), // Remove o padding padrão do ListTile
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 165, 165),
                    radius: 12.0, // Ajuste o valor conforme necessário
                    child: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 18.0, // Ajuste o valor conforme necessário
                    ),
                  ),
                  title: Text(
                      "${transfersList.transfers[index].value.toString()}"),
                  subtitle: Text(
                      transfersList.transfers[index].date.toIso8601String()),
                ),
                Divider(
                    height: 1.5,
                    color: Color.fromARGB(255, 202, 202,
                        202)), // Adiciona a borda após cada linha
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TransfersPage(),
  ));
}
