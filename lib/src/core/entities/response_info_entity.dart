class ResponseInfoEntity {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  ResponseInfoEntity(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});
}
