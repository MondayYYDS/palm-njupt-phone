// 一开始的跳转界面
import router from '@ohos.router';
@Entry
@Component
struct Index {
  forward():void{
    router.push({
      url:"pages/login"
    })
  }
  id:number = 0

  build() {
    Stack(){
      //Image($r("app.media.huawei")).width("100%").height("100%")
      Image($rawfile("jz.jpg")).width("100%").height("100%")
        .onAppear(()=>{
          console.log("图片组件加载完毕")
          this.id = setTimeout(this.forward,5000)
        })
      Text("跳过").fontSize(25).fontColor(Color.Blue).onClick(()=>{
        clearTimeout(this.id)
        this.forward()
      })

    }.width("100%").height("100%").alignContent(Alignment.TopEnd)

  }
}