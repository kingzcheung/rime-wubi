该库是 Rime 输入法的一个 86版极点五笔的输入方案，支持多平台（Windows、macOS、Linux）。

> 声明：本仓库 fork 自 [KyleBing/rime-wubi86-jidian](https://github.com/KyleBing/rime-wubi86-jidian)。

## 一、前言

Rime 是个输入法集合，涵盖常用的三个平台 Windows、macOS、Linux，三个平台对应的输入法如上图。

该输入法具有高度可定制化的特性，输入法通过读取不同的配置文件，来实现不同输入方式：全拼、双拼、五笔、仓颉，设置不同的输入习惯：二三候选、回车清码、z键拼音反查等等。

正因为如此高的可自定义性，拉高了它的使用门槛。为了让更多的五笔用户更省心地使用 Rime 输入五笔，就有了这个86五笔输入方案，它的输入习惯比较接近于之前的极点五笔，码表也是使用的极点五笔的码表。

由于三个平台使用的码表配置文件是一样的，所以能够在多个平台间保持同一种输入习惯，打起字来也会比较舒服。

该码表词条不是很多，很多专业性的词语可能会没有，需要自己添加，可以使用配套工具「五笔词条工具」来完成词条的添加。


## 二、不同平台的输入法外观


__macOS__

__Windows__

皮肤可以通过修改 `weasel.custom.yaml` 文件内的 color_scheme 实现修改，对应正文的颜色方案

```yaml
patch:
  style:
    color_scheme: WhiteAqua  # 匹配正文的颜色方案，对应正文的颜色方案名
```

__Linux: Ubuntu__



## 三、文件说明

```bash
.
├── README.md                               # 当前说明文档
├── default.yaml                            # 配置文件 - 默认配置
├── default.custom.yaml                     # 配置文件 - 自定义一些输入法的功能：标点，二三候选等
├── squirrel.custom.yaml                    # 配置文件 - 鼠须管（for macOS）输入法候选词界面
├── trime.custom.yaml                       # 配置文件 - 同文（for Android）输入法候选词界面
├── numbers.schema.yaml                     # 输入方案 - 大写数字
├── pinyin_simp.dict.yaml                   # 词库文件 - 简体拼音码表 - 五笔中拼音输入需要的
├── pinyin_simp.schema.yaml                 # 输入方案 - 简体拼音
├── symbols.yaml                            # 配置文件 - 特殊符号
├── wubi86.schema.yaml                      # 输入方案 - 五笔86
├── wubi86.dict.yaml                        # 词库文件 - 五笔86主码表
├── wubi86_pinyin.schema.yaml               # 输入方案 - 五笔拼音混输
├── wubi86_trad.schema.yaml                 # 输入方案 - 五笔简入繁出
├── wubi86_trad_pinyin.schema.yaml          # 输入方案 - 拼音混输繁体
├── wubi86_user.dict.yaml                   # 词库文件 - 用户私人词库
├── wubi86_extra.dict.yaml                  # 词库文件 - 扩展词库
├── wubi98.schema.yaml                      # 输入方案 - 五笔98
├── wubi98.dict.yaml                        # 词库文件 - 五笔98码表
├── handwriting.schema.yaml                 # 输入方案 - 手写输入
├── t9_pinyin.schema.yaml                   # 输入方案 - 拼音九键
├── lua/
│   ├── date_hint.lua                       # 脚本 - 九键日期提示
│   └── uuid.lua                            # 脚本 - 输出 UUID
└── macOS-双击复制文件内容.command           # 脚本 - macOS 一键复制配置到 Rime 目录
```

## 四、安装

### 1. 鼠须管（macOS）
去 Rime 官网下载鼠须管，按步骤安装即可

1. 下载本仓库的五笔配置文件
2. macOS 上的 鼠须管 配置文件存放目录是 `~/Library/Rime`，把下载后的`rime-wubi`内的所有文件移到 `Rime` 目录中，
3. 点击状态栏上的输入法图标，下拉菜单中选择 <kbd>部署</kbd> (英文是<kbd>Deploy</kbd>），或者可以直接使用快捷键 <kbd>control</kbd> + <kbd>option</kbd> + <kbd>~</kbd>

> **注意：** `Rime` 目录下的 `Build` 目录是程序生成的，不要把配置文件放在那里面，无视它即可。

放的时候目录结构是这样的：
```bash
~/Library/
└── Rime
    ├── 该项目中的文件
    ├── 该项目中的文件
    ├── 该项目中的文件
    ├── ...
    ├── ...
```

> **注意**：对于不熟悉命令行操作的朋友， `~` 代表的是当前用户的主目录，比如我的用户名是 `kyle`, `~` 就代表 `/Users/kyle/` 这个绝对路径。
> 需要将你下载的文件放入 `/Users/你用户名/Library/Rime` 这个目录下，了然否？


### 2. 小狼毫（Windows）

Windows 中的配置方法：
1. 右击状态栏中的小狼毫输入法图标，选择 <kbd>用户文件夹</kbd>
2. 把该项目中的文件复制到里面
3. 右击状态栏中的小狼毫输入法图标，选择 <kbd>重新部署</kbd> 即可


### 3. ibus-rime (Ubuntu)

执行下面指令安装 `ibus-rime` 输入法

```bash
sudo apt-get install ibus-rime
```

ubuntu 的配置文件目录在 `~/.config/ibus/rime/`

### 4. 小企鹅输入法 (Android)
插件： 需要到 fcitx5-android 的发布页面下载 rime 支持插件
配置方法：
1. 使用 adb 把文件 push 到`/sdcard/Android/data/org.fcitx.fcitx5.android/files/data/rime`
2. 打开输入法输入界面的工具菜单 -> 重载配置

### 5. Xime 输入法 (Android)
Xime 输入法（仓库地址：[https://github.com/ximeiorg/Xime](https://github.com/ximeiorg/Xime)）已内置本仓库的方案，无需下载或手动配置，安装 Xime 后即可直接使用。


## 五、使用说明

### 1. 选项菜单
在输入状态时，<kbd>control</kbd> + <kbd>0</kbd> 或者 <kbd>shift</kbd> + <kbd>control</kbd> + <kbd>0</kbd> 弹出菜单

### 2. 菜单内容
弹出的菜单中，处于第一位的是当前使用的输入法方案，其后跟着是该方案中的输入法菜单，有【半角 - 全角】【简 - 繁】等常见功能菜单，再后面是其它可选的输入法方案，对应 `default.custom.yaml` 中 `schema_list` 字段内容

### 3. 默认二三候选
默认的二三候选是 <kbd>;</kbd> <kbd>'</kbd> 两个键

### 4. 候选翻页
方向 <kbd>上</kbd><kbd>下</kbd>、<kbd>-</kbd> <kbd>=</kbd>、<kbd>[</kbd> <kbd>]</kbd>

### 5. 临时拼音输入
在忘了某字的五笔编码时，<kbd>z</kbd>键可以进入临时拼音输入模式

### 6. 支持 简入繁出
是以切换输入方案的形式实现的，使用时，调出菜单，选择 `简入繁出` 方案即可
简繁转换的功能能实现：
- 转繁体
- 转香港繁体
- 转台湾繁体
具体可以看这个文件内的说明： [wubi86_trad.schema.yaml](wubi86_trad.schema.yaml)
> 以不切换文字的形式使用只是暂时转繁，换个程序就会恢复简体了。如果你想一直使用简入繁出就选择 「简入繁出」这个方案

### 7. 系统 `时间`、`日期` 和 `星期`
输入对应词，获取当前日期和时间
- `date` 输出日期，格式 `2019年06月19日` `2019-06-19`
- `time` 输出时间，格式 `10:00` `10:00:00`
- `week` 输出星期，格式 `周四` `星期四`

### 8. 支持大写数字输入：壹贰叁肆伍陆
本库中包含一个可以输入大写数字的方案，名叫 `大写数字`，呼出菜单选择该方案即可。
在这个模式下：具体可以看源文件 `numbers.schema.yaml`


| 键           | 对应值             | | 键 (按住 shift) | 对应值            |
|-------------|--------------------|---|-----------|-------------------|
| 1234567890  | 壹贰叁肆伍陆柒捌玖零  | | 1234567890 | 一二三四五六七八九〇  |
| wqbsjfd.    | 万仟佰拾角分第点     | | wqbsjfd.   | 万千百十角分点       |
| z           | 整之               | | z          | 整之               |
| y           | 元月亿             | | y          | 元月亿             |

### 9. 特殊字符快捷输入
默认是关闭的，具体可以查看 wiki 中「如何启用 `/fh` 这种特殊符号输入」。


## 六、常见自定义功能
所有配置说明都在配置文件中说明了，如果有其它问题可以在 `issue` 中提出。

### 1. 回车清码
默认是开启的
想要关闭，打开 `default.custom.yaml` 文件，找到下面这行，在前面添加 `#` 即可，如下

```yaml
      # 回车清码
      - { when: composing, accept: Return, send: Escape }
```

### 2. 空码时自动清码
默认配置是不会自动清的，想要自动清码，修改文件  `wubi86.schema.yaml` 中 `speller` 这一栏，将前面的 `#` 号删除即可，如下
```yaml
  auto_clear: max_length                # 空码时自动清空
```

### 3. 编码提示
默认是关闭的，
想要开启，打开 `wubi86.schema.yaml` 编辑 `translator` -> `comment_format` 改成如下即可

```yaml
  comment_format: 
#    - xform/.+//                       # 注释掉该行，即可显示词条编码
```

### 4. 关于手动造词功能
一种方式是，手动往词库中添加词组，并重新部署
> 这个操作要注意的是词组与编码之间的符号是`tab`，写错了这个词是不会被识别的

另一种是使用工具。Rime 默认是没有词条管理工具的，所以就写了一个工具，基本满足日常需求，如果有什么其它需要的功能，可以跟我说。

### 5. Lua 脚本扩展
本项目将 Lua 脚本统一放在 `lua/` 目录，并在对应的 `*.schema.yaml` 中引用：
- `uuid.lua`：输入触发词可输出 UUID，在 `wubi86.schema.yaml` 的 `engine/translators` 中以 `lua_translator@*uuid` 引用。
- `date_hint.lua`：九键拼音下输入「今天/明天/昨天」等触发词时在候选词中插入日期，在 `t9_pinyin.schema.yaml` 的 `engine/filters` 中以 `lua_filter@*date_hint` 引用。

### 6. 开启自动造词

> **注意**: 这样会关闭自动上屏，顶字上屏的功能。

需要修改 `wubi86.schema.yaml` 下面几个内容

```bash
speller:
  # max_code_length: 4                 # 四码上屏
  auto_select: false                   # 自动上屏

translator:
  enable_sentence: true                # 句子输入模式
  enable_user_dict: true               # 是否开启用户词典（用户词典记录动态字词频，用户词）
  enable_encoder: true

```

> **始于** 2019年02月28日
