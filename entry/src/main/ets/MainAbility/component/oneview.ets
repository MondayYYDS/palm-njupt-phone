import { School } from "../model/school"
import { ApiConfig } from "../common/AppConfig"
import http from "@ohos.net.http"
import router from '@ohos.router';
@Component

struct  OneView{

  @State arrs:Array<School> = []

  @State  flag :boolean  =false

  @State start: boolean = true
  @State fromStart: boolean = true
  @State step: number = 50
  @State loop: number = 300
  @State src: string = "欢迎使用掌上南邮"

  private swiperController: SwiperController = new SwiperController()
  arrs1 : string [] = ["top1.png","top2.jpg","top3.png","top4.jpg"]
  aboutToAppear()
  {

    let  httpRequest =http.createHttp();

    httpRequest.request(ApiConfig.COLLEGE_LIST_URL,(error,datas)=>{

      if(!error)
      {
        console.log("网络访问成功")

        this.arrs = JSON.parse(datas.result+"")

        this.flag  = true
      }
      else{

        console.error("OneView: 学院列表加载失败, error=" + JSON.stringify(error))

      }


    })


  }

  build(){

    Column(){
      if (this.flag){


      Swiper(this.swiperController){
        ForEach(this.arrs1, (item: string) => {
          Image($rawfile(item)).width("80%").height("20%").onClick(()=>{

          })
          // Text(item).width('90%').height(160).backgroundColor(0xAFEEEE).textAlign(TextAlign.Center).fontSize(30)
        }, item => item)
      }.cachedCount(2).index(1).autoPlay(true).interval(4000).indicator(true)
      .loop(true).duration(1000).itemSpace(0).curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })
        Marquee({
          start: this.start,
          step: this.step,
          loop: this.loop,
          fromStart: this.fromStart,
          src: this.src
        })
          // .width(400)
          .fontColor(Color.Blue)
          .fontSize(50)
          .allowScale(false)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(Color.White)
          // .margin({bottom:40})

      Scroll(){
        Column(){



        Flex({direction:FlexDirection.Row,wrap:FlexWrap.Wrap,justifyContent:FlexAlign.Center
        ,alignItems:ItemAlign.Center}){
          ForEach(this.arrs,(item:School,index:number)=>{
            Column(){
              //Text(this.arrs[index]).fotSize(30)

              Image($rawfile(item.name)).width("100%").height("100%")
              // Text(item).fontSize(30)

            }.width("27%").height("25%").backgroundColor(Color.Pink)
            .margin({left:10,top:5})
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
        }.width("100%")
      }
      // .width("100%").height("100%")
      }
      else {
        Row(){
          Column(){
            LoadingProgress().color(Color.Pink).width("100%").height("50%")
            Text("正在加载数据...").fontSize(40).backgroundColor(Color.Pink)
              .textAlign(TextAlign.Center)
          }.width("100%")
        }.height("100%")
      }
    }.backgroundColor(Color.White)
    // .width("100%").height("100%")

  }
}

export default OneView