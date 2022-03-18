import 'package:socket_io/socket_io.dart';

main() {
  // Dart server
  var io = Server();
  io.on('connection', (client) {
    print('connection');
    client.on('isConnected', (data) {
      print('Result => $data');
      client.emit('connectionStatus', "success");
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
  });
  io.listen(8083);
}
