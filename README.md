# EmojiFilter
#b iOS NSString filter emoji 
过滤emoji字符

1. 共收录了 1800 个emoji 码点，包含了目前所有的 emoji 码点（2018/12/23），保证过滤已有的emoji码点。

2. 最好事先了解 Uinicode 编码、UTF-8编码 和 UTF-16编码的原理

3. emoji集合是用二分查找实现的，效率较高

Emoji 是 Unicode 的一部分，它在 Unicode 中有对应的码点（ CodePoint），也就是说，Emoji 符号就是一个文字。

根据 Emoji 维基百科说明，当前版本中共有 1212 个 Emoji ，实际上这指的是单码点的 Emoji，而还有一些 Emoji 是通过多个码点组合而成。

例如"零宽度连接符"（ZERO WIDTH JOINER，缩写 ZWJ）U+200D。
将U+1F468：男人 U+1F469：女人  U+1F467：女孩这三个码点使用U+200D连接起来，U+1F468 U+200D U+1F469 U+200D U+1F467，
就会显示为一个 Emoji 👨‍👩‍👧，表示他们组成的家庭。
如果用户的系统不支持这种方法，就还是显示为三个独立的 Emoji 👨👩👧。
例如如代表肤色的(U+1F3FB–U+1F3FF): 🏻 🏼 🏽 🏾 🏿 ，发色的（U+1F9B0-U+1F9B3）,
组合起来后得到同一个表情的不同肤色版本，
这一特性在国际大厂的输入法上可以看到，例如 Apple、Google、Samsung 的输入法上都可以输入。
例如 U+1F1E8 U+1F1F3 组合起来成了中国国旗。
由于多码点组合的存在，可以显示的 Emoji 实际上数量多于 1212 个。

Emoji 的识别
一个字符串是否包含了 Emoji？通过上面的描述，我们可以想到，如果字符串中包含了 Emoji 的码点，
那不就说明该字符串包含了 Emoji 吗？因此，我们先获取一份完整的码点集合用来判断。

Emoji 所有的码点
那 Emoji 的码点有哪些呢，Unicode 组织的 Unicode® Emoji Charts v11.0 页面中可以找到完整的 Emoji 码点数据：emoji-data.txt 

Unicode 是容纳世界所有文字符号的国际标准编码，使用四个字节为每个字符编码。

UTF 是英文 Unicode Transformation Format 的缩写，意为把 Unicode 字符转换为某种格式。
UTF 系列编码方案（UTF-8、UTF-16、UTF-32）均是由 Unicode 编码方案衍变而来，以适应不同的数据存储或传递，
它们都可以完全表示 Unicode 标准中的所有字符。目前，这些衍变方案中 UTF-8 被广泛使用，而 UTF-16 和 UTF-32 则很少被使用。

UTF-8 使用一至四个字节为每个字符编码，其中大部分汉字采用三个字节编码，少量不常用汉字采用四个字节编码。
因为 UTF-8 是可变长度的编码方式，相对于 Unicode 编码可以减少存储占用的空间，所以被广泛使用。

UTF-16 使用二或四个字节为每个字符编码，其中大部分汉字采用两个字节编码，少量不常用汉字采用四个字节编码。
UTF-16 编码有大尾序和小尾序之别，即 UTF-16BE 和 UTF-16LE，
在编码前会放置一个 U+FEFF 或 U+FFFE（UTF-16BE 以 FEFF 代表，UTF-16LE 以 FFFE 代表），
其中 U+FEFF 字符在 Unicode 中代表的意义是 ZERO WIDTH NO-BREAK SPACE，顾名思义，它是个没有宽度也没有断字的空白。

参考资料：
1.https://www.jianshu.com/p/42fd6f84c27a
2.http://www.unicode.org/Public/emoji/11.0/emoji-data.txt

工具：
进制转换
http://tool.oschina.net/hexconvert/ 

码点查找
https://www.qqxiuzi.cn/bianma/Unicode-UTF.php
