import 'event_observer.dart';

abstract class EventNotify {
  final List<EventObserver> _observerList = List.empty(growable: true);

  void subscribe(EventObserver o) {
    if (_observerList.contains(o)) return;

    _observerList.add(o);
  }

  bool unsubscribe(EventObserver o) {
    if (_observerList.contains(o)) {
      _observerList.remove(o);
      return true;
    } else {
      return false;
    }
  }

  void notify(String key, dynamic value) {
    for (final element in _observerList) {
      element.notify(key, value);
    }
  }

  void notifyAll(Map<String, dynamic> event) {
    for (final element in event.entries) {
      notify(element.key, element.value);
    }
  }
}
