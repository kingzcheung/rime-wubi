OpenCC runtime data for librime's simplifier（简繁转换）
=======================================================

librime 在 `<rime user_data_dir>/opencc/` 下按 `opencc_config` 的文件名查找这些文件
（源码见 `app/src/main/jni/librime/src/rime/gear/simplifier.cc`）。缺失时「简入繁出」
不生效，日志表现为 `opencc config not found: s2hk.json`。

本目录属于内置方案集（`assets/rime/`），随方案一起分发/导出/备份；运行时由
`RimeConfigHelper.ensureOpenccAssets()` 复制到 `filesDir/rime/opencc/`
（只补缺失，不覆盖用户或方案包自带的数据）。

这里只放内置方案**实际启用**的 `s2hk.json`（简 → 香港繁体）及其引用的 6 个 `.ocd2`
词典。方案注释里列出的 s2t/t2s/s2tw 等其它模式没有随包提供；需要时从 OpenCC 1.4.2
的 `share/opencc/` 补对应的 json 与 ocd2 即可（配置里的词典路径均相对本目录）。

来源：https://github.com/BYVoid/OpenCC （Apache License 2.0，见 LICENSE）
版本：1.4.2。`.ocd2` 文件头为 `OPENCC_MARISA_0.2.5`，与本仓库 librime 内置的
OpenCC 1.4.0+12 / marisa 0.3.1 一致，已用 OpenCC CLI 验证转换结果。
