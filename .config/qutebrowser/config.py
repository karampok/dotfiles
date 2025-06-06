# type: ignore
# pyright: ignore
# pylsp: disable

config.load_autoconfig(False)

# config.set("colors.webpage.darkmode.enabled", False)
config.set("auto_save.session", True)
config.set("content.local_content_can_access_remote_urls", True)
# config.set('content.javascript.enabled', True, 'file://*')
# config.set('content.javascript.enabled', True, 'chrome://*/*')
# config.set('content.javascript.enabled', True, 'qute://*/*')
#

config.set(
    "qt.args",
    [
        "ignore-gpu-blocklist",
        "enable-gpu-rasterization",
        "enable-accelerated-video-decode",
        "enable-quic",
        "enable-zero-copy",
    ],
)
config.set("content.images", True)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36",
    "*.slack.com",
)

config.set("content.javascript.clipboard", "access-paste")

# c.completion.height = '30%'
c.completion.open_categories = ["quickmarks"]  #'bookmarks', 'history']

#
# c.content.autoplay = False
# c.content.geolocation = False
# c.content.tls.certificate_errors = "ask-block-thirdparty"
# c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'
# Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'

# c.content.images = True
#
c.downloads.location.directory = "~/downloads/qb"
c.downloads.position = "bottom"
# c.downloads.remove_finished = 5
#
c.qt.args = ["auth-server-allowlist=*.redhat.com"]

# c.logging.level.console = 'debug'
# c.logging.level.ram = 'debug'
#
# #c.scrolling.bar = "always"
# c.scrolling.smooth = True
#
# c.search.ignore_case = 'smart'
#
# c.statusbar.position = 'bottom'
# c.statusbar.widgets = ['keypress', 'search_match', 'url', 'scroll', 'history', 'tabs', 'progress']
#
# c.tabs.background = True
# c.tabs.padding = {'top': 3, 'bottom': 3, 'left': 5, 'right': 5}
# c.tabs.position = "top"
c.tabs.show = "never"
#
# c.url.default_page = 'qute://bookmarks'
c.url.searchengines = {
    "gl": "https://www.google.com/search?q={}&pws=0&gl=us&gws_rd=cr",
    "ka": "https://kagi.com/search?q={}",
    "pe": "https://www.perplexity.ai/search?q={}",
    "DEFAULT": "https://www.perplexity.ai/search?q={}",
    "gh": "https://github.com/search?q={}",
}
# c.url.start_pages = 'qute://bookmarks'
c.content.pdfjs = True


#
# c.window.title_format = 'QB'
#
# config.source('colors.py')
# config.source('fonts.py')
config.source("key.py")
#
# Bindings for cycling through CSS stylesheets from Solarized Everything CSS:
# https://github.com/alphapapa/solarized-everything-css
# config.bind(',ap', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/apprentice/apprentice-all-sites.css ""')
# config.bind(',dr', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/darculized/darculized-all-sites.css ""')
# config.bind(',gr', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""')
# config.bind(',sd', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css ""')
# config.bind(',sl', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css ""')
