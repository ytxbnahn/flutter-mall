import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

/// Event A.
class ChangeIndexTabEvent {
  int index;

  ChangeIndexTabEvent(this.index);
}
