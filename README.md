## Description

ime-status.vim 的主要功能：在 Windows 系统使用 Vim 时，使输入法在 Normal 模式下处于关闭状态，即避免在中文输入时离开 Insert 模式后需要手动切换输入法状态。

## Background

在 Vim 中进行中文输入，需要经常切换中英文状态或者输入方式的困境。

## Implementation

### Thinking

Rime 无法利用 Windows 的 API 获取中英文状态，但是实现了 IME 的关闭输入法接口，可以使 Rime 处于 `IME is disabled` 状态。

基于 [fcitx.vim](https://github.com/lilydjwg/fcitx.vim) 的思路，可以使 Rime 离开 Insert 模式时候处于输入法不可用状态，进入 Insert 时候开启。

### Code

关闭输入法和开启输入法的代码如下：
```C++
SendMessage(ImmGetDefaultIMEWnd(GetForegroundWindow()), WM_IME_CONTROL, 0x0006, (LPARAM)false); // 关闭输入法
SendMessage(ImmGetDefaultIMEWnd(GetForegroundWindow()), WM_IME_CONTROL, 0x0006, (LPARAM)true); // 开启输入法
```

## Bug

Rime 关闭输入法之后再开启，无法记住关闭之前的输入法状态，会自动转为中文模式，相关问题：[关闭/打开输入法，ascii_mode会强制变为中文状态 · Issue #581 · rime/weasel · GitHub](https://github.com/rime/weasel/issues/581)

## Acknowledgements

感谢 [fcitx.vim](https://github.com/lilydjwg/fcitx.vim)、[fcitx-remote-for-windows](https://github.com/cute-jumper/fcitx-remote-for-windows)、[Neur1n/neuims](https://github.com/Neur1n/neuims) 项目提供的想法！

感谢 [Neur1n/neuims](https://github.com/Neur1n/neuims) 的作者提供的相关资料！

