/**
 * 掌上南邮 · 运行时配置
 *
 * 下面的地址是占位符。课程项目原实现使用：
 *   - 华为云 FunctionGraph：学院列表、通讯录
 *   - Python Flask + natapp：新闻、美食、友情链接
 *
 * 复现或二次开发时，请替换为你自己的服务地址。
 *
 * 接口约定（均返回 JSON 数组，元素结构为 { name, link, action }）：
 *   COLLEGE_LIST_URL   学院列表
 *   CONTACT_LIST_URL   通讯录
 *   NEWS_LIST_URL      新闻列表
 *   FOOD_LIST_URL      美食数据
 *   FRIEND_LINKS_URL   友情链接
 */
export class ApiConfig {
  static readonly COLLEGE_LIST_URL: string =
    'https://your-api-gateway.example.com/college';
  static readonly CONTACT_LIST_URL: string =
    'https://your-api-gateway.example.com/contacts';
  static readonly NEWS_LIST_URL: string = 'https://your-flask.example.com/news';
  static readonly FOOD_LIST_URL: string = 'https://your-flask.example.com/food';
  static readonly FRIEND_LINKS_URL: string = 'https://your-flask.example.com/links';
}

/**
 * 课程演示账号。
 * 仅用于本地体验，接入真实鉴权前请勿用于生产环境。
 */
export class DemoAccount {
  static readonly USERNAME: string = '123';
  static readonly PASSWORD: string = '123';
}
