---
title: 🚪 介紹
weight: 0
---

Eask 被構建為用作 Elisp 包中的包開發工具。 但是現在，Eask 支持各種類型的 Emacs Lisp 任務。
它可以通過三種主要方式使用：

1. Elisp 包的開發工具
2. 配置的依賴管理
3. 為所有其他目的運行 elisp 程序

那麼，除上述內容外，Eask 與其他構建工具（如 [Cask][]、[makem.sh][] 和 [Eldev][] 之間的主要區別是什麼？

好問題！ Eask 現在不僅僅是一個構建工具，它可以用於各種目的！ 但 Eask 的目標是：

- **一致**足以跨所有系統進行沙盒
- **通用**足以讓 Emacsers 經常使用命令（`byte-compile`、`checkdoc` 等）
- **穩健**即使在出現用戶錯誤的情況下也足以提供有用的結果
- **無依賴**，使該工具可以在任何平台上運行

*附言 有關更多詳細信息，請參閱[為什麼使用 Eask？](https://emacs-eask.github.io/#-why-eask)。*

## ❓ 為什麼選擇 Eask？

`Eask` 與 Cask 具有相同的理念，請參閱他們的網站 [Why Cask?](https://cask.readthedocs.io/en/latest/guide/introduction.html#introduction-why-cask)
以了解您為什麼應該這樣做, 使用 Eask（或 Cask）。

[Cask][]、[makem.sh][] 或 [Eldev][] 等許多工具並不**“真正”**支持 Windows。 `Cask`
已經放棄了對舊版 Windows 的支持，`makem.sh` 在 bash 上運行，`Eldev` 確實支持 Windows，
但作者沒有在 Windows 上使用它（沒有完整的測試，請參閱他們的
[CI 工作流程]（https //github.com/doublep/eldev/actions/workflows/test.yml））。
`Eask` 旨在適配所有平台，包括 `Linux`、`macOS` 和 `Windows`。 它側重於跨平台能力和每個
操作系統之間的一致性。 如果 Eask 可以在您的機器上運行，那麼它也可以在任何平台上運行。

這是我們的建議； 如果您打算在特定於操作系統的軟件包上工作（從不使用其他平台），請使用其他工具。
另一方面，Eask 旨在提供每個操作系統之間的最佳一致性。 或者，如果你想學習一個隨處可用的工具，
Eask 是最好的選擇之一。

## ⚖️ 比較

該表是通過閱讀這些項目的文檔和源代碼編制的，但作者不是這些工具的專家。 歡迎指正。

### 🔍 Project Wise

該表顯示了作者選擇的技術以及項目的構建方式。 此外，他們做出了哪些技術決策？ 放棄支持？ 項目佈局？ 等等。

|                | Eask              | Cask                        | Eldev          | makem.sh                    |
|----------------|-------------------|-----------------------------|----------------|-----------------------------|
| bin folder     | binary, bash, bat | bash, bat                   | bash, bat, ps1 | bash                        |
| Cross-Platform | yes               | no, doesn't support Windows | yes            | no, doesn't support Windows |
| Emacs version  | 26.1+             | 24.5+                       | 24.4+          | 26.1+                       |
| Size           | 7,000+ lines      | 3,000+ lines                | 8,000+ lines   | 1,200+ lines                |
| Executable     | yes               | no                          | no             | no                          |
| Pure Elisp     | no, JavaScript    | yes                         | yes            | yes                         |
| CLI Parser     | yargs             | commander                   | built-in       | built-in                    |

{{< hint info >}}
💡 **makem.sh** 也有很好的比較文檔，請訪問他們的[站點](https://github.com/alphapapa/makem.sh#comparisons)
{{< /hint >}}

### 🔍 功能方面

這是每個工具之間的功能比較。 每種工具都有其優點； 選擇適合您的工具！

如果這些功能沒有在下面列出，要么被遺忘，要么只是被認為太重要了，所以每個工具都有它； 因此我們不將它們添加到列表中。

|                           | Eask                             | Cask         | Eldev           | makem.sh |
|---------------------------|----------------------------------|--------------|-----------------|----------|
| Elisp configuration       | yes, DSL is optional             | no, DSL only | yes, pure elisp | no       |
| Handle `archives` failure | yes, see [emacs-eask/archives][] | no           | no              | no       |
| `create` project, etc     | yes                              | no           | no              | no       |
| `link` local dependencies | yes                              | yes          | yes             | no       |
| `exec` program            | yes                              | yes          | no              | no       |
| `eval` expressions        | yes                              | yes          | yes             | no       |
| `emacs` execution         | yes                              | yes          | no              | no       |
| Built-in `linters`        | yes                              | no           | yes             | no       |
| Built-in `tests`          | yes                              | no           | yes             | no       |
| Run script                | yes                              | no           | no              | no       |
| Self-defined commands     | no, replaced with run script     | no           | yes             | no       |
| Subcommand                | yes                              | no           | no              | no       |

## 📰 消息

- `0.9.x` - Improve UX in general
- `0.8.x` - Add `link` command
- `0.7.x` - Fix `default-directory` isn't honored by **-g** option
- `0.6.x` - You can now use `eask create` to create an Elisp project
- `0.5.x` - Handle error for failed archive
- `0.4.x` - Add color logger
- `0.3.x` - Add verbosity level and timestamps
- `0.2.x` - Done basic error handling with exit code at the end of executions
- `0.1.39` - Use `spawn` instead `exec`; now messages will be printed immediately
- `0.1.x` - Project bare-bones are pretty much complete!

## 📝 TODO 事項列表

請參考[這](https://emacs-eask.github.io/Getting-Started/Introduction/#-todo-list).

## 📂 基礎項目

Eask 的設計深受以下項目的影響：

* [Cask][] - Emacs 的項目管理工具
* [makem.sh][] -用於構建和測試 Emacs Lisp 包的類似 Makefile 的腳本
* [epm](https://github.com/xuchunyang/epm) - Emacs 包管理器
* [Eldev][] - Elisp 開發工具


[emacs-eask/archives]: https://github.com/emacs-eask/archives
[Cask]: https://github.com/cask/cask
[makem.sh]: https://github.com/alphapapa/makem.sh
[Eldev]: https://github.com/doublep/eldev