# moli 原型图

该目录用于存放 moli 项目的视觉稿、原型图和页面效果图。

## 建议目录

```text
原型图/
├── 01-首页/
├── 02-数字形象生成/
├── 03-聊天互动/
├── 04-回忆时间线/
├── 05-互动玩法/
└── 99-历史版本/
```

## 从本地上传已有视觉稿

如果视觉稿在本地目录：

```bash
/Users/mac/Documents/moli/原型图
```

可以在本地执行：

```bash
git clone https://github.com/a744436453-tech/moli.git
cd moli
mkdir -p 原型图
cp -R /Users/mac/Documents/moli/原型图/* ./原型图/
git add 原型图
git commit -m "add prototype visuals"
git push origin main
```

上传完成后，我可以继续基于仓库里的视觉稿补充页面、整理目录和生成前端 Demo。
