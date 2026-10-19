import OneView from '../component/oneview'
import TwoView from '../component/twoview'
import ThreeView from '../component/threeview'
import FourView from '../component/fourview'
import FiveView from '../component/fiveview'


import Menu from "../model/menu"
@Entry
@Component
struct Main {
  @State currnumber : number = 0
  private items: Array<Menu> = [
    new Menu("学院",0),
    new Menu("美食",1),
    new Menu("新闻",2),
    new Menu("电话",3),
    new Menu("链接",4),
  ]

  build() {

    Column(){
      Swiper(){
        OneView()
        TwoView()
        ThreeView()
        FourView()
        FiveView()


      }.width("100%").height("90%").autoPlay(false).indicator(false)
      .vertical(false)
      //.duration(1*1000)
      .index(this.currnumber)     //初始给第二个

      Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.Center,alignItems:ItemAlign.Center}){
        ForEach(this.items,(item:Menu)=>{
          Row(){
            Text(item.name).fontSize(16)

          }.width("30%").height("80%")
          .justifyContent(FlexAlign.Center).margin({left:5})
          .backgroundColor(this.currnumber == item.num ? '#ffc1bcbc':'#f5f5f5')
          .border({width:2,color:Color.White}).onClick(()=>{
            this.currnumber = item.num
          })

        })
      }.width("100%").height("10%").backgroundColor(Color.White)
    }.width("100%").height("100%")
  }
}