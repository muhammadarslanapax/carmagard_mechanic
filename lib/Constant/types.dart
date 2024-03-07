import 'dart:convert';

/// The various ticket types
enum TicketTypes {
  technicalIssue("Technical Issue"),
  billingIssue("Billing Issue"),
  generalQuestion("General Question");

  final String shownName;
  const TicketTypes(this.shownName);

  String toJson() =>
      json.encode(shownName.replaceFirst(" ", "_").toLowerCase());

  String toOriginal() => shownName.toLowerCase().replaceFirst(" ", "_");

  @override
  String toString() => shownName;
}

enum Priority {
  high("High"),
  medium("Medium"),
  low("Low");

  final String shownName;
  const Priority(this.shownName);

  String toJson() => json.encode(name);

  @override
  String toString() => shownName;
}
