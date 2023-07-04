class BusinessEntity {
  final String name;
  final String ownerName;
  final String ownerPhone;
  final String managementUnit;
  final String updateAt;

  BusinessEntity({
    required this.name,
    required this.ownerName,
    required this.ownerPhone,
    required this.managementUnit,
    this.updateAt = '',
  });
}
