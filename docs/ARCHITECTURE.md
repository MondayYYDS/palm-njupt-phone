# 架构说明 · 掌上南邮手机端

## 1. 总览

应用采用 HarmonyOS API 8 的 **FA 模型**，以 `MainAbility` 作为页面入口，ArkTS 声明式 UI 负责视图，`@ohos.router` 负责页面跳转，`@ohos.net.http` 负责与后端交互。

```text
┌─────────────────────────────────────────────────────┐
│                       MainAbility                   │
│                                                     │
│  pages/index ──► pages/login ──► pages/main         │
│                                   │                 │
│                      ┌────────────┴────────────┐    │
│                      │        Swiper           │    │
│                      │ OneView   TwoView       │    │
│                      │ ThreeView FourView      │    │
│                      │ FiveView                │    │
│                      └────────────┬────────────┘    │
│                                   │                 │
│                        pages/schoolview (Web)       │
└───────────────────────────┬─────────────────────────┘
                            │ HTTP
              ┌─────────────┴─────────────┐
              │ 华为云 FunctionGraph      │
              │ Python Flask + natapp     │
              └───────────────────────────┘
```

## 2. 目录职责

| 路径 | 职责 |
| --- | --- |
| `pages/index.ets` | 启动页：全屏背景、5 秒定时跳转、跳过按钮 |
| `pages/login.ets` | 登录页：账号密码输入、演示账号校验、失败 Toast |
| `pages/main.ets` | 主界面：`Swiper` 承载五个功能组件，底部菜单切换 |
| `pages/schoolview.ets` | 通用 WebView 容器，接收 `url` 参数 |
| `component/oneview.ets` | 学院：轮播图、跑马灯、学院宫格、详情跳转 |
| `component/twoview.ets` | 美食：图片轮播 + 分类联动 |
| `component/threeview.ets` | 新闻：远端新闻列表 + 详情跳转 |
| `component/fourview.ets` | 通讯录：远端联系人 + `call.makeCall` 拨号 |
| `component/fiveview.ets` | 友情链接：远端链接列表 + 内嵌浏览 |
| `model/menu.ets` | 底部菜单 / 美食分类的数据模型 |
| `model/school.ets` | 学院、新闻、联系人、链接的统一数据模型 |
| `common/AppConfig.ets` | 后端接口地址与演示账号的集中配置 |

## 3. 路由表

| 来源 | 目标 | 参数 | 说明 |
| --- | --- | --- | --- |
| `index` | `pages/login` | 无 | 5 秒自动跳转或点击“跳过” |
| `login` | `pages/main` | 无 | 演示账号校验通过后进入 |
| `oneview` | `pages/schoolview` | `url` | 点击学院宫格 |
| `threeview` | `pages/schoolview` | `url` | 点击新闻条目 |
| `fiveview` | `pages/schoolview` | `url` | 点击友情链接 |
| `main` | 五个组件 | 无 | 通过 `Swiper.index` 切换，不产生路由栈 |

## 4. 数据模型

所有列表接口统一返回 `School` 结构：

```ts
export class School {
  name: string;    // 展示名称
  link: string;    // 详情 URL 或电话号码
  action: string;  // 图片文件名或动作文案
}
```

`link` 在不同模块中承载不同语义：

- 学院 / 新闻 / 链接：WebView 地址
- 通讯录：电话号码，传给 `call.makeCall`

## 5. 数据流

以学院页为例：

```text
OneView.aboutToAppear()
        │
        ▼
http.request(ApiConfig.COLLEGE_LIST_URL)
        │ 成功
        ▼
JSON.parse(result) ──► @State arrs ──► ForEach 渲染宫格
        │ 点击
        ▼
router.push({ url: 'pages/schoolview', params: { url: item.link } })
        │
        ▼
Schoolview 读取 params.url ──► Web 组件加载页面
```

其余列表页的数据流与学院页一致，仅接口与渲染布局不同。

## 6. 状态管理

- 页面内状态使用 `@State`，例如 `flag`（加载完成）、`currnumber`（当前分类）、`arrs`（列表数据）。
- 组件之间不共享全局状态；每个功能组件独立请求、独立渲染。
- 页面切换由 `Swiper.index` 驱动，底部菜单只修改 `currnumber`。

## 7. 网络与异常处理

- 所有请求通过 `@ohos.net.http` 发起，统一从 `AppConfig` 读取地址。
- `AppConfig` 中的地址为占位符；课程项目原实现分别使用华为云 FunctionGraph 与 Python Flask + natapp。
- 请求成功时解析 JSON、置 `flag = true`；失败时写入 `console.error` 日志。
- 页面在 `flag = false` 时展示 `LoadingProgress` 与“正在加载”提示。
- 当前版本未设置超时、重试与离线缓存，接口不可用时页面会停留在加载状态。

## 8. 扩展指南

### 新增一个底部功能页

1. 在 `component/` 下新增 `SixView.ets`，实现 `aboutToAppear` 数据加载与 `build` 布局。
2. 在 `main.ets` 中导入组件，加入 `Swiper` 子组件列表。
3. 在 `items` 数组中追加 `new Menu("名称", 5)`，并保证 `currnumber` 与 `Swiper` 索引一致。
4. 如需页面跳转，在 `config.json` 的 `pages` 数组中注册新页面。

### 替换后端

只需修改 `common/AppConfig.ets` 中的 URL 常量，保持返回结构为 `School[]` 即可。

## 9. 设计约定

- 页面文件放在 `pages/`，可复用 UI 放在 `component/`，数据结构放在 `model/`。
- 文件命名沿用 FA 模板的小写形式（`oneview.ets`、`main.ets`），组件名使用大驼峰（`OneView`）。
- 业务常量、账号、接口地址不得散落在组件中，统一放在 `common/AppConfig.ets`。
- 不在仓库中提交签名证书、口令、`local.properties`、构建产物。
