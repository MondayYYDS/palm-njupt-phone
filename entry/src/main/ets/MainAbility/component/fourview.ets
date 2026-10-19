// 基于华为云 FunctionGraph 实现的电话目录
import { School } from "../model/school"
import { ApiConfig } from "../common/AppConfig"
import http from "@ohos.net.http"
import call from '@ohos.telephony.call';
@Component
struct FourView {

  @State arrs:Array<School> = []

  @State  flag :boolean  =false

  aboutToAppear()
  {

    let  httpRequest =http.createHttp();

    httpRequest.request(ApiConfig.CONTACT_LIST_URL,(error,datas)=>{

      if(!error)
      {
        console.log("网络访问成功")

        this.arrs = JSON.parse(datas.result+"")

        this.flag  = true
      }
      else{

        console.error("FourView: 通讯录加载失败, error=" + JSON.stringify(error))

      }


    })


  }


  build() {


    Column()
    {
      if(this.flag)
      {

        Scroll()
        {
          Column()
          {
            ForEach(this.arrs,(item:School,index:number)=>{

              Row()
              {
                Text(item.name).width("40%").fontSize(24).fontColor(Color.Black)
                Text(item.link).width("40%").fontSize(18).fontColor(Color.Blue)
                Text(item.action).width("20%").fontSize(30).fontColor(Color.Red).onClick(()=>{
                  // 调用查询能力接口
                  let isSupport = call.hasVoiceCapability();
                  if (!isSupport) {
                    console.info(" support voice capability, return");
                    return;
                  }
                  // 如果设备支持呼叫能力，则继续跳转到拨号界面，并显示拨号的号码
                  call.makeCall(item.link, (err)=> {
                    if (!err) {
                      console.info(" make call success.");

                    } else {
                      console.info("make call fail, err is:" + JSON.stringify(err));
                    }
                  });
                })
              }.width("100%").height("20%")
              .backgroundColor(Color.White)
              .margin({top:20})


            })
          }

        }.width("100%").height("100%")

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

    }.width("100%").height("100%").backgroundColor(Color.White)

  }
}

export default FourView