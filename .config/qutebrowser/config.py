config.load_autoconfig(True)

config.set("auto_save.session", True)
config.set("colors.webpage.darkmode.enabled", False)
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

c.completion.height = '30%'
c.completion.open_categories = [ 'quickmarks', 'bookmarks', 'history']

c.content.autoplay = False
c.content.geolocation = False
c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'
c.content.images = True

c.downloads.location.directory = '~/downloads/qb'
c.downloads.position = 'bottom'
c.downloads.remove_finished = 5

c.qt.args = ['auth-server-allowlist=*.redhat.com']

c.scrolling.bar = "always"
c.scrolling.smooth = False

c.search.ignore_case = 'smart'

c.statusbar.position = 'bottom'
c.statusbar.widgets = ['keypress', 'search_match', 'url', 'scroll', 'history', 'tabs', 'progress']

c.tabs.background = True
c.tabs.padding = {'top': 3, 'bottom': 3, 'left': 5, 'right': 5}
c.tabs.position = "top"

c.url.default_page = 'qute://bookmarks'
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}&pws=0&gl=us&gws_rd=cr','gh': 'https://github.com/search?q={}'}
c.url.start_pages = 'qute://bookmarks'

c.window.title_format = 'QB'

config.source('colors.py')
config.source('fonts.py')
config.source('key.py')
