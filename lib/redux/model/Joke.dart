class Joke {
  String sid;
  String text;
  String type;
  String thumbnail;
  String video;
  String images;
  String up;
  String down;
  String forward;
  String comment;
  String uid;
  String name;
  String header;
  String topCommentsContent;
  String topCommentsVoiceuri;
  String topCommentsUid;
  String topCommentsName;
  String topCommentsHeader;
  String passtime;

  static Joke parse(Map<String, dynamic> data) {
    Joke s = Joke();
    if (data != null) {
      try {
        s.sid = data['sid'];
        s.text = data['text'];
        s.type = data['type'];
        s.thumbnail = data['thumbnail'];
        s.video = data['video'];
        s.images = data['images'];
        s.up = data['up'];
        s.down = data['down'];
        s.forward = data['forward'];
        s.comment = data['comment'];
        s.uid = data['uid'];
        s.name = data['name'];
        s.header = data['header'];
        s.topCommentsContent = data['top_comments_content'];
        s.topCommentsVoiceuri = data['top_comments_voiceuri'];
        s.topCommentsUid = data['top_comments_uid'];
        s.topCommentsName = data['top_comments_name'];
        s.topCommentsHeader = data['top_comments_header'];
        s.passtime = data['passtime'];
        return s;
      } catch (e) {
        print('解析Joke对象出错：$e');
      }
    }
    return null;
  }
}
