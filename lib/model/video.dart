class Video {
  String id;
  String titulo;
  String imagem;
  String canal;
  String description;

  Video({
    this.id,
    this.titulo,
    this.imagem,
    this.canal,
    this.description,
  });

  static conveterJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      description: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      description: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }

  @override
  String toString() {
    return 'Video{id: $id, titulo: $titulo, imagem: $imagem, canal: $canal, description: $description}';
  }
}
