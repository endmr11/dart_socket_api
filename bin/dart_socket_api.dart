import 'package:socket_io/socket_io.dart';

main() {
  // Dart server
  var io = Server();
  io.on('connection', (client) {
    print("Connection=> ${(client as Socket).id}");
    client.on('isConnected', (data) {
      print('Result => $data');
      client.emit('connectionStatus', "success: ${(client).id}");
    });

    client.on('createOrderSend', (data) {
      print('Result => $data');
      client.emit('createOrderResponse', data);
    });
    client.on('updateOrderSend', (data) {
      print('Result => $data');
      client.emit('updateOrderResponse', data);
    });
    client.on('deleteOrderSend', (data) {
      print('Result => $data');
      client.emit('deleteOrderResponse', data);
    });

    client.on("disconnecting", (data) {
      print("Disconnecting=> ${(client).id}");
      print("Disconnecting=> $data");
    });

    client.on("disconnect", (data) {
      print("Disconnect=> $data");
    });
  });
  io.listen(8083);
}
