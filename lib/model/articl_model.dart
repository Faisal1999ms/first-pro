class Article {
  final String titel;
  final String dascription;
  final String imageurl;
  final String articleurl;

  Article({
    this.titel,
    this.dascription,
    this.imageurl,
    this.articleurl,
  });
  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
      titel: jsonData["title"],
      dascription: jsonData["description"],
      imageurl: jsonData["urlToImage"],
      articleurl: jsonData["url"],
    );
  }
}
//  "source": {  
//                 "id": null,
//                 "name": "Fal3arda.com"
//             },
//             "author": null,
//             "title": "الان live 1nd.. بث مباشر مانشستر سيتي ولايبزيج يلا شوت|| مشاهدة مباراة مانشستر سيتي ولايبزيج يلا كورة بث - في العارضة",
//             "description": "بث مباشر مانشستر سيتي ولايبزيج يلا شوت، نعرض من خلال موقع كورة في العارضة مشاهدة مباراة مانشستر سيتي ولايبزيج المواجهة الذي تعتبر تحصيل حاصل بين الثنائي، الذي",
//             "url": "https://kora.fal3arda.com/880480/%d8%a8%d8%ab-%d9%85%d8%a8%d8%a7%d8%b4%d8%b1-%d9%85%d8%a7%d9%86%d8%b4%d8%b3%d8%aa%d8%b1-%d8%b3%d9%8a%d8%aa%d9%8a-%d9%88%d9%84%d8%a7%d9%8a%d8%a8%d8%b2%d9%8a%d8%ac-%d9%8a%d9%84%d8%a7-%d8%b4%d9%88%d8%aa/",
//              : "https://cdn.fal3arda.com/wp-content/uploads/2021/12/مشاهدة-مباراة-مانشستر-سيتي-ولايبزيج-يلا-شوت-1638891913.jpg",
//             "publishedAt": "2021-12-07T17:41:26Z",
//             "content": "2021-12-07 .\r\n .\r\n.\r\n.\r\n8 .\r\nbein sports 2 hd premium .\r\n.\r\n .\r\n24 ."
//         },