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
      title: json['title'],
      companyName: json['company_name'],
      location: json['candidate_required_location'],
      url: json['url'],
    );
  }
}
