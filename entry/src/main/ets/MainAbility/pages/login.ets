import router from '@ohos.router';
import prompt from '@system.prompt';
import { DemoAccount } from "../common/AppConfig"
@Entry
@Component
struct Login {
  username: string = "";
  password: string = "";

  build() {
    Column({ space: 10 }) {
      Image($rawfile("njupt2.png")).width(10).height(10)
      // Image($r('app.media.icon'))
        .width(78)
        .height(78)
        .margin({ top: 120, bottom: 20 })
      Text('登录界面')
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182431')
      Text('登录账号以使用更多服务')
        .fontSize(16)
        .fontColor('#798189')
        .margin({ top: 20, bottom: 20 })

      Row({space: 5}) {
        Text('用户：')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        TextInput({
          placeholder: "请输入用户名"
        }).fontColor(Color.Black)
          .width('150')
          .onChange((value) => {
            this.username = value;
          })
      }
      .width('100%')
      .height(30)
      .margin({left:150})

      Row({space: 5}) {
        Text('密码：')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        TextInput({
          placeholder: "请输入密码"
        }).fontColor(Color.Black)
          .type(InputType.Password)
          .width('150')
          .onChange((value) => {
            this.password = value;
          })

      }
      .width('100%')
      .height(30)
      .margin({top:20,left:150})

      Row() {
        Text('短信验证码登录')
          .fontColor('#017DFF')
          .fontSize(15)
        Text('忘记密码')
          .fontColor('#017DFF')
          .fontSize(15)
      }.width('100%')
      .margin({ top: 10 })
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){
        Button('登录').width('150')
          .onClick(() => {
            // 课程演示账号，生产环境请替换为真实鉴权
            if (this.username == DemoAccount.USERNAME && this.password == DemoAccount.PASSWORD)
            {
              router.push({
                // 本人创建过的页面
                url: 'pages/main',
              })
            } else {
              prompt.showToast({
                message: '请输入账号密码！',
                duration: 2000,
              });

            }
          })
      }.margin({left:30})
      // .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Text('注册账号')
        .fontColor('#017DFF')
        .fontSize(15)
        .margin({left:20})
    }.height('100%')
    .width('100%')
    .padding(10)
    .backgroundColor('#F1F3F5')

  }
}