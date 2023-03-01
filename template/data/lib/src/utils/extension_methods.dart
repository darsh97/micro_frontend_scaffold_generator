int compare(int? a, int? b) {
  if (a == null || b == null) return 0;

  return a.compareTo(b);
}

extension ListExtensions<E> on List<E> {
  List<T> convertNotNull<T>(T Function(E e) f) {
    return where((element) => element != null).map((e) => f(e)).toList();
  }
}
