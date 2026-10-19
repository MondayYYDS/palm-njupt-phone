import http from '@ohos.net.http';
import router from '@ohos.router';
import School from "../model/school"
import { ApiConfig } from "../common/AppConfig"
@Component

struct ThreeView{
  @State flag  : boolean = false
  @State schools : Array<School> = []
  aboutToAppear(){
    let httpRequest = http.createHttp()
    httpRequest.request(ApiConfig.NEWS_LIST_URL,(error,datas)=>{

      if(!error){
        this.schools = JSON.parse(datas.result+"")
        this.flag = true
      } else {
        console.error("ThreeView: 新闻列表加载失败, error=" + JSON.stringify(error))
      }

    })
  }
  build(){
    Scroll(){
      Column(){
        if (this.flag) {
          //Text(this.msg).fontSize(40).fontColor(Color.Red)
          ForEach(this.schools,(item:School,index:number)=>{
            Flex({direction:FlexDirection.Row,alignItems:ItemAlign.Center,justifyContent:FlexAlign.SpaceBetween}) {
              Text(item.name).fontSize(30).backgroundColor(Color.White)
                .width("100%").height("50%")
              // Text(item.action).fontSize(30).backgroundColor(Color.Pink)
              //   .textAlign(TextAlign.Center).width("100%").height("50%")
              Image($rawfile(item.action)).width("80%").height("20%")

            }  .margin({left:10})
            .onClick(()=>{
              router.push({
                url:"pages/schoolview",
                params:{
                  "url":item.link
                }
              })

            })

          })
        }
        else {
          LoadingProgress().color(Color.Pink)
          Text("正在加载...").fontColor(Color.Pink).fontSize(30).width("100%").textAlign(TextAlign.Center)
        }
      }
    }.width("100%").height("100%").backgroundColor(Color.White)


  }
}

export default ThreeView