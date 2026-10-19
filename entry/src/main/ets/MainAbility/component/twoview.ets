import Menu from "../model/menu";
@Component

struct TwoView{
  @State currnumber : number = 0
  private items: Array<Menu> = [
    new Menu("瓦香鸡",0),
    new Menu("油泼面",1),
    new Menu("黄焖鸡",2),
    new Menu("猪肚鸡",3),
    new Menu("麻辣香锅",4),
    new Menu("烤肉饭",5),
    new Menu("意面",6),
  ]
  arrs1 : string [] = ["food1.jpg","food2.jpg","food3.jpg","food4.jpg","food5.jpg","food6.jpg","food7.jpg"]

  build(){
    Row(){

      Swiper(){
        
        ForEach(this.arrs1,(item:string)=>{
          Image($rawfile(item)).width("100%").height("100%")
        })
        // Image($rawfile("food2.jpg")).width("100%").height("100%")
        // Image($rawfile("food3.jpg")).width("100%").height("100%")
        // Image($rawfile("food4.jpg")).width("100%").height("100%")
        // Image($rawfile("food5.jpg")).width("100%").height("100%")
        // Image($rawfile("food6.jpg")).width("100%").height("100%")
        // Image($rawfile("food7.jpg")).width("100%").height("100%")
      }.width("80%").height("90%").backgroundColor(Color.White)
      .autoPlay(false).indicator(false)
        .vertical(false)
          //.duration(1*1000)
        .index(this.currnumber)     //初始给第二个


      Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.Center,alignItems:ItemAlign.Start}){
        
        ForEach(this.items,(item:Menu)=>{
          Row(){
            Text(item.name).fontSize(16)

          }.width("20%").height("40%")
          .justifyContent(FlexAlign.Center).margin({left:5})
          .backgroundColor(this.currnumber == item.num ? '#ffc1bcbc' : '#f5f5f5' )
          .border({width:2,color:Color.White}).onClick(()=>{
            this.currnumber = item.num
          })

        })
      }.width("100%").height("100%").backgroundColor(Color.White)

    }


  }
}

export default TwoView