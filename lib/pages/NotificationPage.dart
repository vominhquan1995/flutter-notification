import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:notification_example/pages/DetailNotificationPage.dart';

const listNotification = const <Notification>[
  const Notification(
      id: 1,
      title:
          'HUTECH thông báo tuyển sinh đào tạo trình độ Thạc sĩ năm 2019 – Đợt 1',
      description:
          'Trường Đại học Công nghệ TP.Hồ Chí Minh (HUTECH) thông báo tuyển sinh đào tạo trình độ Thạc sĩ đợt 1 - năm 2019 với 11 chuyên ngành gồm: Kỹ thuật điện, Kỹ thuật cơ điện tử, Kỹ thuật môi trường, Kỹ thuật xây dựng, Công nghệ sinh học, Công nghệ thông tin, Công nghệ thực phẩm, Kế toán, Quản trị kinh doanh, Quản trị Dịch vụ du lịch và lữ hành, tiếng Anh.',
      body: '<h2>152 người Việt “biến mất” tại Đài Loan đã dấy lên rất nhiều những quan ngại sâu sắc về việc lợi dụng chính sách để phục vụ mục đích cá nhân gây ảnh hưởng đến uy tín, hình ảnh của Việt Nam.</h2> <p>Ngày 26/12, Focus Taiwan dẫn lời cục Du lịch Đài Loan cho biết, 409 trong tổng số 566 du khách nước ngoài đến Đài Loan theo chương trình nới lỏng thủ tục xin thị thực và biến mất là du khách người Việt.</p> <p>Vì đâu mà những du khách biến mất ở Đài Loan kia lại tự biến mình thành người Việt xấu xí như vậy?</p> <figure><img alt="Bạn đọc viết - Chân dung 152 người Việt xấu xí " src="https://media1.nguoiduatin.vn/media/duong-thu/2018/12/27/nguoi-viet-bien-mat-o-dai-loan.jpg" width="450" height="269"> <figcaption> <h3>Hình ảnh camera tại khách sạn ghi cảnh được cho là những người Việt "biến mất" ở Đài Loan.</h3> </figcaption> </figure> <p>Theo tìm hiểu, việc đi xuất khẩu lao động ở Đài Loan hiện nay có mức chi phí thuộc loại thấp nhất trong các nước. Với thời hạn hợp đồng 3 năm, mức chi phí đi Đài Loan chỉ từ 40 triệu đồng đến 120 triệu đồng. Đây là thông tin tham khảo từ một số địa chỉ tư vấn xuất khẩu lao động uy tín.</p> <p>Thêm nữa, các thủ tục đi Đài Loan cũng không quá phức tạp theo con đường chính thống này.</p> <p>Thế nhưng, 152 người đã bất chấp để đi theo con đường du lịch và mang về cho đất nước không phải là sự giàu mạnh, phát triển, là kinh nghiệm hay bất cứ một sự tiên tiến nào mà là bước thụt lùi về nhân cách kèm theo những rắc rối khó có thể gỡ trong ngày một ngày hai với các cơ quan quản lý Nhà nước.</p> <p>Rồi đây, họ sẽ còn phải đối mặt với những xử lý vi phạm trong việc xuất nhập cảnh, không loại trừ vi phạm cả về luật pháp. Như vậy thử hỏi có đáng không?</p> <p><em>*Bài viết thể hiện quan điểm riêng của tác giả.</em></p>'),
  const Notification(
      id: 2,
      title:
          'HUTECH tổ chức lấy ý kiến sinh viên về hoạt động giảng dạy năm học 2018 - 2019',
      description:
          'Gắn với mục tiêu đảm bảo quyền lợi học tập của sinh viên, duy trì và nâng cao chất lượng giáo dục, đào tạo toàn diện, trong nhiều năm qua, công tác “Lấy ý kiến phản hồi từ người học về hoạt động giảng dạy của giảng viên” là nhiệm vụ bắt buộc tại cuối mỗi học kỳ của Trường Đại học Công nghệ TP.HCM (HUTECH). Đây cũng được xem là hoạt động trọng tâm, nằm trong chuỗi các hoạt động khảo sát ý kiến các bên liên quan nhằm nâng cao chất lượng dạy và học của Nhà trường.',
      body: '<p>Các nhân viên thiết kế dành nhiều thời gian sáng tạo và suy nghĩ về các thiết kế và trang trí cho phòng ngủ. Họ dành toàn bộ thời gian, sức lực để tạo ra các mẫu thiết kế khác nhau. Và ngạc nhiên thay họ phát hiện ra rằng có một vài điểm tương đồng bao quát trong các thiết kế của họ. Và từ đó, họ cho rằng đây chính là yếu tố cần có để cho ra một thiết kế phòng ngủ mơ ước. Dưới đây là 4 điều họ tìm ra và bạn có thể xem xét để ứng dụng vào thiết kế phòng ngủ của mình.</p><p><b>1. Chiếc giường êm ái và ấm cúng </b></p><p>Không có gì ngạc nhiên khi ai trong chúng ta cũng thèm muốn những chiếc giường có kích thước lớn. Các nhà thiết kế rất ủng hộ một thiết kế giường kingsize nơi bạn có thể có được một giấc ngủ chất lượng.&nbsp;Và nếu có một chiếc giường lớn, êm ái rồi thì hãy đóng khung nó.&nbsp;Thêm khung bao thật hoành tráng. Hoặc, nếu bạn muốn mang đến cho căn phòng của bạn thêm cảm giác ấm cúng, hãy thử thiết kế giường từ Pottery Barn hoặc khung giường bọc nệm&nbsp;từ Joss &amp; Main.&nbsp;Thêm đệm lót xung quanh nệm của bạn để giúp trải nghiệm của giấc ngủ thoải mái và ấm cúng hơn.</p><div type="Photo"><div><img src="http://afamilycdn.com/thumb_w/650/2018/12/19/1-1545208979216262123448.jpg" w="900" h="606" alt="4 điều cần lưu ý để giúp phòng ngủ của bạn trở thành nơi thoải mái như trong mơ - Ảnh 1." title="4 điều cần lưu ý để giúp phòng ngủ của bạn trở thành nơi thoải mái như trong mơ - Ảnh 1." rel="lightbox" photoid="17215d30-036a-11e9-92df-9590dabe6490" type="photo" data-original="http://afamilycdn.com/2018/12/19/1-1545208979216262123448.jpg" width="" height=""></div><div><p data-placeholder="[nhập chú thích]"></p></div></div><p><b>2. Bộ đồ giường</b></p><p>Khi nói đến giường, chúng ta thường nhắc đến rất nhiều thứ. Từ gối, đệm, chăn, ga... phải lựa chọn màu và hoa văn khá tốn công sức và thời gian. Nếu bạn là người muốn linh hoạt thay đổi các màu sắc và hoa văn trên giường theo mùa hoặc sở thích thì nên lựa chọn một vỏ chăn màu trung tinh làm nền. Thêm&nbsp;những ý tưởng&nbsp;giường ngủ sang trọng&nbsp;cho bạn nhờ hoa văn từ chăn và gối.</p><div type="Photo"><div><img src="http://afamilycdn.com/thumb_w/650/2018/12/19/2-1545208979220318352838.jpg" w="900" h="900" alt="4 điều cần lưu ý để giúp phòng ngủ của bạn trở thành nơi thoải mái như trong mơ - Ảnh 2." title="4 điều cần lưu ý để giúp phòng ngủ của bạn trở thành nơi thoải mái như trong mơ - Ảnh 2." rel="lightbox" photoid="1734e530-036a-11e9-8de3-617f6d170145" type="photo" data-original="http://afamilycdn.com/2018/12/19/2-1545208979220318352838.jpg" width="" height=""></div><div><p data-placeholder="[nhập chú thích]"></p></div></div><p><b>3. Tủ quần áo to và đẹp</b></p><p>Tất nhiên, mỗi một người trong chúng ta đều thích có một&nbsp;tủ quần áo không bị hạn chế.&nbsp;Tuy nhiên ngôi nhà không có đủ diện tích để làm điều này bạn có thể tiết chế lại sở thích của mình và tạo ra một khu vực lựa đồ rộng hơn. Khi bước vào chọn trang phục hoặc chiêm ngưỡng những bộ quần áo thì bạn sẽ có cảm giác thích thú.&nbsp;</p><p>Còn không gian quá hẹp thì nên tiết chế tất cả mọi thứ và lựa chọn một mẫu tủ không có cửa. Những bộ đồ long lanh có thể hiển thị ngay trước mắt khi bạn vừa bước vào, đồng thời ăn gian được diện tích phòng. Một mẹo nhỏ khác là bạn có thể sử dụng các móc treo bằng vải nhung và sắp xếp các món đồ tương tự từ ngắn đến dài để tủ quần áo mở của bạn đẹp mắt hơn.</p><p>Bạn vẫn cảm thấy tù túng? Giải pháp cuối cùng là giải phóng không gian tủ quần áo bằng cách thêm một băng ghế dự trữ vào chân giường của bạn.&nbsp;Điều này không chỉ tạo ra một nơi tuyệt vời để cất những món đồ cồng kềnh như áo len và chăn, nó còn tạo thêm sự hoàn thiện cho chiếc giường của bạn và cho bạn một nơi thuận tiện để đặt giày hoặc cất túi.</p><div type="Photo"><div><img src="http://afamilycdn.com/thumb_w/650/2018/12/19/3-15452089792221739312945.jpg" w="900" h="809" alt="4 điều cần lưu ý để giúp phòng ngủ của bạn trở thành nơi thoải mái như trong mơ - Ảnh 3." title="4 điều cần lưu ý để giúp phòng ngủ của bạn trở thành nơi thoải mái như trong mơ - Ảnh 3." rel="lightbox" photoid="17462340-036a-11e9-9d23-d366578a7c66" type="photo" data-original="http://afamilycdn.com/2018/12/19/3-15452089792221739312945.jpg" width="" height=""></div><div><p data-placeholder="[nhập chú thích]"></p></div></div><p><b>4. Bầu không khí sang trọng và yên bình </b></p><p>Phòng ngủ của bạn là một nơi nghỉ ngơi, một nơi mà bạn có thể có được sự bình yên và yên tĩnh khi bạn cần. Để tạo ra phòng ngủ mơ ước của bạn, hãy tạo ra bầu không khí sang trọng và yên bình để mang tới những rung cảm lý tưởng.&nbsp;Điều đó không có nghĩa là bạn phải sử dụng tông màu trầm và ánh sáng mờ.&nbsp;Có thể rất nhiều gam màu đậm lại mang tới cảm giác thoải mái cho bạn.&nbsp;Phòng ngủ của bạn và không gian của bạn, hãy lựa chọn màu sắc nào mình cảm thấy thoải mái nhất.</p><p>Các nhà thiết kế cũng khuyến khích thêm những điểm nhấn nhỏ giúp tạo ra bầu không khí như nến thơm, họa tiết ấm cúng (như tấm thảm có hoa văn mềm mại) và ánh sáng phù hợp.&nbsp;Một số người thích có cửa sổ nhìn ra khu vực ngoài trời rộng rãi, xanh mát. Tuy nhiên, nếu bạn không có cửa sổ, bạn có thể bắt chước cảm giác đó bằng nghệ thuật ăn gian: đặt gương để thêm ánh sáng cho căn phòng.</p><div type="Photo"><div><img src="http://afamilycdn.com/thumb_w/650/2018/12/19/4-1545208979225661711590.jpg" w="900" h="602" alt="4 điều cần lưu ý để giúp phòng ngủ của bạn trở thành nơi thoải mái như trong mơ - Ảnh 4." title="4 điều cần lưu ý để giúp phòng ngủ của bạn trở thành nơi thoải mái như trong mơ - Ảnh 4." rel="lightbox" photoid="1757fd90-036a-11e9-8de3-617f6d170145" type="photo" data-original="http://afamilycdn.com/2018/12/19/4-1545208979225661711590.jpg" width="" height=""></div><div><p data-placeholder="[nhập chú thích]"></p></div></div><p><i>Theo Freshome</i></p>')
];

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);
  @override
  State<NotificationPage> createState() => new _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Thông báo"),
        ),
        body: new ListView.builder(
            itemCount: listNotification.length,
            itemBuilder: (context, i) {
              return Container(
                padding: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  border: new Border(
                    bottom: new BorderSide(
                        style: BorderStyle.solid, color: Colors.black26),
                  ),
                ),
                child: NotificationItem(listNotification[i]),
              );
            }));
  }
}

class Notification {
  final int id;
  final String title;
  final String description;
  final String icon;
  final String body;
  const Notification(
      {this.id, this.title, this.description, this.icon, this.body});
}

class NotificationItem extends StatelessWidget {
  final Notification _notification;
  NotificationItem(this._notification);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailNotificationPage(
                      notification: this._notification)));
        },
        child: ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications, color: Colors.amber),
            ),
            title: Text(_notification.title),
            isThreeLine: true,
            dense: true,
            subtitle: Text(
              _notification.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )));
  }
}

class NotificationList extends StatelessWidget {
  final List<Notification> _notification;

  NotificationList(this._notification);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _buildContactList());
  }

  List<NotificationItem> _buildContactList() {
    return _notification.map((contact) => NotificationItem(contact)).toList();
  }
}
