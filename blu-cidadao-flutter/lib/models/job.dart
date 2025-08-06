class Job {
  final String title;
  final String companyName;
  final String location;
  final String url;

  Job({
    required this.title,
    required this.companyName,
    required this.location,
    required this.url,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'] ?? 'Sem título',
      companyName: json['company']?['display_name'] ?? 'Empresa não informada',
      location: json['location']?['display_name'] ?? 'Local não informado',
      url: json['redirect_url'] ?? '',
    );
  }
}
