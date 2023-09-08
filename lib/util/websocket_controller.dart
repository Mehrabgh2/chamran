import 'dart:convert';

import 'package:chamran/model/widget/dm_widget.dart';
import 'package:chamran/model/widget/widget_value.dart';
import 'package:chamran/util/app_util.dart';
import 'package:chamran/util/constants.dart';
import 'package:chamran/util/websocket_command_helper.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketController extends GetxController {
  WebSocketController();
  IOWebSocketChannel? channel;
  List<DMWidget>? widgets;
  Function(WidgetValue?)? onResponse;

  void init(List<DMWidget>? widgets, String? token,
      Function(WidgetValue?) onResponse) {
    this.widgets = widgets;
    this.onResponse = onResponse;
    closeConnection();
    createChannel(token);
    listenChannel();
    connectChannel(widgets);
  }

  void createChannel(String? token) {
    try {
      channel = IOWebSocketChannel.connect(
        Uri.parse('${Constants.socketUrl}?token=$token'),
      );
    } catch (ex) {
      AppUtil.print('webSocket exception on connecting : $ex');
    }
  }

  void connectChannel(List<DMWidget>? widgets) {
    if (widgets != null) {
      channel!.sink
          .add(json.encode(WebsocketCommandHelper.firstCommand(widgets)));
      for (var element in widgets) {
        channel!.sink
            .add(json.encode(WebsocketCommandHelper.secondCommand(element)));
      }
    }
  }

  void listenChannel() {
    channel!.stream.listen(
      (event) {
        AppUtil.print(event);
        try {
          WidgetValue widgetValue = WidgetValue.fromJson(json.decode(event));
          onResponse!(widgetValue);
        } catch (_) {}
      },
    );
  }

  void closeConnection() {
    if (channel != null) {
      channel!.sink.close();
      channel = null;
    }
  }

  @override
  void onClose() {
    closeConnection();
    super.onClose();
  }
}
