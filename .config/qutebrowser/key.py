for key in c.bindings.default:
    c.bindings.default[key] = {}

c.bindings.key_mappings = {
    "<Ctrl-[>": "<Escape>",
    "<Ctrl-6>": "<Ctrl-^>",
    "<Ctrl-M>": "<Return>",
    "<Ctrl-J>": "<Return>",
    "<Ctrl-I>": "<Tab>",
    "<Shift-Return>": "<Return>",
    "<Enter>": "<Return>",
    "<Shift-Enter>": "<Return>",
    "<Ctrl-Enter>": "<Ctrl-Return>",
}

# Bindings for normal mode
config.bind("'", "mode-enter jump_mark")
config.bind("+", "zoom-in")
config.bind("-", "zoom-out")
config.bind("=", "zoom")
config.bind(".", "cmd-repeat-last")
config.bind("/", "cmd-set-text /")
config.bind(":", "cmd-set-text :")
config.bind("<Ctrl-B>", "scroll-page 0 -1")
config.bind("<Ctrl-U>", "scroll-page 0 -0.2")
config.bind("<Ctrl-E>", "scroll-page 0 0.2")
config.bind("<Ctrl-F>", "scroll-page 0 1")
config.bind("<Ctrl-H>", "back")
config.bind("<Ctrl-R>", "reload -f")
config.bind("<Space>,", "cmd-set-text -s :tab-select")
config.bind("<Ctrl-Space>,", "cmd-set-text -s :tab-select")
config.bind("<Ctrl-Space>1", "tab-focus 1")
config.bind("<Ctrl-Space>2", "tab-focus 2")
config.bind("<Ctrl-Space>3", "tab-focus 3")
config.bind("<Ctrl-Space>4", "tab-focus 4")
config.bind("<Ctrl-Space>5", "tab-focus 5")
config.bind("<Ctrl-Space>6", "tab-focus 6")
config.bind("<Ctrl-Space>7", "tab-focus 7")
config.bind("<Ctrl-Space>8", "tab-focus 8")
config.bind("<Ctrl-Space>9", "tab-focus 9")
config.bind("<Ctrl-Space><Ctrl-Space>", "tab-focus last")
config.bind("<Ctrl-c>", ":yank pretty-url")
config.bind("<Ctrl-t>", "cmd-set-text -s :open -t")
config.bind("O", "cmd-set-text -s :open -t")
config.bind("<Escape>", "clear-keychain ;; search ;; fullscreen --leave")
config.bind("<Return>", "selection-follow")
config.bind("B", "cmd-set-text -s :quickmark-load -t")
config.bind("N", "search-prev")
config.bind("b", "cmd-set-text -s :quickmark-load")
config.bind("f", "hint")
config.bind("gg", "scroll-to-perc 0")
config.bind("gt", "tab-next")
config.bind("G", "scroll-to-perc 100")
config.bind("h", "scroll left")
config.bind("i", "mode-enter insert")
config.bind("ι", "mode-enter insert")
config.bind("<Return>", "fake-key <Return> ;; mode-enter insert", mode="normal")
config.bind("j", "scroll down")
config.bind("k", "scroll up")
config.bind("l", "scroll right")
config.bind("m", "quickmark-save")
config.bind("n", "search-next")
config.bind("o", "cmd-set-text -s :open")
config.bind("v", "mode-enter caret ;; selection-toggle --line")
config.bind("x", "tab-close")

## Bindings for prompt mode
config.bind("<Ctrl-A>", "rl-beginning-of-line", mode="prompt")
config.bind("<Ctrl-B>", "rl-backward-char", mode="prompt")
config.bind("<Ctrl-E>", "rl-end-of-line", mode="prompt")
config.bind("<Ctrl-F>", "rl-forward-char", mode="prompt")
config.bind("<Ctrl-H>", "rl-backward-delete-char", mode="prompt")
config.bind("<Ctrl-W>", "rl-backward-kill-word", mode="prompt")
config.bind("<Ctrl-K>", "rl-kill-line", mode="prompt")
config.bind("<Ctrl-X>", "prompt-open-download", mode="prompt")
config.bind("<Down>", "prompt-item-focus next", mode="prompt")
config.bind("<Escape>", "mode-leave", mode="prompt")
config.bind("<Return>", "prompt-accept", mode="prompt")
config.bind("V", "prompt-open-download --pdfjs", mode="prompt")
config.bind("<Shift-Tab>", "prompt-item-focus prev", mode="prompt")
config.bind("<Tab>", "prompt-item-focus next", mode="prompt")
config.bind("<Up>", "prompt-item-focus prev", mode="prompt")

## Bindings for hint mode
config.bind("<Ctrl-B>", "hint all tab-bg", mode="hint")
config.bind("<Ctrl-F>", "hint links", mode="hint")
config.bind("<Ctrl-R>", "hint --rapid links tab-bg", mode="hint")
config.bind("<Escape>", "mode-leave", mode="hint")
config.bind("<Return>", "hint-follow", mode="hint")

## Bindings for yesno mode
config.bind("<Alt-Shift-Y>", "prompt-yank --sel", mode="yesno")
config.bind("<Alt-Y>", "prompt-yank", mode="yesno")
config.bind("<Escape>", "mode-leave", mode="yesno")
config.bind("<Return>", "prompt-accept", mode="yesno")
config.bind("N", "prompt-accept --save no", mode="yesno")
config.bind("Y", "prompt-accept --save yes", mode="yesno")
config.bind("n", "prompt-accept no", mode="yesno")
config.bind("y", "prompt-accept yes", mode="yesno")

## Bindings for command mode
config.bind("<Return>", "command-accept", mode="command")
config.bind("<Escape>", "mode-leave", mode="command")
config.bind("<Ctrl-A>", "rl-beginning-of-line", mode="command")
config.bind("<Ctrl-B>", "rl-backward-char", mode="command")
config.bind("<Ctrl-C>", "completion-item-yank", mode="command")
config.bind("<Ctrl-C>", "rl-unix-line-discard", mode="command")
config.bind("<Ctrl-D>", "completion-item-del", mode="command")
config.bind("<Ctrl-E>", "rl-end-of-line", mode="command")
config.bind("<Ctrl-F>", "rl-forward-char", mode="command")
config.bind("<Ctrl-H>", "rl-backward-delete-char", mode="command")
config.bind("<Ctrl-W>", "rl-backward-kill-word", mode="command")
config.bind("<Ctrl-J>", "command-history-next", mode="command")
config.bind("<Ctrl-K>", "command-history-prev", mode="command")
config.bind("<Ctrl-N>", "completion-item-focus --history next", mode="command")
config.bind("<Down>", "completion-item-focus --history next", mode="command")
config.bind("<Ctrl-P>", "completion-item-focus --history prev", mode="command")
config.bind("<Up>", "completion-item-focus --history prev", mode="command")

## Bindings for passthrough mode
config.bind("<Shift-Escape>", "mode-leave", mode="passthrough")


## Bindings for caret mode
config.bind("$", "move-to-end-of-line", mode="caret")
config.bind("0", "move-to-start-of-line", mode="caret")
config.bind("<Ctrl-Space>", "selection-drop", mode="caret")
config.bind("<Escape>", "mode-leave", mode="caret")
config.bind("<Return>", "yank selection;; mode-leave", mode="caret")
config.bind("<Space>", "selection-toggle", mode="caret")
config.bind("G", "move-to-end-of-document", mode="caret")
config.bind("H", "scroll left", mode="caret")
config.bind("J", "scroll down", mode="caret")
config.bind("K", "scroll up", mode="caret")
config.bind("L", "scroll right", mode="caret")
config.bind("V", "selection-toggle --line", mode="caret")
config.bind("Y", "yank selection -s", mode="caret")
config.bind("[", "move-to-start-of-prev-block", mode="caret")
config.bind("]", "move-to-start-of-next-block", mode="caret")
config.bind("b", "move-to-prev-word", mode="caret")
config.bind("c", "mode-enter normal", mode="caret")
config.bind("e", "move-to-end-of-word", mode="caret")
config.bind("gg", "move-to-start-of-document", mode="caret")
config.bind("h", "move-to-prev-char", mode="caret")
config.bind("j", "move-to-next-line", mode="caret")
config.bind("k", "move-to-prev-line", mode="caret")
config.bind("l", "move-to-next-char", mode="caret")
config.bind("o", "selection-reverse", mode="caret")
config.bind("v", "selection-toggle", mode="caret")
config.bind("w", "move-to-next-word", mode="caret")
config.bind("y", "yank selection", mode="caret")
config.bind("{", "move-to-end-of-prev-block", mode="caret")
config.bind("}", "move-to-end-of-next-block", mode="caret")

config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103
c.bindings.commands["insert"] = {
    # editing
    "<escape>": "mode-leave",
    "<ctrl-f>": "fake-key <Right>",
    "<ctrl-b>": "fake-key <Left>",
    "<ctrl-a>": "fake-key <Home>",
    "<ctrl-e>": "fake-key <End>",
    "<ctrl-n>": "fake-key <Down>",
    "<ctrl-p>": "fake-key <Up>",
    "<alt-f>": "fake-key <Ctrl-Right>",
    "<alt-b>": "fake-key <Ctrl-Left>",
    "<ctrl-d>": "fake-key <Delete>",
    "<alt-d>": "fake-key <Ctrl-Delete>",
    "<alt-backspace>": "fake-key <Ctrl-Backspace>",
    "<ctrl-w>": "fake-key <Ctrl-backspace>",
    "<ctrl-h>": "fake-key <backspace>",
    "<ctrl-y>": "insert-text {primary}",
    "<ctrl-g>": "mode-leave",
}

config.bind("s", "spawn --userscript qute_search -g")
