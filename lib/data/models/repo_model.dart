class RepoModel {
  final int id;
  final String name;
  final String fullName;
  final String? description;
  final String htmlUrl;
  final int stargazersCount;
  final String? language;
  final int forksCount;
  final int openIssuesCount;
  final String defaultBranch;
  final bool hasIssues;
  final bool hasProjects;
  final bool hasDownloads;
  final bool hasWiki;
  final bool archived;
  final bool disabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;

  RepoModel({
    required this.id,
    required this.name,
    required this.fullName,
    this.description,
    required this.htmlUrl,
    required this.stargazersCount,
    this.language,
    required this.forksCount,
    required this.openIssuesCount,
    required this.defaultBranch,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.archived,
    required this.disabled,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      description: json['description'],
      htmlUrl: json['html_url'],
      stargazersCount: json['stargazers_count'],
      language: json['language'],
      forksCount: json['forks_count'],
      openIssuesCount: json['open_issues_count'],
      defaultBranch: json['default_branch'],
      hasIssues: json['has_issues'],
      hasProjects: json['has_projects'],
      hasDownloads: json['has_downloads'],
      hasWiki: json['has_wiki'],
      archived: json['archived'],
      disabled: json['disabled'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pushedAt: DateTime.parse(json['pushed_at']),
    );
  }
}
