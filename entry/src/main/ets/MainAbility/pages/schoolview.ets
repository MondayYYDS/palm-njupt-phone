import router from '@ohos.router';
@Entry
@Component
struct Schoolview {
  controller:WebController = new WebController()
  link  :string = router.getParams()["url"]

  build() {
    Column(){
      Web({src:this.link,controller:this.controller})
    }.width("100%").height("100%")


  }
}